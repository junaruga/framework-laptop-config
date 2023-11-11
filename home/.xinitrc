xrdb ~/.Xresources

# dbus-launch for Slack on Flatpak.
# https://github.com/flatpak/flatpak/issues/2754
eval "$(dbus-launch --sh-syntax --exit-with-session)"

exec i3
