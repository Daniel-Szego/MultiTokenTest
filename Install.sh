 
#!/bin/bash
#

echo
echo "#####################################################"
echo "##### Install Multitoken System #########"
echo "#####################################################"
echo

# generate bna
echo "##### Generate BNA #########"

composer archive create --sourceType dir --sourceName . -a ./build/multitokentest.bna

# install business network
echo "##### Install business network #########"

composer network install --card PeerAdmin@hlfv1 --archiveFile ./build/multitokentest.bna

# list installed networks
echo "##### List installed networks #########"

composer archive list -a ./build/multitokentest.bna

# Start business network
echo "##### Start business network #########"

composer network start --networkName multitokentest --networkVersion 0.0.12 --networkAdmin admin --networkAdminEnrollSecret adminpw --card PeerAdmin@hlfv1 --file networkadmin.card

# import network card identity
echo "##### Import network admin card #########"

composer card import --file networkadmin.card

# test if stuffs are cool
echo "##### Test: ping #########"

composer network ping --card admin@multitokentest

# init data - Like Token
echo "##### Create init data: Like Token with transaction #########"

composer transaction submit --card admin@multitokentest -d '{"$class":"test.multitokentest.hyperledger.InitData"}'

# init data - EUR token
echo "##### Create init data: EUR Token with direct import #########"

composer transaction submit --card admin@multitokentest -d '{"$class": "org.hyperledger.composer.system.AddAsset", "targetRegistry": "resource:org.hyperledger.composer.system.AssetRegistry#test.multitokentest.hyperledger.TokenType", "resources": [{"$class": "test.multitokentest.hyperledger.TokenType", "tokenTypeId": "eurTokenId", "tokenTypeName": "EUR", "tokenMasterType": "FUNGIBLE", "supply": 1000}]}'

# init data - Add participant User

composer transaction submit --card admin@multitokentest -d '{"$class": "org.hyperledger.composer.system.AddParticipant", "targetRegistry": "resource:org.hyperledger.composer.system.ParticipantRegistry#test.multitokentest.hyperledger.User", "resources": [{"$class": "test.multitokentest.hyperledger.User", "actorId": "internalUserId1", "externalId": "externalUserId1111"}]}'

# issue new identity to the User

composer identity issue -c admin@multitokentest -f testuser.card -u user -a "resource:test.multitokentest.hyperledger.User#internalUserId1"

# import the new identity to the Wallet

composer card import -f testuser.card

# ping network from the new identity

composer network ping -c user@multitokentest

# start composer rest server

composer-rest-server -c admin@multitokentest -n never -u true -w true

