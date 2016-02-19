#!/bin/bash
## oem at oemden dot com
## Create-Rhino5-ZooLicenseClientFile-pkg
# v1.1
# create the package

## edit below
pkg_identifier="com.example.int.pkg.Create-Rhino5-ZooLicenseClientFile"
pkg_name="RHINO5_LICENCE_ZOOSERVER_ClientFile.pkg"
CleanUp="1" # enter 1 to delete tmp directories or 0 to keep them for double check

## =========== Don't Edit below ==========
my_path=`dirname $0`
echo "$my_path"
cd "$my_path"
version="1.1"
scriptsDir="myscripts"
rootDir="empty"

mkdir -p "${rootDir}"
mkdir -p "${scriptsDir}"
cp "Generate-Rhino5-ZooLicenseClientFile.sh" "myscripts/postinstall"

#pkgbuild --nopayload --scripts scripts --identifier "$pkg_identifier" --version 0.4 "$pkg_name"
pkgbuild --root "${rootDir}" --scripts "${scriptsDir}" --identifier "${pkg_identifier}" --version "${version}" "${pkg_name}" 

#CleanUp
if [[ "${CleanUp}" == 1 ]] ; then
	rm -Rf "${rootDir}"
	rm -Rf "${scriptsDir}"
fi

exit 0
