#!/usr/bin/env bash

RSA_FILE='gh_rsa'
RSA_BASE64="${RSA_FILE}.base64.txt"

SUCC_STYLE='\033[0;32m'
FILE_STYLE='\033[4;36m'
LINK_STYLE='\033[4;34m'
DEFAULT='\033[0m'
WARN='\033[6;33m'
FAIL='\033[0;31m'

ssh-keygen -q -N "" -C "travis-delpoy-$(date -I)" -f ${RSA_FILE} \
&& base64 -w0 ./gh_rsa >"${RSA_BASE64}" \
&& rm ./gh_rsa \
&& echo -e "${SUCC_STYLE}The RSA key is generated success and saved in ${FILE_STYLE}[${RSA_BASE64}]${SUCC_STYLE} !" \
&& echo -e "${DEFAULT}ONLY 4 steps to complete:" \
&& echo -e "${SUCC_STYLE}  1.1${DEFAULT} open ${LINK_STYLE} https://github.com/_YOUR_/_PROJECT_/settings/keys ${DEFAULT}. Add deploy key;" \
&& echo -e "${SUCC_STYLE}  1.2${DEFAULT} copy file ${FILE_STYLE}[${RSA_FILE}.pub]${DEFAULT}, and paste as [key], checking ${WARN}[Allow write access]${DEFAULT}." \
&& echo -e "${SUCC_STYLE}  2.1${DEFAULT} open ${LINK_STYLE} https://travis-ci.org/_YOUR_/_PROJECT_/settings ${DEFAULT}, set [name]:'${WARN}RSAKEY${DEFAULT}';" \
&& echo -e "${SUCC_STYLE}  2.2${DEFAULT} copy file ${FILE_STYLE}[$RSA_BASE64]${DEFAULT}, and paste as the [value]." \
&& echo -e "${SUCC_STYLE}已经成功生成RSA key 并将编码后存储于 ${FILE_STYLE}[${RSA_BASE64}]${SUCC_STYLE} !" \
&& echo "" \
&& echo -e "${DEFAULT}完成下面4步即可:" \
&& echo -e "${SUCC_STYLE}  1.1${DEFAULT} 打开${LINK_STYLE} https://github.com/用户/项目/settings/keys ${DEFAULT},点击[Add deploy key];" \
&& echo -e "${SUCC_STYLE}  1.2${DEFAULT} 复制文件${FILE_STYLE}[${RSA_FILE}.pub]${DEFAULT}内容, 粘贴到公钥[Key],并选中${WARN}[Allow write access]${DEFAULT}." \
&& echo -e "${SUCC_STYLE}  2.1${DEFAULT} 打开${LINK_STYLE} https://travis-ci.org/用户/项目/settings ${DEFAULT},添加环境变量[name]为'${WARN}RSAKEY${DEFAULT}';" \
&& echo -e "${SUCC_STYLE}  2.2${DEFAULT} 复制文件${FILE_STYLE}[$RSA_BASE64]${DEFAULT}内容, 粘贴为[value]." \
|| (echo "${FAIL} Generated fail!{DEFAULT}" && exit 1)
