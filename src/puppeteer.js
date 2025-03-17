const puppeteer = require('puppeteer');

async function takeScreenshot(options) {
  const { url, outputPath, viewportWidth, viewportHeight } = options;

  if (!url) {
    throw new Error('URL is required');
  }
  if (!outputPath) {
    throw new Error('outputPath is required');
  }

  let browser;
  try {
    browser = await puppeteer.launch();
    const page = await browser.newPage();

    if (viewportWidth && viewportHeight) {
      await page.setViewport({ width: viewportWidth, height: viewportHeight });
    }

    await page.goto(url, { waitUntil: 'networkidle0' }); // Wait for network to be idle

    await page.screenshot({ path: outputPath });
    console.log(`Screenshot saved to ${outputPath}`);
  } catch (error) {
    console.error('Error taking screenshot:', error);
    throw error; // Re-throw the error to be handled by the caller
  } finally {
    if (browser) {
      await browser.close();
    }
  }
}

module.exports = {
  takeScreenshot,
};
