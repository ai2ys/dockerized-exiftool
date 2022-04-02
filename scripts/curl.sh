# url has to get passed to this script using 'echo <url> | ./curl.sh'
xargs curl --url | ./exiftool.sh "$@" 