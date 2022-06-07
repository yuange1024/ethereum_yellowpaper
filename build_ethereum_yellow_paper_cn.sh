#!/usr/bin/env bash

set -e

rm -rf Options.tex

if [ -d ".git" ]; then

SHA=`git rev-parse --short --verify HEAD`
DATE=`git show -s --format="%cd" --date=short HEAD`
# REV="$SHA - $DATE"
# chinese version's origin version
REV="f72032b - 2022-06-05"
echo "\def\YellowPaperVersionNumber{$REV}" >> Options.tex

fi


if [ "$1" == "white" ]; then

echo "\definecolor{pagecolor}{rgb}{1,1,1}" >> Options.tex

fi

echo "\newcommand{\YellowPaperVersionNumber}{$REV}" > Version.tex


xelatex -interaction=errorstopmode -halt-on-error ethereum_yellow_paper_cn.tex && \
bibtex ethereum_yellow_paper_cn && \
xelatex -interaction=errorstopmode -halt-on-error ethereum_yellow_paper_cn.tex && \
xelatex -interaction=errorstopmode -halt-on-error ethereum_yellow_paper_cn.tex && \
xelatex -interaction=errorstopmode -halt-on-error ethereum_yellow_paper_cn.tex && \
rm -rf Options.tex

