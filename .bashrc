#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PICO_SDK_PATH=/home/matt/pico/pico-sdk
export PICO_EXAMPLES_PATH=/home/matt/pico/pico-examples
export PICO_EXTRAS_PATH=/home/matt/pico/pico-extras
export PICO_PLAYGROUND_PATH=/home/matt/pico/pico-playground
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
