##This script is currently set to be run strictly in the NENG Directory where ./nengcoind is located at
##
##					Line 11 causes the script to wait for a certain time in seconds
##					3600 seconds = 1 hour; Wait 1 Hour to send all coins to master node. 
##					Line 3 
##					
##					
while :
do
	echo "To quit press Ctrl-C"
	sleep 3600
	read -r -d '' BALANCE_AMOUNT < <(./nengcoind getbalance)
	echo "$BALANCE_AMOUNT"
	./nengcoind sendtoaddress //WALLETADDRESSGOESHERE!// "$BALANCE_AMOUNT"
done
exit 0
