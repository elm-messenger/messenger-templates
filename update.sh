#!/bin/bash

v=$(pnpm view elm-regl-js version)

echo "elm-regl-js version $v"

html=$(curl -s https://package.elm-lang.org/packages/linsyking/messenger-core/latest)
core_version=$(echo "$html" | grep -oP '(?<=<title>messenger-core )[^<]+')

echo "core version $core_version"

html=$(curl -s https://package.elm-lang.org/packages/linsyking/elm-regl/latest)
regl_version=$(echo "$html" | grep -oP '(?<=<title>elm-regl )[^<]+')

echo "regl version $regl_version"

sed -E -i "s/(\"linsyking\/elm-regl\":\s*\")([^\"]+)(\")/\1${regl_version}\3/" elm.json

sed -E -i "s/(\"linsyking\/messenger-core\":\s*\")([^\"]+)(\")/\1${core_version}\3/" elm.json

sed -E -i 's/(elm-regl-js@)[0-9]+\.[0-9]+\.[0-9]+/\1'"$v"'/' public/index.html
sed -E -i 's/(elm-regl-js@)[0-9]+\.[0-9]+\.[0-9]+/\1'"$v"'/' public/index.min.html

wget -O public/regl.js https://cdn.jsdelivr.net/npm/elm-regl-js@${v}/dist/regl.js
wget -O public/regl.min.js https://cdn.jsdelivr.net/npm/elm-regl-js@${v}/dist/regl.min.js
