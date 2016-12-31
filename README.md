Travis-Page
===================

使用[Travis-CI](https://travis-ci.org)自动编译(生成或更新)gh-pgaes[![Build Status](https://travis-ci.org/NewFuture/travis-page.svg?branch=master)](https://travis-ci.org/NewFuture/travis-page)

支持发布方式：

* [x] 使用授权范围更小的`"deploy key"`(基于项目的权限) 【推荐】
* [x] [`"token"`授权](https://github.com/settings/tokens)(基于账号的权限): Travis环境变量里添加GH_TOKEN即可 
* [x] `secure`方式加密(加密内容`GH_TOKEN=xxxx`):[可以使用web离线版生成](http://rkh.github.io/travis-encrypt/public/)

## 复制 `.travis.yml`

1. 下载[.travis.yml](https://github.com/NewFuture/travis-page/blob/master/.travis.yml): `curl https://travis-page.newfuture.xyz/travis.yml -#Lo .travis.yml`
2. 修改.travis.yml：`GIT_AUTHOR_NAME`为git用户名,`BUILD_PATH`为生成文件目录
3. 重点是`script` 添加 build的相关命令,[更多参考travis文档](https://docs.travis-ci.com/user/customizing-the-build/)

PS: 可以先fork [travis-page](https://github.com/NewFuture/travis-page#fork-destination-box)进行测试

## 添加deploy key

- 生成RSA key
  * \*nix下可以使用`curl https://travis-page.newfuture.xyz/gen.sh -#L |bash` (后续步骤根据提示完成)
  * windwos可以使用在线RSA生成工具生成密钥对，然后使用在线base64编码工具将Private key进行base64编码
  * 或者运行下面的命令(\*nix)

```bash
ssh-keygen -q -N "" -C "travis-$(date -I)" -f gh_rsa \
&& base64 -w0 gh_rsa >gh_base64.txt
```

1. 如果没有运行travis在[trivs-ci账户页](https://travis-ci.org/profile/)开启对应仓库,有则跳过
2. 将【公钥】`*rsa.pub`的内容添加到deploykey中并**勾选写权限**,设置地址 `https://github.com/[USERNAME]/[PROJECT]/settings/keys`
3. 将base64编码后的【私钥】`*base64.txt`内容添加到环境变量命名`RSAKEY`,设置地址 `https://travis-ci.org/[USERNAME]/[PROJECT]/settings`
