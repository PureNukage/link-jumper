{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "0.0.1",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2021-11-29T11:48:32.4277464-06:00",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "installdir": "",
  "files": [
    {"filename":"web3.min.js","origname":"","init":"","final":"","kind":5,"uncompress":false,"functions":[],"constants":[],"ProxyFiles":[],"copyToTargets":-1,"order":[],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"custom_script.js","origname":"","init":"","final":"","kind":5,"uncompress":false,"functions":[
        {"externalName":"checkMetaConnection","kind":5,"help":"checkMetaConnection();","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"checkMetaConnection","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"getMetamaskAccount","kind":5,"help":"getMetamaskAccount();","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"getMetamaskAccount","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"getTokenBalance","kind":5,"help":"getTokenBalance(wallet_address, token_address, ID)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            1,
          ],"resourceVersion":"1.0","name":"getTokenBalance","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":-1,"order":[
        {"name":"checkMetaConnection","path":"extensions/web3/web3.yy",},
        {"name":"getMetamaskAccount","path":"extensions/web3/web3.yy",},
        {"name":"getTokenBalance","path":"extensions/web3/web3.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": null,
  "tvosdelegatename": null,
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": -1,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "web3",
  "tags": [],
  "resourceType": "GMExtension",
}