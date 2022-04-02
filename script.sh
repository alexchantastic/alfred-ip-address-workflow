localipv4=$(ifconfig | grep 'inet.*broadcast' | awk '{print $2}')
externalipv4=$(curl -4 -s -m 5 icanhazip.com)

localipv6=$(ifconfig | grep 'inet6.*%en0' | awk '{print $2}' | sed 's/%en*//')
externalipv6=$(curl -6 -s -m 5 icanhazip.com)

subtitletext='Press enter to paste or ⌘C to copy'

if [ -z "$localipv4" ]
  then
  localipv4='n/a'
fi

if [ -z "$externalipv4" ]
  then
  externalipv4='n/a'
fi

if [ -z "$localipv6" ]
  then
  localipv6='n/a'
fi

if [ -z "$externalipv6" ] || [ "$externalipv6" == "$externalipv4" ]
  then
  externalipv6='n/a'
fi

json=$(cat << EOB
{"items": [
EOB
)

for ip in $localipv4;
do
json+=$(cat << EOB
  {
    "title": "Local IPv4: $ip",
    "subtitle": "$subtitletext",
    "arg": "$ip"
  },
EOB
)
done

json+=$(cat << EOB
  {
    "title": "External IPv4: $externalipv4",
    "subtitle": "$subtitletext",
    "arg": "$externalipv4"
  },
EOB
)

for ip in $localipv6;
do
json+=$(cat << EOB
  {
    "title": "Local IPv6: $ip",
    "subtitle": "$subtitletext",
    "arg": "$ip"
  },
EOB
)
done

json+=$(cat << EOB
  {
    "title": "External IPv6: $externalipv6",
    "subtitle": "$subtitletext",
    "arg": "$externalipv6"
  }

]}
EOB
)

echo $json
