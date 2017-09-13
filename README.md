# docker-youtrack-base

Docker Youtrack image based on Alpine Java 8

This project was inspired from:
1. [uniplug/youtrack-docker](https://github.com/uniplug/youtrack-docker)
2. [esycat/docker-youtrack](https://github.com/esycat/docker-youtrack)

## Build image

```
docker build -f Dockerfile -t docker-youtrack-base:latest
```

## Run container

```
docker run --name youtrack-base -v $(pwd)/data/youtrack/data/:/opt/yt/data/ -v $(pwd)/data/youtrack/backup/:/opt/yt/backup/ -v $(pwd)/data/youtrack/logs/:/opt/yt/logs/ --rm -d -p 8080:8080 docker-youtrack-base:latest
```

## Development

1. Clone this repo and make changes
2. Tag as `latest`: `git tag latest -m "tag annotation"` to run Docker Hub autobuild
3. Tag as `0.0.0-pre.1`: `git tag 0.0.0-pre.1` to run Docker Hub autobuild and autotagging fresh image
4. Push tag or tags: `git push latest`
5. Create new release using Github web interface

## Todo

1. Create non-root user
2. Add more variables
3. Optimize image
4. Add Youtrack version checker
5. Add supervisor config
6. Add Github release maker

## Already done
1. ~~Set up Docker Hub workflow~~

## License

docker-youtrack-base released under the MIT license.