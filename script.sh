localipv4=$(ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2}')
externalipv4=$(curl -4 -s https://ifconfig.co)

localipv6=$(ifconfig | grep 'inet6 ' | grep 'en0' | awk '{print $2}' | sed 's/%en0//g')
externalipv6=$(curl -6 -s https://ifconfig.co)

subtitletext='Press enter to paste or ⌘C to copy'

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
