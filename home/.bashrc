# .bashrc

arch=""
if command -v uname > /dev/null; then
    arch="$(uname -m)"
fi
if [ "${arch}" = x86_64 -a -f /etc/fedora-release ]; then
    # green
    export PS1="\[\e[1;32m\]\$\[\e[00m\] "
else
    # red
    export PS1="\h|${arch}\[\e[1;31m\]\$\[\e[00m\] "
fi
unset arch

# Set Window title bar for alacritty.
# https://wiki.archlinux.org/title/Alacritty#%22user@host:cwd%22_in_window_title_bar
case "${TERM}" in
alacritty*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s %s\007" "${PWD/#$HOME/\~}" "${TERM}"'
    ;;
*)
    export TERM=xterm-256color
    ;;
esac

export CLICOLOR=1
export HISTSIZE="3000"
export HISTTIMEFORMAT='%Y-%m-%d %T '
export HISTIGNORE=ls:history
export EDITOR=vi
export PAGER='less -R'

# Prevent Ctrl-D to close terminal.
IGNOREEOF=99999999999999
export IGNOREEOF

#export LC_ALL=C
export LC_ALL=en_US.UTF-8

# Wayland
# https://wiki.archlinux.org/title/Wayland
# https://ask.fedoraproject.org/t/tips-of-xwayland-with-sway/30314
if [ "${XDG_SESSION_TYPE}" = wayland ]; then
    export MOZ_ENABLE_WAYLAND=1
    # For Gimp
    export GDK_BACKEND=x11
    # For Java application
    export _JAVA_AWT_WM_NONREPARENTING=1
else
    unset MOZ_ENABLE_WAYLAND
    unset GDK_BACKEND
    unset _JAVA_AWT_WM_NONREPARENTING
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
