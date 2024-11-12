'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "7b6d4c1c72a818a328ac6dafab79b1fa",
"version.json": "00fa58b9dc066b7f420fceac13583fb5",
"index.html": "043efc83f6ad3164e4b4cf0e7b599eec",
"/": "043efc83f6ad3164e4b4cf0e7b599eec",
"main.dart.js": "df65ce5c5f05b5368e8418d70986cf7e",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "584afe5a1bc0608eae53adbd35beece3",
"assets/AssetManifest.json": "467d74b5df63308774cc33b51f1f1d86",
"assets/NOTICES": "c805f0505543cfc2349ea5d5307e2c63",
"assets/FontManifest.json": "6c3f15981baee033f16accfe7ef60dcb",
"assets/AssetManifest.bin.json": "228bc29d031cf823fd85c3231301443b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsRounded.ttf": "d7e688bda5f6599c34efc90e17f37e9d",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsOutlined.ttf": "d7f562f8ca5447f7d49c18e5dca242dd",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsSharp.ttf": "63735e76e5c58a5f282ef6d6332bcd6c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "dd0a4b21a44acb40d605ca924a5f7158",
"assets/fonts/MaterialIcons-Regular.otf": "7e8d2f3f03b55fdff7a207bf867a7261",
"assets/assets/images/4.jpg": "2c7e610ae7fbbb99902a17ab0c760d78",
"assets/assets/images/5.jpg": "672f4442b9ea9303f7c726b67e110973",
"assets/assets/images/2.jpg": "060bb77d680f70309bdc71b6acc125b7",
"assets/assets/images/3.jpg": "d80a6c843a78f795fba91b6bb7710fa2",
"assets/assets/images/1.jpg": "712c651cfa0b9e0f88f8c7ae8d1cdfc8",
"assets/assets/images/0.jpg": "846b2a356066e71a9d269c63ad8690c2",
"assets/assets/font/Andasia.ttf": "60c8dd0206687e91542a45a230d8de33",
"assets/assets/font/Hatolie.ttf": "976d7bf54ff831d3b528d72da160af3c",
"assets/assets/font/RetroSignature.otf": "be5f32a57f73ec0e9dc7fc2ba47b40b0",
"assets/assets/font/photograph_signature.ttf": "75f576cf8d7cd238efc13a0772255e5e",
"assets/assets/decor/siccor.webp": "572be99c1edea4c5c2c7f4a335842038",
"assets/assets/decor/glasses.webp": "df33677eba357b40811d234ec6efd236",
"assets/assets/decor/weed_left.png": "07a36495dabb599dda19b831776debed",
"assets/assets/decor/cotton.png": "e829ff8be44072c49692507d96e218d9",
"assets/assets/decor/heart.webp": "0934283e32b77716a6dacdec9980097c",
"assets/assets/decor/monk.webp": "25849492794ae238613be06ae4a9931e",
"assets/assets/decor/fork.webp": "f88ff8daff51a2305b0af4c9354ef670",
"assets/assets/decor/ring.webp": "f6704bc9807761c6749cf28749af6d5c",
"assets/assets/decor/weed_right.png": "091895fd2498693a0ef5cb95230ee2c7",
"assets/assets/decor/ring.svg": "8128e409608940a5887bb922e9620d47",
"assets/assets/decor/weed.png": "bffcc950338b178a2ed739ba753cddc3",
"assets/assets/decor/cloth.webp": "2038aa3b1725294500150b852d20e775",
"assets/assets/decor/bg.png": "c63df6f167e53aeeb28aafd09ae21870",
"assets/assets/decor/main_bg.webp": "77e291aea37c0140ba3fe089b0789478",
"assets/assets/photo/intro_main.png": "dbcff8e22251a0fdd8c294c422051d2d",
"assets/assets/photo/map.png": "60c94d346cef0a6beba05c0a614c2ada",
"assets/assets/photo/inital_name.png": "437bc9486528472107798f4436850233",
"assets/assets/photo/bg_intro.png": "c63df6f167e53aeeb28aafd09ae21870",
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
