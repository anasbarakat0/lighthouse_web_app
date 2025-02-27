'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "847411a79f20cf0fb9ee7c9dee99d276",
".git/config": "90ccd1250a285b880989ff17e42bdf3f",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "41af0624ce78f1d07b3dd0fa7070e4e9",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "c8c56b1b1935bf5a4d4a1b06f5c9ce95",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "6ebd7ee3370266b7652d4c1220fcdc55",
".git/logs/refs/heads/master": "6ebd7ee3370266b7652d4c1220fcdc55",
".git/logs/refs/remotes/origin/master": "8bbad16d5a7f52784210d6f3d4b2fee0",
".git/objects/01/69ccda700bb723050ba935277661fc7a554e31": "9331482d99dccd39b8d2e518cf3b590c",
".git/objects/02/3954ae327e960ffb008e55304b97c4cfa02c27": "34c1f2385d2fc74d91daf2334e08bd17",
".git/objects/05/a9058f513cce5faf1704e06e3c150688b0a01f": "e8d02f60cf87abd4c1de4b153dd696dc",
".git/objects/09/8238a1488434559eed6de76f3981a5c414b6b8": "f5e19d7dd4cd80ef89964ac384e261f6",
".git/objects/0c/06e989e8d7ebee82b92e07ef4e69559c4dc28b": "ddc7de39a49e17fa7f4499aee6bac355",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/21/da45f886df62d94662a7e7be9991c18eab52bf": "38066c7372f0b0e99576f0146829f8eb",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/2b/22074a526449e59e56ce11214a07970d43ecce": "fee42dde6fdaebfb299fb3eb38e85335",
".git/objects/2f/aa804778ac2984cc11697413bb8c398db24d9b": "c0d9b3e10a55f887c320940dbe173b68",
".git/objects/3a/276cda48c636e8322b95fc0cdaa4847c27fe6e": "9c20006703dd649d8d1fcaa35fd8d869",
".git/objects/3a/bfb9149381b58da1af5f6698d748ccfbab9662": "6cee8221721e51996922d47e9f3da8d1",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/63925f4125a04c349fff9d7cb963fc3811bf8c": "c4d1a4dcc4c83c1da0a87b30792350d6",
".git/objects/52/8bb151f33615373b4d70cf5b3842d730c2e532": "fc69cca5f81bf2b669ca4a316b039df5",
".git/objects/5b/71b2fd61812bc9df490e11c31b5c8192bee3a1": "e5d81bdb87ea8edd76cff89307e0425b",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/65/99322837de9abe4a24ffcf25661d53937df448": "2fb2f376331137f7546877ce3a9b8be2",
".git/objects/66/8e1799c1e941781dd389e9c970a1722340398a": "d9b68e6783cd381705400656c17d99b8",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/76/43915cf2a62ed3695f81ece5e92b70f3a039d9": "a0626a68be6f231324fc1e30ac455fa8",
".git/objects/7b/68b32908a4c67f72e8e9757b89396688032453": "0a05a72ac33eae3d76bfcc9e9d26c5fd",
".git/objects/7c/09d499f23e8c9cfadbd067e09e62b423cd8b4a": "4f5d6ea007527788d254cd3ceeb9b8a8",
".git/objects/84/58246c91dc73c00ab6a8de9283ab57455add05": "433867b98f69509a2d528e5961c07d42",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/8c/59773bee8314a8ffb4431593d0fb49f52e34c6": "2eb993d30677573ffd0e58484cc6a514",
".git/objects/8c/d7ef32e73cc8db4234f9b6c111c6978fe2bfa0": "c904baede5eb7ee07b215dd22873bb17",
".git/objects/8e/71185520be8e2e2e7f7e4744fcd6d47251bddc": "2150e0722aa31f731ef9cede30371612",
".git/objects/92/45017a974e2a256ad4bed9e87f38e8d8153f0b": "05b18c7e638e27e86afd801dd0e20e72",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/9a/a3429faa60107515249d242c55b7f2ab8a07fa": "ee047c512db3da488ee7a617c3fb5e74",
".git/objects/a8/bd9aa8e33356a3deced9e4b8723d143949c53e": "20eb8f225943812b00f6102ec558ed3a",
".git/objects/ab/5e5fc67e8f4d2ac35ace04d9c506c8284b2d38": "98269bd9877c3604c5b60a54be91a52f",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/b5/5f8d6a9d51713e33cd227b180ed87d5877fe39": "4234ef42cb67bcee5475f60da1d53fa1",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/bb/b0c5db1b9ad59e36f227480dbbb99b6a216e7e": "2c75e0dde20854dfd578f58a290d6a0d",
".git/objects/bc/8d1758880a397524385eec94dd5b3daba6e509": "37872d9d1f5058aa788506e870dfa24c",
".git/objects/be/c24edb84895d5084c98c8fc7c84e1957c0fd25": "4230e3f64ea428f45f8b60cb0bc30eda",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/c4/ebfafc8d61d328a6939c3f9b05653d246d1dbf": "27843ce790f8aadbfc366458811a36f0",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/ca/8482c88c44dcfdf9ead9d3726df9574ac9775c": "81cbf504c8b90bc81a07b514349a4ac5",
".git/objects/cb/80e56e8e5551abafbb08d0e3092691cea0fae8": "09fe16a509c070c4f4d51b1908c77083",
".git/objects/cd/6fb6a336c65865d8507b998c6cce5669e69164": "d0a0a97a116606e273f9ff22fbc64bfb",
".git/objects/d3/1234fe7afd7aa00842514424195cda72336efe": "87b5e7b87d0565481f455575af696e56",
".git/objects/d3/32b83fe774244a791207af1deefc856e205255": "c7abe889d8a038fec5ea6e23b5377dad",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f6/5506eff328bbdaef61933d80a30db635863049": "8019ee6dc55bc71922bd93e09a85e64e",
".git/objects/f7/3e093768feb08239c7c874774a7068fa8f2e4b": "b7e6a363477eb8b76fc6552bc6c9add9",
".git/objects/f8/448ffbc389a226a61ea2a46c771e22ac9f390e": "4664db471e2fd647d9a79e1648c6b03c",
".git/objects/fe/755d42b1d0d3ab9dfaeef800847df9d6597ec2": "b5c1015c7fb538419f1d8c26a2488d6b",
".git/refs/heads/master": "8528d56599e3bfe553329a2d2c16c20e",
".git/refs/remotes/origin/master": "8528d56599e3bfe553329a2d2c16c20e",
"assets/AssetManifest.bin": "44db429960c8be8d7aa59c3420329ffc",
"assets/AssetManifest.bin.json": "122541f9161e526c2f8ca1e0458649c6",
"assets/AssetManifest.json": "66820ba2d0b158597cd95c7d62f63178",
"assets/assets/svg/ar-logo.svg": "70825181c75def454d8e3415932a78a3",
"assets/assets/svg/dark-ar-logo.svg": "f50094156cb045b3da2c8541918d2cb9",
"assets/assets/svg/dark-en-logo.svg": "4bbef9da7c5dd45b16d3360e82fb8016",
"assets/assets/svg/en-logo.svg": "66bc5b0c6c086cc7d225d858f9b297ff",
"assets/assets/svg/lighthouse_ch.svg": "e395706181a197764b1b20320b7a08cb",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/NOTICES": "e3d0ea65d4e1b90c1ff1dfe9c38037d7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "9cc33f455854babc97577f60321eac5b",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "9b81735b45c918071e6a4085a7eb78bb",
"icons/Icon-192.png": "cd69c3b57d037a0414ea86477ff93f71",
"icons/Icon-512.png": "523da0b77727d39eb1f1af690b0be6dc",
"icons/Icon-maskable-192.png": "cd69c3b57d037a0414ea86477ff93f71",
"icons/Icon-maskable-512.png": "523da0b77727d39eb1f1af690b0be6dc",
"index.html": "95dafee0f818fbb02cbc773d1cd96840",
"/": "95dafee0f818fbb02cbc773d1cd96840",
"main.dart.js": "3129985323afc6d26981c72ec9d78c95",
"manifest.json": "de31c9137fcc7a3ba9aa59269a23c88e",
"version.json": "0d5c258863d466e74b5c25f5bdc8a44d"};
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
