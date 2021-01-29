##This script is currently set to be run strictly in the NENG Directory where ./nengcoind is located at
##
##Pseudo Code: While(Ctrl-C not entered)
##					 
##			SLEEP SET TO 4 HOURS where 3600 seconds = 1 hour		
##			TODO: 1.Fix current bug that prevents proper updating of balance after sending funds.		
##			TODO: 2.Implement output to logfile with additional statistics.	
WALLET_ADDRESS="Place recepient wallet address here" 				
while :
do
	echo "To quit press Ctrl-C"
	sleep 14400
	read -r -d '' BALANCE_AMOUNT < <(./nengcoind getbalance)
	echo "Balance Amount Pre-Transfer: $BALANCE_AMOUNT"
	read -r -d '' BALANCE_MINUS_FEES < <(bc <<< "$BALANCE_AMOUNT * .7")
	./nengcoind sendtoaddress "$WALLET_ADDRESS" "$BALANCE_MINUS_FEES"
	date +"Time Statistics: %m/%d/%Y Time: %H.%M.%S"
	echo "Balance Amount Post-transfer: $BALANCE_AMOUNT"
done
exit 0
