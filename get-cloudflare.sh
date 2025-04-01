#!/bin/bash
last=$(date);
echo "#Last update: $last";
echo "/ip firewall address-list remove [/ip firewall address-list find list=CLOUDFLARE-IP-Address]";
echo "/ip firewall address-list";

# Get Cloudflare IPv4 ranges
for range in $( curl --silent -X GET -H 'Connection: close' "https://api.cloudflare.com/client/v4/ips" | jq .result.ipv4_cidrs[] | sed 's/"//g' ); do
    echo ":do { add address=$range list=CLOUDFLARE-IP-Address} on-error={}";
done;

last=$(date);
echo "#Last update: $last";
echo "/ipv6 firewall address-list remove [/ipv6 firewall address-list find list=CLOUDFLARE-IP-Address]";
echo "/ipv6 firewall address-list";

# Get Cloudflare IPv6 ranges
for range in $( curl --silent -X GET -H 'Connection: close' "https://api.cloudflare.com/client/v4/ips" | jq .result.ipv6_cidrs[] | sed 's/"//g' ); do
    echo ":do { add address=$range list=CLOUDFLARE-IP-Address} on-error={}";
done;
