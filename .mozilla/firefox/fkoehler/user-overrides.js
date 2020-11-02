// always ask where store downloaded files
user_pref("browser.download.useDownloadDir", false);

// set startup page
user_pref("browser.startup.homepage", "https://hckrnews.com");

// point firefox to my custom sync server
user_pref(
  "identity.sync.tokenserver.uri",
  "https://firefox.fkoehler.xyz/token/1.0/sync/1.5"
);

// disabling letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", false);

// enable search in the urlbar
user_pref("keyword.enabled", true);

// do not clear cookies and history on shutdown
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.history", false);

// allow web assembly
user_pref("javascript.options.wasm", true);
