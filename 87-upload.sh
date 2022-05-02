#!/bin/bash

echo "#############################"
echo "# upload all sources"

curl -T async_circuit_toolkit.tar.gz -u $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/asynchronus-circuit-toolkit-$(date "+%Y-%m-%d").tar.gz
curl -T async_circuit_toolkit_sources.tar.gz -u $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/asynchronus-circuit-toolkit-sources-$(date "+%Y-%m-%d").tar.gz
