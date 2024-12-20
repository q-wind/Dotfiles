#!/bin/bash

# cd to the dir of this script, and get the path
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
# echo ${BASEDIR}

# link
echo "linking .tmux.conf and .vimrc to ~/"
ln -sf "${SCRIPT_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${SCRIPT_DIR}/.vimrc" "${HOME}/.vimrc"

# reload
if command -v tmux >/dev/null 2>&1; then
    echo "reload tmux configuration"
    tmux source-file "${HOME}/.tmux.conf" >/dev/null 2>&1
else
    echo "tmux is not installled"
fi

if ! command -v vim >/dev/null 2>&1; then
    echo "vim is not installled"
fi

echo "completed"
