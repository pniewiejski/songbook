#!/bin/bash

SELF_NAME=$1
BASE_DIR="songs"
INDEX="${BASE_DIR}/index.tex"
TMP_INDEX_FILE="_index"
TMP_INDEX="${BASE_DIR}/${TMP_INDEX_FILE}.tex"

PrintLatexComment() {
  local COMMENT_CONTENT=$1
  echo "% ${COMMENT_CONTENT}"
}

PrintHeaderInfo() {
  PrintLatexComment "This file is generated automatically by ${SELF_NAME}"
  PrintLatexComment "Do not modify this file as it will be overwritten when ${SELF_NAME} is executed."
  PrintLatexComment "This index file was generated on $(date)"
}

LinkFiles() {
  if [[ -d $1 ]]; then
    echo "Searching directory: $1"
    declare -a files=($(ls -B $1 | grep -v -E "${TMP_INDEX_FILE}|\\s" | sort)) # Ignore files with spaces
    for item in ${files[@]}; do
      LinkFiles "$1/$item" $2
    done
  elif [[ -f $1 && $(grep -E '\.tex' <<< "$1") ]]; then
    echo "Processing file: $1"
    WriteInclude $1 $2
  fi
}

WriteInclude() {
  echo "\\input{${1%.*}}" >> $2
}

# MAIN
echo "Searching files to link..."

[[ -f $INDEX ]] && rm $INDEX > /dev/null

PrintHeaderInfo > $TMP_INDEX

LinkFiles $BASE_DIR $TMP_INDEX

mv $TMP_INDEX $INDEX

