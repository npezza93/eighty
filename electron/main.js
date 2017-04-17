const {app, BrowserWindow, Tray, Menu} = require("electron");
const path = require("path");
const url = require("url");

// Keep a global reference of the window object, if you don"t, the window will
// be closed automatically when the JavaScript object is garbage collected.
let appIcon = null;
let tray    = null;
let win     = null;
let about   = null;

function createWindow () {
  // Create the browser window.
  win = new BrowserWindow({
    width: 1050,
    height: 700,
    show: true,
    titleBarStyle: "hidden",
    icon: __dirname + "/rounded-logo.png",
    webPreferences: {
      nodeIntegration: false
    }
  });

  var template = [{
    label: "Eighty",
    submenu: [
      { label: "About Eighty", click: function() {
        about = new BrowserWindow({
          width: 400,
          height: 765,
          show: true,
          titleBarStyle: "hidden",
          icon: __dirname + "/rounded-logo.png",
          webPreferences: {
            nodeIntegration: false
          }
        });

        about.loadURL("https://eighty.herokuapp.com/about");

      } },
      { type: "separator" },
      { label: "Quit", accelerator: "Command+Q", click: function() { app.quit(); }}
    ]}, {
      label: "Edit",
      submenu: [
        { label: "Undo", accelerator: "CmdOrCtrl+Z", selector: "undo:" },
        { label: "Redo", accelerator: "Shift+CmdOrCtrl+Z", selector: "redo:" },
        { type: "separator" },
        { label: "Cut", accelerator: "CmdOrCtrl+X", selector: "cut:" },
        { label: "Copy", accelerator: "CmdOrCtrl+C", selector: "copy:" },
        { label: "Paste", accelerator: "CmdOrCtrl+V", selector: "paste:" },
        { label: "Select All", accelerator: "CmdOrCtrl+A", selector: "selectAll:" }
    ]}
  ];

  Menu.setApplicationMenu(Menu.buildFromTemplate(template));
  // and load the index.html of the app.
  win.loadURL("https://eighty.herokuapp.com");

  // Emitted when the window is closed.
  win.on("closed", () => {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    win = null
  });
}

// Quit when all windows are closed.
app.on("window-all-closed", () => {
  // On macOS it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== "darwin") {
    app.quit();
  }
})

app.on("activate", () => {
  // On macOS it"s common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (win === null) {
    createWindow();
  }
})

app.on("ready", () => {
  createWindow();
})
