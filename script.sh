localipv4=$(ifconfig | grep 'inet.*broadcast' | grep -Fv 127.0.0.1 -m 1 | awk '{{printf"%s ",$2}}')
externalipv4=$(curl -4 -s -m 5 https://ifconfig.co)

localipv6=$(ifconfig | grep 'inet6.*%en' -m 1 | awk '{print $2}')
externalipv6=$(curl -6 -s -m 5 https://ifconfig.co)

subtitletext='Press enter to paste or ⌘C to copy'

if [ -z $localipv4 ]
	then
	localipv4='n/a'
fi

if [ -z $externalipv4 ]
	then
	externalipv4='n/a'
fi

if [ -z $localipv6 ]
	then
	localipv6='n/a'
fi

if [ -z $externalipv6 ] || [ $externalipv6 == $externalipv4 ]
	then
	externalipv6='n/a'
fi

cat << EOB
{"items": [

	{
		"title": "Local IPv4: $localipv4",
		"subtitle": "$subtitletext",
		"arg": "$localipv4"
	},

	{
		"title": "External IPv4: $externalipv4",
		"subtitle": "$subtitletext",
		"arg": "$externalipv4"
	},

	{
		"title": "Local IPv6: $localipv6",
		"subtitle": "$subtitletext",
		"arg": "$localipv6"
	},

	{
		"title": "External IPv6: $externalipv6",
		"subtitle": "$subtitletext",
		"arg": "$externalipv6"
	}

]}
EOB
