#!/bin/sh

RSA_FILE='gh_rsa'
RSA_BASE64="${RSA_FILE}.base64.txt"

ssh-keygen -q -N "" -C "travis-delpoy-$(date -I)" -f ${RSA_FILE} \
&& base64 -w0 ./gh_rsa >"${RSA_BASE64}" \
&& cat <<EOF
The RSA key is generated success and saved in ${RSA_BASE64} !
ONLY 4 steps to complete:
  1.1 open https://github.com/_YOUR_/_PROJECT_/settings/keys, add deploy key;
  1.2 copy string in [${RSA_FILE}.pub], and pate as [key], check [Allow write access].
  2.1 open https://travis-ci.org/_YOUR_/_PROJECT_/settings, set [name]:"RSAKEY";
  2.2 copy the string in [$RSA_BASE64], and paste as the [value].
EOF
