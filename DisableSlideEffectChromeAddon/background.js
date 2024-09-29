chrome.runtime.onInstalled.addListener(() => {
    chrome.scripting.registerContentScripts([
        {
            id: 'disableSlides',
            matches: ['<all_urls>'],
            js: ['content.js']
        }
    ]);
});
