# Docker container containing ubuntu 14.04 with dh-virtualenv installed
[dh-virtualenv](https://github.com/spotify/dh-virtualenv) is used to generate debian package containing python virtualenv (and not just one python package).
## Usage
Build docker container using Dockerfile

```
git clone git@github.com:saucelabs/dhvirtualenv-docker-trusty.git
cd dhvirtualenv-docker-trusty
# build image using this repo Dockerfile
docker build -t dhvirtualenv .
# use dhvirtualenv image to build debian package
cd /path/to/your/repo/containing/python/code/to/build/repo_name
docker run -d -v $(cd .. && pwd):/data dhvirtualenv /bin/bash -c "cd /data/repo_name; dpkg-buildpackage -us -uc"
```