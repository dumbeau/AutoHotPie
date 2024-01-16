const fs = require('fs');
const path = require('path');

//Skip these files!
let exludedFiles = ['main.js','preload.js'];
let exludedDirectories = ['assets','ignore','main','build'];
let priorityFolders = ['lib', 'classes','autohotpie','pages'];
let startFiles = [];
let endFiles = ['initializePages.js'];

function getRendererScripts(dir, fileList = []) {
    const files = fs.readdirSync(dir);

    // Loop through the priority folders first
    priorityFolders.forEach(folder => {
        const folderPath = path.join(dir, folder);
        // Check if the folder exists in the current directory
        if (fs.existsSync(folderPath) && fs.statSync(folderPath).isDirectory()) {
            // Recursively traverse the folder
            getRendererScripts(folderPath, fileList);
        }
    });
    var endFileList = [];

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
                // console.log("Skipped directory");
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

// Usage
const tsFiles = getRendererScripts('./src/');

let htmlFilePaths = [];
tsFiles.forEach((tsFile) => { 
    const test1 = exludedFiles.some(el => tsFile.includes(el));
    if (!test1){   
    tsFile = tsFile.replace('src\\', '');
    tsFile = tsFile.replace('.ts', '.js');    
    htmlFilePaths.push(tsFile);
    }
});
let includeString = '';
htmlFilePaths.forEach((htmlFilePath) => {
    includeString = includeString + '<script src=\"./' + htmlFilePath + '\"></script>\n'
});

// specify the file path
const filePath = './src/index.html';
const textToReplace = includeString;

fs.readFile(filePath, 'utf8', function(err, data) {
    if (err) {
        return console.log(err);
    }

    //Check if text should be inserted instead   
    var startString = '<!-- UPDATED ON COMPILE -->';
    var endString = '<!-- END OF UPDATED ON COMPILE -->';
    var insertString = includeString;

    //Find the start and end index of the text to replace
    
    var startIndex = data.indexOf(startString);
    var endIndex = data.indexOf(endString);
    
    if(startIndex >= 0 && endIndex >= 0) {

        //Replace all the text between the start and end string with the insert string
        data = data.substring(0, startIndex + startString.length)+ "\n" + insertString + data.substring(endIndex);           

    } else {        
        // replace the text
        const textToFind = '<script src=\"file:///ReplaceWithRendererScripts\"></script>';
        data = data.replace(new RegExp(textToFind, 'g'), startString+ "\n" + textToReplace + endString);  
        console.log("Added Renderer scripts to index.html");
    }

    //Set hidden tabs to be hidden
    const hiddenTabElementName = 'hidden-tab-items';
    const hiddenTabElementString = 'name=\"' + hiddenTabElementName + '\">'
    const newHiddenTabElementString = 'name=\"' + hiddenTabElementName + '\" style=\"display:none\">'
    data = data.replace(new RegExp(hiddenTabElementString, 'g'), newHiddenTabElementString);

    // write the new file contents
    fs.writeFile(filePath, data, 'utf8', function(err) {
        if (err) {
            return console.log(err);
        }
    });
});

