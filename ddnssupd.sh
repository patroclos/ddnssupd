#!/bin/bash
# Usage: upddnss [key] [domain...]

updkey="$1"
domains=""
udomains=""
n=1
while [ $n -le $# ]
do
	(( n++ ))
	domains="$domains ${!n}"
done

mip="$(wget -qO - canihazip.com/s)"

for dom in $domains
do
	dip="$(getent hosts $dom | awk '{ print $1 }')"
	if [ -z $dip ] || [ -z $mip ]; then
		echo "[!] Could not get needed IP-Addresses."
		exit 1
	fi

	if [ $dip != $mip ]; then
		echo "[*] Updating domains."
	fi
done

dlist=""
for dom in $udomains
do
	if [ -z $dlist ]
		dlist="$dom"
	else
		dlist="$dlist,$dom"
	fi
done
updurl="https://ddnss.de/upd.php?key=$updkey&host=$dlist"
wget -qO - $updurl > /tmp/updddns_response
grep Error /tmp/updddns_response -qs
if [ $? == 0 ]; then
	echo "[!] Error updating domain $dom via $updurl"
	echo "[!] Server response is located at /tmp/updddns_response"
	exit 2
fi

