# Pivotal Labs Denver Vim Configuration

This repo was created in an attempt to standarize a vim configuration
for use in the office and with new clients. This was created out of a
need for a previously bloated and outdated config, so please add
dependencies only after thoughtful consideration.

This config uses Vundle for dependency management, and separates language
specific plugins and their configs into different .bundle and .config
file.

# Installation
##Dependencies
In order to install this config, you must be running vim 7.4, and have `ag`,
a.k.a the silver searcher, installed on your machine.

##Install
```
bundle && rake
```
This will install Vundle and some git hooks that use exuberant ctags. It will
also install exuberant ctags from homebrew. Since OSX has a ctags natively installed,
make sure that `/usr/local/bin` preceeds `/usr/bin` in your `$PATH` so that your
machine will prefer the exuberant ctags executable.

# Useful tricks
## Project wide search and replace
```
:Ag findme
:Qargs | argdo %s/findme/replacement/gc | update
```

