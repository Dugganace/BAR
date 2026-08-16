const fs = require('fs');
const path = require('path');
const db = JSON.parse(fs.readFileSync(path.join(__dirname, 'units-database.json'), 'utf8'));
const outDir = path.join(__dirname, 'viewer');
if (!fs.existsSync(outDir)) fs.mkdirSync(outDir);
fs.writeFileSync(path.join(outDir, 'data.js'), `window.UNITS_DB = ${JSON.stringify(db)};\n`, 'utf8');
console.log('Wrote viewer/data.js with', Object.keys(db).length, 'units.');
