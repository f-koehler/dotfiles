// always ask where store downloaded files
user_pref("browser.download.useDownloadDir", false);

// UI layout
user_pref(
  "browser.uiCustomization.state",
  '{"placements":{"widget-overflow-fixed-list":["floccus_handmadeideas_org-browser-action","cookieautodelete_kennydo_com-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","firefoxcolor_mozilla_com-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","customizableui-special-spring1","urlbar-container","customizableui-special-spring2","developer-button","downloads-button","library-button","sidebar-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action","addon_darkreader_org-browser-action","keepassxc-browser_keepassxc_org-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["developer-button","profiler-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","cookieautodelete_kennydo_com-browser-action","addon_darkreader_org-browser-action","keepassxc-browser_keepassxc_org-browser-action","floccus_handmadeideas_org-browser-action","firefoxcolor_mozilla_com-browser-action"],"dirtyAreaCache":["nav-bar","toolbar-menubar","TabsToolbar","PersonalToolbar","widget-overflow-fixed-list"],"currentVersion":16,"newElementCount":5}'
);

// set startup page
user_pref("browser.startup.homepage", "https://hckrnews.com");

// point firefox to my custom sync server
user_pref(
  "identity.sync.tokenserver.uri",
  "https://firefox.fkoehler.xyz/token/1.0/sync/1.5"
);
