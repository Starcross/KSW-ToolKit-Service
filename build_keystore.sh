#!/bin/bash
wget https://android.googlesource.com/platform/build/+/master/target/product/security/platform.pk8?format=TEXT -O platform.pk8.base64
wget https://android.googlesource.com/platform/build/+/master/target/product/security/platform.x509.pem?format=TEXT -O platform.x509.pem.base64
base64 -d platform.pk8.base64 > platform.pk8
base64 -d platform.x509.pem.base64 > platform.x509.pem
git clone git@github.com:getfatday/keytool-importkeypair.git
keytool-importkeypair/./keytool-importkeypair -pk8 platform.pk8 -cert platform.x509.pem -p android -alias platform -k platform.keystore
mv platform.keystore app/