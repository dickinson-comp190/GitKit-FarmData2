#!/usr/bin/env bash

## Called by KitClient to install features.
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

#set -ex
set -e

## Move to the root of the project.
cd "$SCRIPT_DIR"
while [[ ! -d .git ]] ; do
    cd ..
done

## Install features into the client.
for feature in ./.kit/features/* ; do
#    pwd
    script="$feature"/install-into-client.sh
    if [[ -e "$script" ]] ; then
#        echo "$scipt"
        "$script"
    fi
done
