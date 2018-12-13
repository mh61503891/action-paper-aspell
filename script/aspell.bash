#!/bin/bash

set -eu

X_ASPELL_LANG=${ASPELL_LANG:-"en"}
X_ASPELL_MODE=${ASPELL_MODE:-"tex"}
X_ASPELL_PERSONAL=${ASPELL_PERSONAL:-"./.aspell.$X_ASPELL_LANG.pws"}
X_ASPELL_FILES=${ASPELL_FILES:-"main.tex   main.bib"}

# echo $X_ASPELL_LANG
# echo $X_ASPELL_MODE
# echo $X_ASPELL_PERSONAL
# echo $X_ASPELL_FILES

for file in $X_ASPELL_FILES; do
  if [[ ! -f $file ]]; then
    echo "$file does not exists."
    exit 0
  fi
done

words=$(cat $X_ASPELL_FILES | aspell --lang=$X_ASPELL_LANG --mode=$X_ASPELL_MODE --personal=$X_ASPELL_PERSONAL list | sort | uniq)

echo "Target files:"
for file in $X_ASPELL_FILES; do
  echo "* $file"
done

if [[ -z $words ]]; then
  echo "Result: Succeeded"
  exit 0
else
  echo "Result: Failed"
fi

echo "Misspelled words:"
for word in $words; do
  echo "* $word"
done

echo "Result of grep:"
for word in $words; do
  grep -nH $word $X_ASPELL_FILES
done

exit 1
