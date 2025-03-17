const { takeScreenshot } = require('./puppeteer');

async function run() {
  try {
    await takeScreenshot({
      url: 'https://www.google.com',
      outputPath: 'google.png',
      viewportWidth: 1280, // Example viewport width
      viewportHeight: 720, // Example viewport height
    });
  } catch (error) {
    console.error('Failed to take screenshot:', error);
  }
}

run();
