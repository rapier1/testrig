#!/bin/bash
echo "[$(date)] Begin GeoLite2 IP DB  update.."
cd ./geolocate
wget -O new.mmdb.gz 'https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=wc6VOHv0pLzAKjGF&suffix=tar.gz' > /dev/null 2>&1
if [ "$?" = "0" ]; then
	echo "[$(date)] download success"
else
	echo "[$(date)] download failed"
	exit 1
fi

gzip -d new.mmdb.gz
if [ "$?" = "0" ]; then
	echo "[$(date)] extraction success"
else
	echo "[$(date)] extraction failed"
	exit 1
fi

mv new.mmdb GeoLite2-City.mmdb
if [ "$?" = "0" ]; then
	echo "[$(date)] update success"
else
	echo "[$(date)] update failed"
	exit 1
fi
