travis-page
===================

使用[Travis-CI](https://travis-ci.org)自动编译(生成或更新)gh-pgaes

使用授权范围更小的`"deploy key"`(基于项目的权限) 而非 `"token"`(给予账号的权限) 授权

## 复制 `.travis.yml`
修改`GH_REF`和`GIT_AUTHOR_NAME`


## 生成key

* 使用在线的`curl https://newfuture.github.io/travis-page/gen.sh -#L |sh`
* 或者使用
```bash
ssh-keygen -q -N "" -C "travis-$(date -I)" -f gh_rsa \
&& base64 -w0 gh_rsa >gh_base64
```

