#!/bin/bash

# Run docker image to build the themes.
docker run -e PATTERN=preview -v $PWD/output/:/src/output daylerees/rainglow:latest

# Merge all the previews together.
cat output/preview/*.html > template-middle.html

# Kill old preview.
rm -rf ../index.html

# Generate preview file.
cat template-top.html template-middle.html template-bottom.html > ../index.html

# Delete temp themes.
rm -rf output
rm -rf template-middle.html

