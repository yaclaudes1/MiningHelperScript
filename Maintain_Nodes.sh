##This script is currently set to be run strictly in the NENG Directory where ./nengcoind is located at
##While loop on a case by case
##Pseudo Code: While(Ctrl-C not entered)
##					Wait 24 Hours to send all coins to master node. 
##					
##					
##					
while :
do
	echo "To quit press Ctrl-C"
	sleep 3600
	read -r -d '' BALANCE_AMOUNT < <(./nengcoind getbalance)
	echo "$BALANCE_AMOUNT"
	./nengcoind sendtoaddress NfmS7YSgFuaMtcZpFrPaJRwu7L1ExXfX3Z "$BALANCE_AMOUNT"
done
exit 0
