#!/usr/bin/fish
source project_ids
# ./**build
set -l builds **/Dockerfile
for build in $builds
    set -l image (string split / $build)[-2]
    set -l context (string split / $build)[1..-2]
    docker build -t $REG/$REPO/$image ./$context
end