# Dumping image file metadata
The command line tool `exiftool`, developed by Phil Harvey, can be used to read, write and edit metadata information of image files (e.g. JPEG files). 
For more information checkout the page [https://exiftool.org/](https://exiftool.org/). 

For information on the command line interface, please refer to [https://exiftool.org/exiftool_pod.html](https://exiftool.org/exiftool_pod.html).

Within this repository a 🐳 Docker file using `alpine` with `exiftool` installed was created to enable the usage of exiftool without the need to installing it locally.  

<!--
## 🐧 Installing `exiftool` on Ubuntu/Debian locally
```bash
sudo apt-get update
sudo apt-get install -y exiftool
```
--> 

## 🐳 Fast forward using the pre-built Docker image
Ready to use Docker image is available on DockerHub.
[https://hub.docker.com/repository/docker/ai2ys/exiftool](https://hub.docker.com/repository/docker/ai2ys/exiftool)

ℹ️ Do not pass the additional `-` that is required when piping a file to exiftool on the command line. In the Docker image a script is used to take care of this, so you only need to specify the other parameters, e.g. used for dumping metadata like `-a -u -g1` 

```bash
# usage
cat <image file path> | docker run --rm -i ai2ys/exiftool <exiftool parameters>

# example using default parameters
cat img1.jpg | docker run --rm -i ai2ys/exiftool

# example using some parameters
cat img1.jpg | docker run --rm -i ai2ys/exiftool -a -u -g1
```

For running on image from the web the following command can be used. For the parameters the same as above applies only pass the parameters, but omit the `-` that is usually required when using pipe.

```bash
# usage
echo <url> | docker run --rm -i --entrypoint "/bin/sh ./curl.sh" ai2ys/exiftool <exiftool parameters>
```

Tested on Linux and Windows (with WSL2).

## 🐳 Building the Docker image and running the Docker container
This Docker image is based on "alpine" and therefore is small in size.

The batch script described below uses `docker-compose` for running the Docker container, which will also automatically build/pull the image, if not already available. 


```bash
# usage for files
cat <image file path> | ./exiftool.sh <exiftool parameters>

# example usage
cat img1.jpg | ./exiftool.sh -a -u -g1
```

```bash
# usage for urls
echo <url> | ./exiftool_curl.sh <exiftool parameters>

# example usage
echo <url> | ./exiftool_curl.sh -a -u -g1
```

