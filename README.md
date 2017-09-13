# docker-youtrack-base

Docker Youtrack image based on Alpine Java 8

This project was inspired from:
1. [uniplug/youtrack-docker](https://github.com/uniplug/youtrack-docker)
2. [esycat/docker-youtrack](https://github.com/esycat/docker-youtrack)

## Build image

```
docker build -f Dockerfile -t docker-youtrack-base:0.1.0
```

## Run container

```
docker run --name youtrack-base -v $(pwd)/data/youtrack/data/:/opt/yt/data/ -v $(pwd)/data/youtrack/backup/:/opt/yt/backup/ -v $(pwd)/data/youtrack/logs/:/opt/yt/logs/ --rm -d -p 8080:8080 docker-youtrack-base:0.1.0
```

## Todo

1. Create non-root user
2. Add more variables
3. Optimize image
4. Check for Youtrack latest version
5. Add supervisor config
6. Set up Docker Hub workflow

## License

docker-youtrack-base released under the MIT license.