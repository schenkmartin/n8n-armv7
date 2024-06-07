# n8n-armv7
A n8n docker image for 32Bit armv7 operating systems, since there is none provided.

The image build is tested on a Rasberry Pi 4 Modell B with 2GB RAM running Ubuntu 22.04.4 LTS and Docker version 26.0.0.

This repository is inspired by the docker files of the official n8n repository at [n8n/docker/images at master · n8n-io/n8n (github.com)](https://github.com/n8n-io/n8n/tree/master/docker/images)

## How to build this image

1. Clone this repository
   ```
   git clone https://github.com/schenkmartin/n8n-armv7
   ```

2. Change into the n8n-armv7 folder
   ```
   cd n8n-armv7
   ```

3.  Build the image (use --progress plain for node module installation verbosity)
   ```
   docker build -t n8n-armv7:latest . --progress plain
   ```

## How to run this image

Follow the documentation for the official n8n docker image: [n8nio/n8n - Docker Image | Docker Hub](https://hub.docker.com/r/n8nio/n8n)

The following line runs this image with SSL disabled. 

```
docker run -d -p 5678:5678 -e "N8N_SECURE_COOKIE=false" local/n8n-armv7:latest
```

