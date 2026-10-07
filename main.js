const { app, BrowserWindow } = require('electron');
const path = require('path');

// 하드웨어 가속 및 WebGL 성능 최적화 플래그
app.commandLine.appendSwitch('ignore-gpu-blocklist');
app.commandLine.appendSwitch('enable-gpu-rasterization');
app.commandLine.appendSwitch('enable-zero-copy');

function createWindow () {
  const win = new BrowserWindow({
    width: 1366,
    height: 768,
    autoHideMenuBar: true,
    show: false, // 준비되기 전까지 창 숨김 (흰 화면 방지)
    backgroundColor: '#231F20', // Unity 기본 다크 배경색 설정
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true
    }
  });

  win.loadFile('index.html');

  // 파일 로드가 어느 정도 완료되고 화면을 그릴 준비가 되면 창을 띄움
  win.once('ready-to-show', () => {
    win.show();
  });
}

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});
