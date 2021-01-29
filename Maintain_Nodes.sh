##This script is currently set to be run strictly in the NENG Directory where ./nengcoind is located at
##While loop on a case by case
##Pseudo Code: While(Ctrl-C not entered)
##					 
##			SLEEP SET TO 4 HOURS		
##					
##	
WALLET_ADDRESS=NQFAb97o624vYuTWg6oEqYKp74Ldnei7Ak 				
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
