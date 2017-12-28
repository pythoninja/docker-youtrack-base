# docker-youtrack-base

[![](https://images.microbadger.com/badges/image/pythoninja/docker-youtrack-base.svg)](https://microbadger.com/images/pythoninja/docker-youtrack-base "Get your own image badge on microbadger.com")
[![](http://api.stas.pw/v1/youtrack/latest.svg?rv=2)](https://www.jetbrains.com/youtrack/download/get_youtrack.html "Get latest YouTrack binary")

Docker YouTrack image based on Alpine Java 8.

Built with YouTrack version 2017.4.38399 (December 21, 2017)

This project was inspired from:
1. [uniplug/youtrack-docker](https://github.com/uniplug/youtrack-docker)
2. [esycat/docker-youtrack](https://github.com/esycat/docker-youtrack)

## Releases

**Fresh tags:**

1. `latest` or `2017.4.38399`

**Old tags:**

1. `2017.3.37623` 
1. `2017.3.37517` 
1. `2017.3.37328`

More old tags see on [Docker Hub](https://hub.docker.com/r/pythoninja/docker-youtrack-base/tags/)

**Releases:**

Download latest release from [releases](https://github.com/pythoninja/docker-youtrack-base/releases) Github page.

## Install

Run this command to create required dirs:

```
mkdir -p data/youtrack/{backup,database,logs}
```

Build image and run container. See below.

## Usage example

1. Get latest image: `docker pull pythoninja/docker-youtrack-base:latest`
2. Get tagged image : `docker pull pythoninja/docker-youtrack-base:tag`

## Build image

```
docker build -f Dockerfile -t docker-youtrack-base:latest .
```

## Run container

```
docker run --name youtrack-base \
 -v $(pwd)/data/youtrack/database/:/opt/yt/database/ \
 -v $(pwd)/data/youtrack/backup/:/opt/yt/backup/ \
 -v $(pwd)/data/youtrack/logs/:/opt/yt/logs/ \
 --rm -d -p 8080:8080 \
 pythoninja/docker-youtrack-base:latest
```

## Development

1. Clone this repo and make changes
2. Tag as `latest`: `git tag latest -m "tag annotation"` to run Docker Hub autobuild
3. Tag as `0.0.0-pre.1`: `git tag 0.0.0-pre.1` to run Docker Hub autobuild and autotagging fresh image
4. Push tag or tags: `git push latest`
5. Create new release using Github web interface

## Checklist

Checklist for new YouTrack release: [CHECKLIST.md](CHECKLIST.md)

## Youtrack Online Version Checker

Deployed to [api.stas.pw](http://api.stas.pw/v1/youtrack/latest.svg). Generates badge with current YouTrack version.

## Versioning

docker-youtrack-base follows main version of Jetbrains Youtrack. Additional number could be added due to project specified changes.

## Todo

- [x] Set up Docker Hub workflow
- [x] Create non-root user [#1](//github.com/pythoninja/docker-youtrack-base/pull/1)
- [ ] Add more variables
- [x] Optimize image [#3](//github.com/pythoninja/docker-youtrack-base/pull/3)
- [x] Add Youtrack version checker
- [ ] Add Github release maker
- [ ] Add random query string to README for YouTrack badge

## License

docker-youtrack-base released under the MIT license - see the [LICENSE](LICENSE) file for details.
