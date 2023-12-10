const fs = require('fs');
const path = require('path');

//Skip these files!
let exludedFiles = ['main.ts','preload.ts','PieMenuOverlay.ts'];
let exludedDirectories = ['assets','ignore'];
let priorityFolders = ['lib', 'classes','autohotpie','pages'];

function getTypescriptFiles(dir, fileList = []) {
    const files = fs.readdirSync(dir);

    // Loop through the priority folders first
    priorityFolders.forEach(folder => {
        const folderPath = path.join(dir, folder);
        // Check if the folder exists in the current directory
        if (fs.existsSync(folderPath) && fs.statSync(folderPath).isDirectory()) {
            // Recursively traverse the folder
            getTypescriptFiles(folderPath, fileList);
        }
    });

    // Loop through the rest of the files/folders
    files.forEach(file => {
        const filePath = path.join(dir, file);
        const stat = fs.statSync(filePath);

        if (stat.isDirectory()) {
            // Skip the priority folders as they have been traversed already
            if (priorityFolders.includes(file)) {
                return;
            }
            // Skip the excluded directories
            if (exludedDirectories.some(exludedDirectory => filePath.endsWith(exludedDirectory))) {
                console.log("Skipped directory");
            } else {
                getTypescriptFiles(filePath, fileList);
            }
        } else if (path.extname(file) === '.js') {
            fileList.unshift(filePath);
        } else if (path.extname(file) === '.ts') {
            fileList.push(filePath);
        }
    });

    return fileList;
}

// Usage
const tsFiles = getTypescriptFiles('./src/');

let htmlFilePaths = [];
tsFiles.forEach((tsFile) => { 
    const test1 = exludedFiles.some(el => tsFile.includes(el));
    if (!test1){   
    tsFile = tsFile.replace('src\\', 'dist\\');
    tsFile = tsFile.replace('.ts', '.js');    
    htmlFilePaths.push(tsFile);
    }
});
let includeString = '';
htmlFilePaths.forEach((htmlFilePath) => {
    includeString = includeString + '<script src=\"file:///' + htmlFilePath + '\"></script>\n'
});
console.log(includeString);




// specify the file path
const filePath = './src/index.html';

// specify the text to find and the text to replace it with


const textToReplace = includeString;

// read the file
fs.readFile(filePath, 'utf8', function(err, data) {
    if (err) {
        return console.log(err);
    }

    //Check if text should be inserted instead   
    var startString = '<!-- UPDATED ON COMPILE -->\n';
    var endString = '<!-- END OF UPDATED ON COMPILE -->';
    var insertString = includeString;
    
    var startIndex = data.indexOf(startString);    
    var endIndex = data.indexOf(endString);
   
    if(startIndex >= 0 && endIndex >= 0) {
        var newData = data.substring(0, startIndex + startString.length) + insertString + data.substring(endIndex);
        
        fs.writeFile(filePath, newData, 'utf8', function (err) {
           if (err) return console.log(err);
        });
    } else {
        
        // replace the text
        const textToFind = '<script src=\"file:///ReplaceWithRendererScripts\"></script>';

        const result = data.replace(new RegExp(textToFind, 'g'), startString + textToReplace + endString);

        // write the new content to the file
        fs.writeFile(filePath, result, 'utf8', function(err) {
            if (err) {
                return console.log(err);
            }
        });

    }




    
});