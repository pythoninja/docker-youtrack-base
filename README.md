# docker-youtrack-base

Docker Youtrack image based on Alpine Java 8

This project was inspired from:
1. [uniplug/youtrack-docker](https://github.com/uniplug/youtrack-docker)
2. [esycat/docker-youtrack](https://github.com/esycat/docker-youtrack)

## Tags

Available tags:
1. latest or 2017.3.36019.1
2. 2017.3.36019

## Install

Run this command to create required dirs:

```
mkdir -p data/youtrack/{backup,database,logs}
```

## Usage example

1. Get latest image: `docker pull pythoninja/docker-youtrack-base:latest`
2. Get tagged image : `docker pull pythoninja/docker-youtrack-base:tag`

## Build image

```
docker build -f Dockerfile -t docker-youtrack-base:latest
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

## Versioning

docker-youtrack-base follows main version of Jetbrains Youtrack. Additional number could be added due to project specified changes.

## Todo

- [x] Set up Docker Hub workflow
- [x] Create non-root user #1
- [ ] Add more variables
- [ ] Optimize image
- [ ] Add Youtrack version checker
- [ ] Add supervisor config
- [ ] Add Github release maker

## License

docker-youtrack-base released under the MIT license.
