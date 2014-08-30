#!/bin/bash

##---------------------
## git building script
##---------------------

git config --global user.name "Chenhan D. Yu"
git config --global user.email "chenhan@cs.utexas.edu"

git config --global core.autocrlf true
git config --global core.autocrlf input

git config --global core.writespace trailing-space
git config --global core.writespace cr-at-eol
git config --global core.writespace -indent-with-non-tab
git config --global core.writespace fix
git config --global filter.tabspace.clean 'expand -t 2'

git config --global color.ui true
git config --global help.autocorrect 1

git config --global core.excludesfile ./.gitignore_global

git config -l

##---------------------
## Manually modify
##---------------------
##
## ~/.git/gitinfo/attributes
##
## *.f filter=tabspace
## *.f90 filter=tabspace
## *.h filter-tabspace
## *.c filter-tabspace
## *.cu filter-tabspace
## *.cpp filter-tabspace
## *.hpp filter-tabspace
