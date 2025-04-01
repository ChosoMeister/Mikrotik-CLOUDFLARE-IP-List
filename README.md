## Get Cloudflare IP Ranges

This script obtains Cloudflare IP subnets (both IPv4 and IPv6) and adds them to an address list for Mikrotik routers.

## How to use script

```bash
foreach i in={"CLOUDFLARE-IP-Address"} do={
  /tool fetch url="https://raw.githubusercontent.com/ChosoMeister/Mikrotik-CLOUDFLARE-IP-List/master/cloudflare-list.rsc" dst-path=CLOUDFLARE-IP-Address
  /import file-name=$i
  /file remove $i
}
```

## Details

This repository automatically updates every 2 hours to fetch the latest Cloudflare IP ranges from Cloudflare's official API. The IP ranges are formatted as a Mikrotik router script (.rsc) for easy import.

## Author

[Mustafa](https://github.com/ChosoMeister)

