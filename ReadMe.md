# Dumping image file metadata
The command line tool `exiftool`, developed by Phil Harvey, can be used to read, write and edit metadata information of image files (e.g. JPEG files). 
For more information checkout the page [https://exiftool.org/](https://exiftool.org/). 

For information on the command line interface, please refer to [https://exiftool.org/exiftool_pod.html](https://exiftool.org/exiftool_pod.html).

Within this repository a 🐳 Docker file using ⛰️ `alpine` with `exiftool` installed was created to enable the usage of exiftool without the need to installing it locally.  

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

ℹ️ Do not pass the additional `-` that is required when piping a file to exiftool on the command line. In the Docker the default command takes care of this, so you only need to specify the other parameters, e.g. used for dumping metadata like `-a -u -g1` 

```bash
# usage
cat <image file path> | docker run --rm -i ai2ys/exiftool <exiftool parameters>

curl -fsSL <image url> | docker run --rm -i ai2ys/exiftool <exiftool parameters>

# example using default parameters
cat img1.jpg | docker run --rm -i ai2ys/exiftool

# example using some parameters
cat img1.jpg | docker run --rm -i ai2ys/exiftool -a -u -g1
```

When using `docker compose` the command has to look like the following.

```bash
docker compose cat <image file path> | docker compose run --rm -T exiftool <exiftool parameters>
```

In both cases the command can get overwritten when ruinning the container.

Example output
```bash
cat img1.jpg | docker run --rm -i ai2ys/exiftool -a -u -g1
---- ExifTool ----
ExifTool Version Number         : 12.30
---- System ----
File Size                       : 0 bytes
File Modification Date/Time     : 2022:04:03 18:26:43+00:00
File Access Date/Time           : 2022:04:03 18:26:43+00:00
File Inode Change Date/Time     : 2022:04:03 18:26:43+00:00
File Permissions                : prw-------
---- File ----
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
Image Width                     : 20
Image Height                    : 30
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:0 (2 2)
---- JFIF ----
JFIF Version                    : 1.02
Resolution Unit                 : None
X Resolution                    : 1
Y Resolution                    : 1
---- Composite ----
Image Size                      : 20x30
Megapixels                      : 0.000600
```

<!-- Tested on Linux and Windows (with WSL2). -->

## 🐳 Building the Docker image and running the Docker container
This Docker image is based on ⛰️ "alpine" and therefore is small in size.

