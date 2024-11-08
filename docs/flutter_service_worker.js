'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "cb7c47e894c3cbafeb5a03278820ef58",
"version.json": "717b276e1936b83514baa9dd1ef1dd0b",
"index.html": "af3056c1bc39aa6eda19020c3f8e6b44",
"/": "af3056c1bc39aa6eda19020c3f8e6b44",
"main.dart.js": "97bdb3655689b9ef0c4e66ec1dd90fd4",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "294cc04637edd5e416104c9e6414123d",
"icons/Icon-192.png": "dd140ddde6c212924e3ccccf132b9a23",
"icons/Icon-maskable-192.png": "dd140ddde6c212924e3ccccf132b9a23",
"icons/Icon-maskable-512.png": "bfa20dfd9ef3b9dd09bd47fc00147d61",
"icons/Icon-512.png": "bfa20dfd9ef3b9dd09bd47fc00147d61",
"manifest.json": "cdd3d639dcc94fe0abd7fb385950636a",
"assets/AssetManifest.json": "88592b8067397b43e424e36148ed7387",
"assets/NOTICES": "21efa73ae2a224c548f4bf93825f93c9",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "3a06c409f32075e084f65f97383ea0a0",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/1.5x/powered_by_google_on_non_white.png": "a0bdd851f1d00d131f005c60ed2cb16b",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/1.5x/powered_by_google_on_white.png": "c7e713340ff7ad9e1af8482ad2a71349",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/2.0x/powered_by_google_on_non_white.png": "e72d1907bf5d0f6c1153e50aa7cf7f9a",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/2.0x/powered_by_google_on_white.png": "60e8a8323a1f5c9dc59c6783d5974123",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/powered_by_google_on_non_white.png": "27efb6d97555008ec637e8c5a6833f82",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/3.0x/powered_by_google_on_non_white.png": "97f2acfb6e993a0c4134d9d04dff21e2",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/3.0x/powered_by_google_on_white.png": "40bc3ae5444eae0b9228d83bfd865158",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/4.0x/powered_by_google_on_non_white.png": "33ff537622b33a8a161646a7be0800d0",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/4.0x/powered_by_google_on_white.png": "cbb17d77d4436ba71593febe71599b53",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/0.75x/powered_by_google_on_non_white.png": "78b06d238cb55fd775d0faefc44448f7",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/0.75x/powered_by_google_on_white.png": "31bc81278fd5b781b342ea1e767d032e",
"assets/packages/flutter_google_places_sdk_platform_interface/assets/google/powered_by_google_on_white.png": "f127e368d62ad92dacab340de5af50e8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2121f58613d6713eaec6b3059a2ad6b9",
"assets/fonts/MaterialIcons-Regular.otf": "9c55da708e2d1d7dfe6a0aa109c9db15",
"assets/assets/images/logo.png": "46fae801ec5449c69e9d4ac1b09a9e91",
"assets/assets/images/app-icon.png": "d9759e341b6eb0ec753aa0d55c6d5cd5",
"assets/assets/avatars/avatar9.png": "e7014f5d6c6ed8d7fc9a8610b24fccc8",
"assets/assets/avatars/avatar19.png": "339d54ce741da19a115cb700c83aa30d",
"assets/assets/avatars/avatar18.png": "430ddaf7a2cec827d9d19019d5f16aad",
"assets/assets/avatars/avatar8.png": "149206631a2060aaa042b1021390cb2f",
"assets/assets/avatars/avatar5.png": "096d9519c5b2fd7561b638f7a17e551d",
"assets/assets/avatars/avatar15.png": "d68d0900dba3333a7c3179d60990180b",
"assets/assets/avatars/avatar14.png": "dd96f415adae3dee71899365379591b7",
"assets/assets/avatars/avatar4.png": "9743cbe3a8c6f8c8663af69bf1b15bd4",
"assets/assets/avatars/avatar6.png": "c9b21407b7d96f75097b29b58706d694",
"assets/assets/avatars/avatar16.png": "cd9541578bbe28e514965fc3140e2aa4",
"assets/assets/avatars/avatar17.png": "26b64e58392de310df94ecd2109d8c84",
"assets/assets/avatars/avatar7.png": "8ba0d06914df438e6f9f4bf2819cbc88",
"assets/assets/avatars/avatar3.png": "859957bd406edbf1a0ed4908fb593627",
"assets/assets/avatars/avatar13.png": "b9d1a60fb3f7eca4be40638ec5a17b0b",
"assets/assets/avatars/avatar12.png": "d0e44ee46185328dd548af0cd17970f8",
"assets/assets/avatars/avatar2.png": "b08565859cb6d8d69c5a72698498b8c6",
"assets/assets/avatars/avatar0.png": "83a419be749153192bf26be95bb6a4eb",
"assets/assets/avatars/avatar10.png": "53f9422c18db4ecf0c1e65f0d66bec67",
"assets/assets/avatars/avatar11.png": "5312bcfed8c5ed25da49be6e2d06e6f1",
"assets/assets/avatars/avatar1.png": "ec9b16b40bda83e597e4911c96df9eb8",
"assets/assets/payment_methods/Mastercard-1.png": "a71e3b3954fca76777f427b8a48256cc",
"assets/assets/payment_methods/Mastercard-2.png": "34a2a018328b1048de21c2aeabd77b27",
"assets/assets/payment_methods/Visa-2.png": "33b76a74cc07ee9c60582204fca33647",
"assets/assets/payment_methods/Visa-1.png": "7a25e69e259141a013e77cbe5d58e8fd",
"assets/assets/payment_methods/visa.png": "339391b5f853c1a7709316e54c60a0f5",
"assets/assets/payment_methods/mastercard.png": "c390cd751ee91d02310634534fdfcc49",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
