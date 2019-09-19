'use strict';

const BusinessNetworkConnection = require('composer-client').BusinessNetworkConnection;

// these are the credentials to use to connect to the Hyperledger Fabric
let cardname = 'admin@multitokentest';

console.log("test started");

var bizNetworkConnection = new BusinessNetworkConnection();

var businessNetworkDefinition = bizNetworkConnection.connect(cardname)
.then((result) => {
    console.log("businessNetworkDefinition obtained : ");
    console.log(result.getIdentifier());
    console.log("");

    bizNetworkConnection.getAssetRegistry('test.multitokentest.hyperledger.TokenType')
    .then((registry) => {
       return registry.getAll();
    })
    .then((aResources) => {
      let arrayLength = aResources.length;
      for(let i = 0; i < arrayLength; i++) {

        console.log("token type Id : ");
        console.log(aResources[i].tokenTypeId);

        console.log("token type name : ");
        console.log(aResources[i].tokenTypeName);

        console.log("token type master type : ");
        console.log(aResources[i].tokenMasterType);

        console.log("token type master supply : ");
        console.log(aResources[i].supply);
        console.log("");

    }
      // Put to stdout - as this is really a command line app
      return;
    })
return;
});


