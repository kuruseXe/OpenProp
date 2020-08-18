#!/bin/sh
#
# <+FILENAME+>.sh version <+DATE+>
#
# Usage:
#   <+FILENAME+>.sh param1 param2 ...
#     param1 - パラメータ名1 (e.g. gsm, msm)
#     param2 - パラメータ名2 (e.g. 20151028, FileName)
#       .
#       .
#       .
#
# Description:
#  <+FILENAME+>.shについての記述箇所です。
#  
#
#  必要の無い処理については削除してください。
#
###########################################################################
<+CURSOR+>
readonly APP_NAME="<+FILENAME+>"

#directory
readonly BASE_DIR="${HOME}/----/${APP_NAME:?}"
readonly MDL_DIR="${BASE_DIR:?}/lib/----"

#initial time
DAY=$(date '+%Y%m%d')

#log file and directory
readonly LOG_DIR="${BASE_DIR:?}/log"
readonly LOG_FILE="${LOG_DIR:?}/${APP_NAME:?}_${DAY:?}.log"

#log directory check
if [ ! -d ${LOG_DIR:?} ]; then
  mkdir ${LOG_DIR:?}
fi

# main process
{
    echo "[$(date '+%H:%M:%S')] start"

    cd ${BASE_DIR:?}

    ## argument check
    if [ ${#} -le 0 ]; then
        echo "usage: Invalid argument!"
        echo "[$(date '+%H:%M:%S')] end"
        echo " "
        exit 1
    fi







    echo "[$(date '+%H:%M:%S')] end"
    echo " "
} >>${LOG_FILE:?}

# file delete
find ${LOG_DIR:?} -type f -name "*.log" -mtime +5 -exec rm -f {} \;

exit 0
