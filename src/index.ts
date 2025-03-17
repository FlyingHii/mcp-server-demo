// src/index.ts
import { takeScreenshot } from './index'; // Assuming index.js exports takeScreenshot

async function main() {
  try {
    await takeScreenshot({
      url: 'https://www.google.com',
      outputPath: 'google-ts.png', // Different output path to distinguish
      viewportWidth: 1280,
      viewportHeight: 720,
    });
    console.log('Screenshot taken successfully from TypeScript!');
  } catch (error) {
    console.error('Error taking screenshot from TypeScript:', error);
  }
}

main();
