#!/usr/bin/with-contenv bashio
# shellcheck disable=SC1091
. /app/cloudflare.sh
. /tmp/cloudflare.conf

sleep 10s
while true;
do
    echo "Checking to see if we need to update your IP."

    CurrentIpAddress=$(getPublicIpAddress)
    DnsIpAddress=$(getDnsRecordIp "$CF_ZONE_ID" "$CF_RECORD_ID")

    if [ "$CurrentIpAddress" != "$DnsIpAddress" ]; then
        echo "Updating CloudFlare DNS record $CF_RECORD_NAME from $DnsIpAddress to $CurrentIpAddress..."
        update=$(updateDnsRecord "$CF_ZONE_ID" "$CF_RECORD_ID" "$CF_RECORD_NAME" "$CurrentIpAddress")
        if [ "$update" == "null" ]; then
            echo "ERROR: Failed to update CloudFlare DNS record $CF_RECORD_NAME from $DnsIpAddress to $CurrentIpAddress"
        else
            echo "CloudFlare DNS record $CF_RECORD_NAME ($CurrentIpAddress) updated successfully."
        fi
    else
        echo "No DNS update required for $CF_RECORD_NAME ($DnsIpAddress)."
    fi
    sleep 5m
done
