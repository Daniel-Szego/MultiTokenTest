 
#!/bin/bash
#

echo
echo "#####################################################"
echo "##### Install Multitoken System #########"
echo "#####################################################"
echo

# re-generate bna
echo "##### Re-Generate BNA #########"

composer archive create --sourceType dir --sourceName . -a ./build/multitokentest.bna

# install business network
echo "##### Install business network #########"

composer network install --card PeerAdmin@hlfv1 --archiveFile ./build/multitokentest.bna

# list installed networks
echo "##### List installed networks #########"

composer archive list -a ./build/multitokentest.bna

# Start business network
echo "##### Update business network #########"

composer network upgrade -c PeerAdmin@hlfv1 -n multitokentest -V 0.0.2

# test if stuffs are cool
echo "##### Test: ping #########"

composer network ping --card admin@multitokentest
