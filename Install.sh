 
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

composer network start --networkName multitokentest --networkVersion 0.0.1 --networkAdmin admin --networkAdminEnrollSecret adminpw --card PeerAdmin@hlfv1 --file networkadmin.card

# import network card identity
echo "##### Import network admin card #########"

composer card import --file networkadmin.card

# test if stuffs are cool
echo "##### Test: ping #########"

composer network ping --card admin@multitokentest




