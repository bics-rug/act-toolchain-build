#!/bin/bash
ls -la
echo "#############################"
echo "# upload all sources to unishare.nl via webdav"
mv async_circuit_toolkit.tar.gz asynchronous-circuit-toolkit-$(date "+%Y-%m-%d").tar.gz
sha256sum asynchronous-circuit-toolkit-$(date "+%Y-%m-%d").tar.gz > asynchronous-circuit-toolkit-$(date "+%Y-%m-%d").tar.gz.sha256
mv async_circuit_toolkit_sources.tar.gz asynchronous-circuit-toolkit-sources-$(date "+%Y-%m-%d").tar.gz
sha256sum asynchronous-circuit-toolkit-sources-$(date "+%Y-%m-%d").tar.gz > asynchronous-circuit-toolkit-sources-$(date "+%Y-%m-%d").tar.gz.sha256

echo "upload bin"
curl -T asynchronous-circuit-toolkit-$(date "+%Y-%m-%d").tar.gz -u $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/asynchronous-circuit-toolkit-$(date "+%Y-%m-%d").tar.gz
curl -T asynchronous-circuit-toolkit-$(date "+%Y-%m-%d").tar.gz.sha256 -u $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/asynchronous-circuit-toolkit-$(date "+%Y-%m-%d").tar.gz.sha256
echo "upload source"
curl -T asynchronous-circuit-toolkit-sources-$(date "+%Y-%m-%d").tar.gz -u $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/asynchronous-circuit-toolkit-sources-$(date "+%Y-%m-%d").tar.gz
curl -T asynchronous-circuit-toolkit-sources-$(date "+%Y-%m-%d").tar.gz.sha256 -u $UPLOAD_USER:$UPLOAD_PW https://unishare.nl/remote.php/dav/files/7956A1BC-A272-42F4-AA95-BCA1567972A2/Shared/autobuild_ACT/asynchronous-circuit-toolkit-sources-$(date "+%Y-%m-%d").tar.gz.sha256

echo "upload done"
