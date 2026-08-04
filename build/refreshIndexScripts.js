const fs = require('fs');
const path = require('path');

//Skip these files!
const exludedFiles = ['main.js', 'preload.js'];
const exludedDirectories = ['assets', 'ignore', 'main', 'build', 'shared'];
const priorityFolders = ['lib', 'classes', 'autohotpie', 'pages', 'domain', 'services', 'bootstrap'];
const endFiles = ['initializePages.js'];

function getRendererScripts(dir, fileList = []) {
    const files = fs.readdirSync(dir);

    priorityFolders.forEach(folder => {
        const folderPath = path.join(dir, folder);
        if (fs.existsSync(folderPath) && fs.statSync(folderPath).isDirectory()) {
            getRendererScripts(folderPath, fileList);
        }
    });
    const endFileList = [];

    files.forEach(file => {
        const filePath = path.join(dir, file);
        const stat = fs.statSync(filePath);

        if (stat.isDirectory()) {
            if (priorityFolders.includes(file)) {
                return;
            }
            if (exludedDirectories.some(exludedDirectory => filePath.endsWith(exludedDirectory))) {
                // skipped
            } else {
                getRendererScripts(filePath, fileList);
            }
        } else if (path.extname(file) === '.js') {
            if (endFiles.includes(file)) {
                endFileList.push(filePath);
            } else {
                fileList.push(filePath);
            }
        } else if (path.extname(file) === '.ts') {
            fileList.push(filePath);
        }
    });
    fileList.push(...endFileList);

    return fileList;
}

function toHtmlScriptPaths(scriptFiles) {
    const htmlFilePaths = [];
    scriptFiles.forEach((tsFile) => {
        const excluded = exludedFiles.some(el => tsFile.includes(el));
        if (!excluded) {
            let normalized = tsFile.replace(/\\/g, '/');
            normalized = normalized.replace(/^src\//, '');
            normalized = normalized.replace(/\.ts$/, '.js');
            htmlFilePaths.push(normalized);
        }
    });
    return htmlFilePaths;
}

function buildIncludeString(htmlFilePaths) {
    return htmlFilePaths.map((htmlFilePath) => `<script src="./${htmlFilePath}"></script>`).join('\n') + '\n';
}

function applyScriptBlock(data, includeString) {
    const startString = '<!-- UPDATED ON COMPILE -->';
    const endString = '<!-- END OF UPDATED ON COMPILE -->';
    const startIndex = data.indexOf(startString);
    const endIndex = data.indexOf(endString);

    let next = data;
    if (startIndex >= 0 && endIndex >= 0) {
        next = data.substring(0, startIndex + startString.length) + '\n' + includeString + data.substring(endIndex);
    } else {
        const textToFind = '<script src="file:///ReplaceWithRendererScripts"></script>';
        next = data.replace(new RegExp(textToFind, 'g'), startString + '\n' + includeString + endString);
    }

    const hiddenTabElementName = 'hidden-tab-items';
    const hiddenTabElementString = 'name="' + hiddenTabElementName + '">';
    const newHiddenTabElementString = 'name="' + hiddenTabElementName + '" style="display:none">';
    next = next.replace(new RegExp(hiddenTabElementString, 'g'), newHiddenTabElementString);
    return next;
}

function computeUpdatedIndexHtml(srcDir = './src/', htmlPath = './src/index.html') {
    const scriptFiles = getRendererScripts(srcDir);
    const htmlFilePaths = toHtmlScriptPaths(scriptFiles);
    const includeString = buildIncludeString(htmlFilePaths);
    const current = fs.readFileSync(htmlPath, 'utf8');
    return applyScriptBlock(current, includeString);
}

function main(argv = process.argv.slice(2)) {
    const checkOnly = argv.includes('--check');
    const htmlPath = './src/index.html';
    const updated = computeUpdatedIndexHtml('./src/', htmlPath);
    const current = fs.readFileSync(htmlPath, 'utf8');

    if (checkOnly) {
        if (current !== updated) {
            console.error('src/index.html script block is out of date. Run: npm run refresh-index-scripts');
            process.exit(1);
        }
        console.log('src/index.html script block is up to date.');
        return;
    }

    fs.writeFileSync(htmlPath, updated, 'utf8');
    console.log('Updated renderer scripts in src/index.html');
}

module.exports = {
    getRendererScripts,
    toHtmlScriptPaths,
    buildIncludeString,
    applyScriptBlock,
    computeUpdatedIndexHtml,
    main,
};

if (require.main === module) {
    main();
}
