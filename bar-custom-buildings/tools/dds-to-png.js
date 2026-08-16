// Minimal DDS -> PNG converter for the simple case BAR unit icons use:
// uncompressed 32-bit ARGB/BGRA, no mipmaps needed (just the top level).
// Not a general DDS decoder -- doesn't handle DXT1/3/5 block compression.
const fs = require('fs');
const { PNG } = require('pngjs');

function convert(ddsPath, pngPath) {
	const buf = fs.readFileSync(ddsPath);
	if (buf.toString('ascii', 0, 4) !== 'DDS ') throw new Error('Not a DDS file: ' + ddsPath);
	const height = buf.readUInt32LE(12);
	const width = buf.readUInt32LE(16);
	const pfFlags = buf.readUInt32LE(80);
	const rgbBitCount = buf.readUInt32LE(88);
	const rMask = buf.readUInt32LE(92);
	const gMask = buf.readUInt32LE(96);
	const bMask = buf.readUInt32LE(100);
	const aMask = buf.readUInt32LE(104);
	const FOURCC = 0x4;
	if (pfFlags & FOURCC) {
		throw new Error('Compressed (FourCC) DDS not supported by this simple converter: ' + ddsPath);
	}
	if (rgbBitCount !== 32) {
		throw new Error('Only 32bpp uncompressed DDS supported, got ' + rgbBitCount + 'bpp: ' + ddsPath);
	}
	const dataStart = 128;
	const png = new PNG({ width, height });
	function shiftFor(mask) {
		if (mask === 0) return -1;
		let shift = 0;
		while (!(mask & 1)) { mask >>= 1; shift++; }
		return shift;
	}
	const rShift = shiftFor(rMask), gShift = shiftFor(gMask), bShift = shiftFor(bMask), aShift = shiftFor(aMask);
	for (let y = 0; y < height; y++) {
		for (let x = 0; x < width; x++) {
			const srcOff = dataStart + (y * width + x) * 4;
			const pixel = buf.readUInt32LE(srcOff);
			const dstOff = (y * width + x) * 4;
			png.data[dstOff] = rShift >= 0 ? (pixel >>> rShift) & 0xff : 0;
			png.data[dstOff + 1] = gShift >= 0 ? (pixel >>> gShift) & 0xff : 0;
			png.data[dstOff + 2] = bShift >= 0 ? (pixel >>> bShift) & 0xff : 0;
			png.data[dstOff + 3] = aShift >= 0 ? (pixel >>> aShift) & 0xff : 255;
		}
	}
	png.pack().pipe(fs.createWriteStream(pngPath));
}

module.exports = { convert };

if (require.main === module) {
	const [,, inPath, outPath] = process.argv;
	convert(inPath, outPath);
	console.log('Wrote', outPath);
}
