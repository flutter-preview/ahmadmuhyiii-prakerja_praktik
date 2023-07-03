'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/NOTICES": "304730710888dc9e8afd880c3d6d07bc",
"assets/assets/gula%2520aren.jpg": "5e56a5f2315142ef02dc8a8a0b2636ca",
"assets/assets/ic_plus_circle.png": "3aff1f438d0ad024ab276e89fc8bb5e2",
"assets/assets/ic_yogurt.png": "161681d06bfc14ffbcd3499d9ce18ad5",
"assets/assets/ic_reward.png": "31dc016af8891a2ef96234faa9a35119",
"assets/assets/ic_profile.png": "b4047e9bfd6ce53d542a39b343cc5be5",
"assets/assets/double.jpg": "23c36630f9080642ea217b1fe7125227",
"assets/assets/ic_statistic.png": "02ebd50548e06c035005396f365b0108",
"assets/assets/ic_coffee.png": "b552ab7d01c504e1a81962835aad586f",
"assets/assets/img_profile.png": "26d8a4171f7137772255ecf0fcacd817",
"assets/assets/ic_signature.png": "187b6a0ad92c50b877c3a643f6fd6cc5",
"assets/assets/ic_love.png": "068b0727b97be5c35fd89c91bd159c75",
"assets/assets/ic_cokolat.png": "23fac0153c7f209425478e5a7ddb5a47",
"assets/assets/ic_cake.png": "6e158d1c8944902e5acab37f9a92e3ae",
"assets/assets/profile.png": "26d8a4171f7137772255ecf0fcacd817",
"assets/assets/capucino.jpg": "f8b4466085033b7a1ff2adaec7ec6524",
"assets/assets/americano.jpg": "9b05b4f720d7e78f45e4f987899e79da",
"assets/assets/ic_cart.png": "841b9cdbc862dcd519973a3b1046c4fb",
"assets/assets/ic_product_food.png": "a68ff7ab88f8aee1c8cdd014895af411",
"assets/assets/capucinohot.jpg": "f43e54916728dfc98aa331b829e9be96",
"assets/assets/ic_salad.png": "67ba51437f5ec4b01e64618240f6133a",
"assets/assets/americanohot.jpg": "478b64b46b64516e063091ef719c3754",
"assets/assets/ayi.jpg": "723c37537a839677b1c7a09d4c042153",
"assets/assets/ic_overview.png": "b65846d378ddf70be371e48292c92165",
"assets/assets/ic_menu.png": "2b81afdcadfaa45b67710b68bc0a37c7",
"assets/assets/ic_bakery.png": "4ff7cd7230c9a3f0654a45b2a6ac28e2",
"assets/assets/ic_iced_cofe.png": "b1bdd39b22dfb52015cb95489ab8564c",
"assets/assets/kopi%25202.jpg": "274e1b51524a249f0168e2a72402621e",
"assets/assets/kopiii.jpg": "f076d2afa6b5075cb803936423bd986b",
"assets/assets/ic_home.png": "6a1b795dd4e95b33bab8b84f6281ddd7",
"assets/assets/ic_history.png": "fd387d7b8b52c76a14c64f47a1732625",
"assets/assets/kopi.jpg": "5bd67b6992e98ae5e6070c76a667842e",
"assets/AssetManifest.json": "e9670aa150a21c9ab8d5264d8c5445b9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"index.html": "cda6d7eb921708c6ecb2fd84762102ac",
"/": "cda6d7eb921708c6ecb2fd84762102ac",
"main.dart.js": "0f6b58802ab49cc531784be1ddaab981",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"version.json": "a2fb14032439173410699d7897b7ee76",
"manifest.json": "590246bf7095f04ae16d1397f1bf4fec",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
