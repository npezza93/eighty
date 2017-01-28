const {app, BrowserWindow, Tray, Menu} = require('electron');
const path = require('path');
const url = require('url');

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let appIcon = null;
let tray = null;
let win = null;

function createWindow () {
  // Create the browser window.
  win = new BrowserWindow({
    width: 1050,
    height: 700,
    show: true,
    titleBarStyle: 'hidden',
    icon: __dirname+'/app/assets/images/rounded-logo.png',
    webPreferences: {
      nodeIntegration: false
    }
  });

  // and load the index.html of the app.
  win.loadURL("http://localhost:3000/notes");
  win.openDevTools();
  // Emitted when the window is closed.
  win.on('closed', () => {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    win = null
  });

  appIcon = new Tray('/Users/npezza/Documents/projects/noted/app/assets/images/rounded-logo.png');
  appIcon.setToolTip('Eighty');
}

// Quit when all windows are closed.
app.on('window-all-closed', () => {
  // On macOS it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  // On macOS it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (win === null) {
    createWindow()
  }
})

app.on('ready', createWindow)
