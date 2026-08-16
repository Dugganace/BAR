const CATALOG = window.CATALOG;
const presetNames = Object.keys(CATALOG).sort();

let currentSelection = null; // { preset, slot }
const openPresets = new Set(); // preset names the user has expanded -- persists across re-renders

function el(tag, attrs = {}, children = []) {
	const node = document.createElement(tag);
	for (const [k, v] of Object.entries(attrs)) {
		if (k === 'class') node.className = v;
		else if (k === 'text') node.textContent = v;
		else if (k.startsWith('on') && typeof v === 'function') node.addEventListener(k.slice(2), v);
		else node.setAttribute(k, v);
	}
	for (const c of [].concat(children)) {
		if (c == null) continue;
		node.appendChild(typeof c === 'string' ? document.createTextNode(c) : c);
	}
	return node;
}

function escapeHtml(s) {
	return s.replace(/[&<>]/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;' }[c]));
}

function highlight(text, query) {
	if (!query) return escapeHtml(text);
	const escaped = escapeHtml(text);
	const q = query.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
	return escaped.replace(new RegExp('(' + q + ')', 'ig'), '<mark>$1</mark>');
}

function renderSidebar(filterQuery) {
	const sidebar = document.getElementById('sidebar');
	sidebar.innerHTML = '';
	const q = (filterQuery || '').toLowerCase();

	let totalSlots = 0, matchedPresets = 0;

	for (const presetName of presetNames) {
		const preset = CATALOG[presetName];
		const slotEntries = Object.entries(preset.slots);
		totalSlots += slotEntries.length;

		let matchingSlots = slotEntries;
		if (q) {
			matchingSlots = slotEntries.filter(([slot, data]) =>
				presetName.toLowerCase().includes(q) ||
				slot.toLowerCase().includes(q) ||
				(data.header || '').toLowerCase().includes(q) ||
				(data.unitIds || []).some(u => u.toLowerCase().includes(q)) ||
				data.text.toLowerCase().includes(q)
			);
			if (matchingSlots.length === 0) continue;
		}
		matchedPresets++;

		const group = el('div', { class: 'preset-group' });
		const nameRow = el('div', { class: 'preset-name' }, [
			presetName,
			el('span', { class: 'preset-map', text: preset.map }),
		]);
		const isOpen = q ? true : openPresets.has(presetName);
		const slotList = el('div', { class: 'slot-list' + (isOpen ? ' open' : '') });

		for (const [slot, data] of matchingSlots) {
			const isActive = currentSelection && currentSelection.preset === presetName && currentSelection.slot === slot;
			const item = el('div', {
				class: 'slot-item' + (isActive ? ' active' : ''),
				text: `${slot} (${data.length})`,
				onclick: () => { currentSelection = { preset: presetName, slot }; openPresets.add(presetName); render(); },
			});
			slotList.appendChild(item);
		}

		nameRow.addEventListener('click', () => {
			if (openPresets.has(presetName)) openPresets.delete(presetName);
			else openPresets.add(presetName);
			slotList.classList.toggle('open');
		});

		group.appendChild(nameRow);
		group.appendChild(slotList);
		sidebar.appendChild(group);
	}

	document.getElementById('stats').textContent = q
		? `${matchedPresets} preset(s) match`
		: `${presetNames.length} presets, ${totalSlots} tweak slots`;
}

let showRawCode = false;

function renderContent(filterQuery) {
	const content = document.getElementById('content');
	content.innerHTML = '';
	if (!currentSelection) {
		content.appendChild(el('p', { class: 'hint', text: 'Pick a preset on the left, or search above.' }));
		return;
	}
	const { preset, slot } = currentSelection;
	const data = CATALOG[preset] && CATALOG[preset].slots[slot];
	if (!data) {
		content.appendChild(el('p', { class: 'hint', text: 'Not found (try re-selecting).' }));
		return;
	}

	content.appendChild(el('h2', { text: `${preset} — ${slot}` }));
	content.appendChild(el('div', { class: 'meta-row', text: `Map: ${CATALOG[preset].map || '(unknown)'} | ${data.length} chars` }));
	if (data.header) content.appendChild(el('div', { class: 'meta-row', text: 'Header: ' + data.header }));

	// Plain-English default: show each unit this slot defines/overrides as a
	// visual card (icon, name, tooltip) using the same data the Preset
	// Explorer/Custom Content Catalog use -- raw code is available on request
	// via the toggle below, not the default view.
	const presetItems = (window.CUSTOM_CONTENT && window.CUSTOM_CONTENT[preset] && window.CUSTOM_CONTENT[preset].items) || [];
	const itemsById = new Map(presetItems.map(i => [i.id, i]));
	const idsInSlot = data.unitIds || [];
	const knownItems = idsInSlot.map(id => itemsById.get(id)).filter(Boolean);

	if (knownItems.length) {
		const grid = el('div', { class: 'summary-grid' });
		for (const item of knownItems) {
			grid.appendChild(el('div', { class: 'summary-card' }, [
				item.baseIcon
					? el('img', { src: `../../bar-unit-database/icons-png/${item.baseIcon}` })
					: el('div', { class: 'icon-placeholder' }),
				el('div', { class: 'sc-name', text: item.name }),
				item.tooltip ? el('div', { class: 'sc-id', text: item.tooltip }) : null,
				el('div', { class: 'sc-id', text: `${item.id} (from ${item.baseId})` }),
			]));
		}
		content.appendChild(grid);
	} else if (idsInSlot.length) {
		content.appendChild(el('p', { class: 'hint', text: `Defines/overrides ${idsInSlot.length} unit id(s), but couldn't match them to known display info: ${idsInSlot.slice(0, 15).join(', ')}` }));
	} else {
		content.appendChild(el('p', { class: 'hint', text: 'No new/overridden unit ids detected in this slot (may be a settings-only tweak).' }));
	}

	if (idsInSlot.length) {
		const tagRow = el('div', { class: 'unit-tags' });
		for (const id of idsInSlot) {
			tagRow.appendChild(el('span', {
				class: 'unit-tag', text: id,
				onclick: () => { document.getElementById('search').value = id; onSearch(); },
			}));
		}
		content.appendChild(tagRow);
	}

	const btnRow = el('div', { style: 'display:flex; gap:8px; margin-bottom:10px' }, [
		el('button', {
			text: 'Copy full code',
			onclick: () => navigator.clipboard.writeText(data.text).catch(() => {}),
		}),
		el('button', {
			text: showRawCode ? 'Hide raw code' : 'Show raw code',
			onclick: () => { showRawCode = !showRawCode; render(); },
		}),
	]);
	content.appendChild(btnRow);

	if (showRawCode) {
		const pre = el('pre');
		pre.innerHTML = highlight(data.text, filterQuery);
		content.appendChild(pre);
	}
}

function render() {
	const q = document.getElementById('search').value.trim();
	renderSidebar(q);
	renderContent(q);
}

function onSearch() { render(); }

window.addEventListener('DOMContentLoaded', () => {
	document.getElementById('search').addEventListener('input', onSearch);
	render();
});
