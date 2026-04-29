#!/bin/sh

BUILD_DOCKERFILE="Dockerfile"
BUILD_REG=
BUILD_TAG=1.0.0-local

## note WPM_TOKEN must be exported in shell (security)
docker build \
    --secret id=wpm_token_key,src=${HOME}/wpm_token_key.txt \
    -t ${BUILD_REG}webmethods-ai-coding-demos:${BUILD_TAG} \
    -f ${BUILD_DOCKERFILE} \
    .

echo "Done!!"
exit 0;