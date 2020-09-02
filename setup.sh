#!/bin/bash 

# Script Directory
readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Vim's File and Directory
readonly VIMRC_ORG=${SCRIPT_DIR}/vimrc.org
readonly VIMRC_SET=${HOME}/.vimrc
readonly VIM_HOME=${HOME}/.vim
readonly TOML_ORG=${SCRIPT_DIR}/rc
readonly TOML_SET=${HOME}/.vim/rc
readonly TEMP_ORG=${SCRIPT_DIR}/template
readonly TEMP_SET=${HOME}/.vim/template

echo "setup start."

cp ${VIMRC_ORG:?} ${VIMRC_SET:?}
echo "vimrc file set."

if [ -e ${TOML_SET:?} ]; then
    rm -rf ${TOML_SET:?}
    echo "toml file dir delete."
fi

if [ -e ${TEMP_SET:?} ]; then
    rm -rf ${TEMP_SET:?}
    echo "template file dir delete."
fi

if ! [ -e ${VIM_HOME:?} ]; then
    mkdir ${VIM_HOME:?}
fi

cp -r ${TOML_ORG:?} ${VIM_HOME:?}/
for toml_fl in $(ls -1 ${TOML_SET:?})
do
    sed -i -e "s|__HOMEPATH__|${HOME}|g" ${TOML_SET:?}/${toml_fl:?}
done
echo "toml file set."

cp -r ${TEMP_ORG:?} ${VIM_HOME:?}/
echo "template file set."

echo "setup end."
exit 0

