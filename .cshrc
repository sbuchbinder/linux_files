#!/usr/bin/env tcsh

# disable core dump generation.
limit coredumpsize 0

# set default CD path.
set cdpath = ~

# set default file permissions
umask 022

# disable path search hashing
unhash

# interactive shell configuration
if ($?prompt) then
    # set history size
    set history = 100

    # enable filename completion
    set filec

    # set to notify job status change immediately
    # set notify

    # ignore EOF (^D) for this shell
    set ignoreeof

    # set default pager
    setenv PAGER /usr/bin/less

    # vim configuration; enable auto-indent
    setenv EXINIT "set ai"

    # disable beeping
    set nobeep
    
    # setup to print custom prompt banner
    alias precmd "${HOME}/bin/setup_prompt.sh"
    set prompt="%{\033[1;33m%}-%{\033[1;34m%}>%{\033[0m%} "
    set prompt2="%{\033[1;33m%}-%{\033[1;34m%}>%{\033[0m%} "
endif

# add custom aliases
if ( -e ~/.csh_aliases ) then
    source ~/.csh_aliases
endif

# set emacs as editor
setenv EDITOR "emacs"

setenv MY_APPLICATIONS ${HOME}/Applications
if ( -e ${MY_APPLICATIONS}/.cshrc ) then
    source ${MY_APPLICATIONS}/.cshrc
endif

# add custom scripts to path
set path = ( \
    ${HOME}/bin \
    $path \
    )

# add additional site-specific customizations
if ( -e ${HOME}/.cshrc_custom ) then
    source ${HOME}/.cshrc_custom
endif
