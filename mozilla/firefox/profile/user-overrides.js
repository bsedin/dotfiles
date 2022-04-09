/* 0102: set startup page [SETUP-CHROME]
 * 0=blank, 1=home, 2=last visited page, 3=resume previous session
 * [NOTE] Session Restore is cleared with history (2811, 2812), and not used in Private Browsing mode
 * [SETTING] General>Startup>Restore previous session ***/
user_pref("browser.startup.page", 3);
/** COOKIES + SITE DATA : ALLOWS EXCEPTIONS ***/
/* 2801: delete cookies and site data on exit
 * 0=keep until they expire (default), 2=keep until you close Firefox
 * [NOTE] A "cookie" block permission also controls localStorage/sessionStorage, indexedDB,
 * sharedWorkers and serviceWorkers. serviceWorkers require an "Allow" permission
 * [SETTING] Privacy & Security>Cookies and Site Data>Delete cookies and site data when Firefox is closed
 * [SETTING] to add site exceptions: Ctrl+I>Permissions>Cookies>Allow
 * [SETTING] to manage site exceptions: Options>Privacy & Security>Permissions>Settings ***/
user_pref("network.cookie.lifetimePolicy", 0);
/** SANITIZE ON SHUTDOWN : ALL OR NOTHING ***/
/* 2810: enable Firefox to clear items on shutdown (2811)
 * [SETTING] Privacy & Security>History>Custom Settings>Clear history when Firefox closes ***/
user_pref("privacy.sanitize.sanitizeOnShutdown", false);
/* 2811: set/enforce what items to clear on shutdown (if 2810 is true) [SETUP-CHROME]
 * These items do not use exceptions, it is all or nothing (1681701)
 * [NOTE] If "history" is true, downloads will also be cleared
 * [NOTE] "sessions": Active Logins: refers to HTTP Basic Authentication [1], not logins via cookies
 * [NOTE] "offlineApps": Offline Website Data: localStorage, service worker cache, QuotaManager (IndexedDB, asm-cache)
 * [SETTING] Privacy & Security>History>Custom Settings>Clear history when Firefox closes>Settings
 * [1] https://en.wikipedia.org/wiki/Basic_access_authentication ***/
user_pref("privacy.clearOnShutdown.cache", false);     // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.downloads", false); // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.formdata", false);  // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.history", false);   // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.sessions", false);  // [DEFAULT: true]
user_pref("privacy.clearOnShutdown.offlineApps", false); // [DEFAULT: false]
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.siteSettings", false); // [DEFAULT: false]

/* 2814: reset default "Time range to clear" for "Clear Recent History" (2812)
 * Firefox remembers your last choice. This will reset the value when you start Firefox
 * 0=everything, 1=last hour, 2=last two hours, 3=last four hours, 4=today
 * [NOTE] Values 5 (last 5 minutes) and 6 (last 24 hours) are not listed in the dropdown,
 * which will display a blank value, and are not guaranteed to work ***/
user_pref("privacy.sanitize.timeSpan", 2);

// -------------------------------------------------------------------------- //

user_pref("geo.enabled", false);
user_pref("full-screen-api.enabled", false);
user_pref("permissions.default.geo", 0);
user_pref("permissions.default.camera", 0);
user_pref("permissions.default.microphone", 0);
user_pref("permissions.default.desktop-notification", 0);
user_pref("permissions.default.xr", 0); // Virtual Reality

/* 7015: enable the DNT (Do Not Track) HTTP header
 * [WHY] DNT is enforced with Tracking Protection which is used in ETP Strict (2701) ***/
user_pref("privacy.donottrackheader.enabled", true);

/* 1001: disable disk cache
 * [SETUP-CHROME] If you think disk cache helps perf, then feel free to override this
 * [NOTE] We also clear cache on exit (2811) ***/
user_pref("browser.cache.disk.enable", true);

user_pref("keyword.enabled", true);

/* 2802: delete cache on exit [FF96+]
 * [NOTE] We already disable disk cache (1001) and clear on exit (2811) which is more robust
 * [1] https://bugzilla.mozilla.org/1671182 ***/
user_pref("privacy.clearsitedata.cache.enabled", false);

/* 2812: reset default items to clear with Ctrl-Shift-Del (to match 2811) [SETUP-CHROME]
 * This dialog can also be accessed from the menu History>Clear Recent History
 * Firefox remembers your last choices. This will reset them when you start Firefox
 * [NOTE] Regardless of what you set "downloads" to, as soon as the dialog
 * for "Clear Recent History" is opened, it is synced to the same as "history" ***/
user_pref("privacy.cpd.cache", false);    // [DEFAULT: true]
user_pref("privacy.cpd.formdata", false); // [DEFAULT: true]
user_pref("privacy.cpd.history", false);  // [DEFAULT: true]
user_pref("privacy.cpd.sessions", false); // [DEFAULT: true]
user_pref("privacy.cpd.offlineApps", false); // [DEFAULT: false]
user_pref("privacy.cpd.cookies", false);
   // user_pref("privacy.cpd.downloads", true); // not used, see note above
   // user_pref("privacy.cpd.passwords", false); // [DEFAULT: false] not listed
   // user_pref("privacy.cpd.siteSettings", false); // [DEFAULT: false]
/* 2813: clear Session Restore data when sanitizing on shutdown or manually [FF34+]
 * [NOTE] Not needed if Session Restore is not used (0102) or it is already cleared with history (2811)
 * [NOTE] privacy.clearOnShutdown.openWindows prevents resuming from crashes (also see 5008)
 * [NOTE] privacy.cpd.openWindows has a bug that causes an additional window to open ***/
   // user_pref("privacy.clearOnShutdown.openWindows", true);
   // user_pref("privacy.cpd.openWindows", true);
/* 1003: disable storing extra session data [SETUP-CHROME]
 * define on which sites to save extra session data such as form content, cookies and POST data
 * 0=everywhere, 1=unencrypted sites, 2=nowhere ***/
user_pref("browser.sessionstore.privacy_level", 0);
