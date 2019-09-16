/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';
/**
 * Write your transction processor functions here
 */

let namespace = "test.multitokentest.hyperledger";

/**
 * Like transaction
 * @param {test.multitokentest.hyperledger.Like} tx
 * @transaction
 */
async function LikeTransaction(tx) {
    console.log("Like transaction started");

    console.log("Like transaction ended");
}
 
/**
 * Transfer transaction
 * @param {test.multitokentest.hyperledger.Transfer} tx
 * @transaction
 */
async function TransferTransaction(tx) {
    console.log("Transfer transaction started");

    console.log("Transfer transaction ended");
}

/**
 * Transfer transaction
 * @param {test.multitokentest.hyperledger.Exchange} tx
 * @transaction
 */
async function ExchangeTransaction(tx) {
    console.log("Exchange transaction started");

    console.log("Exchange transaction ended");
}

/**
 * Transfer transaction
 * @param {test.multitokentest.hyperledger.InitData} tx
 * @transaction
 */
async function InitDataTransaction(tx) {
    console.log("Init Data transaction started");

    const factory = getFactory(); 

    console.log('Creating a Token Type Like');  
	
  	// adding token type like
    const tokenTypeReg = await getAssetRegistry(namespace + '.TokenType');   
    const tokenType1 = await factory.newResource(namespace, 'TokenType', "tokentypeLike");
    tokenType1.tokenTypeName = "LIKE";
    tokenType1.tokenMasterType = "FUNGIBLE";
    tokenType1.supply = 0;
    await tokenTypeReg.add(tokenType1);       

    console.log("Init Data transaction ended");
}

