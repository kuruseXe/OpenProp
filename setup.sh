#!/bin/bash 

# Script Directory
readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Vim's File and Directory
readonly VIMRC_ORG=${SCRIPT_DIR}/vimrc.org
readonly VIMRC_SET=${HOME}/.vimrc
readonly TOML_ORG=${SCRIPT_DIR}/rc
readonly TOML_SET=${HOME}/.vim/rc

echo "setup start."

cp ${VIMRC_ORG:?} ${VIMRC_SET:?}
echo "vimrc file set."

if [ -e ${TOML_SET:?} ]; then
    rm -rf ${TOML_SET:?}
    echo "toml file dir delete."
fi

cp -r ${TOML_ORG:?} ${TOML_SET:?}
echo "toml file set."

echo "setup end."
exit 0

