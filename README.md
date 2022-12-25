# Configuration files for Framework Laptop

This repository is to share a part of my configuration files on Framework Laptop for people who are interested in using Sway or i3 window manager on Framework Laptop. My environment is Fedora Linux. I don't intend to update this repository regularly. The files are just a snapshot.

The following config files are included:

* Sway (window manager)
  * Using Waybar.
  * Using `home/.xkb/`. Sway has a feature to load `~/.xkb`.
* i3 (window manager)
  * Using i3blocks with [i3blocks-contrib](https://github.com/vivien/i3blocks-contrib) original version and my [forked custom version](https://github.com/junaruga/i3blocks-contrib/tree/mine) until my pull-requests are merged in the original version.
  * Using `etc/X11/xorg.conf.d/*.conf` for the input device settings.
  * Using Compton.
  * Using `.Xmodmap`. Only i3 loads the `.Xmodmap`. Sway doesn't load it.
  * Using `usr/share/X11/xkb/` optionally. But make sure that it's risky to edit files under the /usr.
* VIM: In the `.vimrc`, the `highlight` settings are related to the terminals.
* Alacritty (terminal)
* Terminator (terminal)
* `.bash_profile`: It seems that this file is only loaded by i3, not by Sway.
* `.bashrc`: Only contents related to window managers and terminals.

## License

Public Domain (CC0)

## Screenshots

Note the screenshots are not the latest ones.

### Sway

![Sway screenshot](image/screenshot_sway.png)

### i3

![i3 screenshot](image/screenshot_i3.png)

## File list

The directory structure is equivalent with the actual directores under the root "/".

```
$ tree -a etc/ home/ usr/
etc/
└── X11
    └── xorg.conf.d
        ├── 00-keyboard.conf
        ├── 01-custom-keyboard.conf
        └── 40-trackpad.conf
home/
├── .bash_profile
├── .bashrc
├── .bashrc.d
│   └── 40-fcitx.sh
├── .config
│   ├── alacritty
│   │   ├── alacritty.yml
│   │   └── framework.yml
│   ├── compton.conf
│   ├── i3
│   │   └── config
│   ├── i3blocks
│   │   ├── brightness
│   │   │   ├── brightness.png
│   │   │   ├── LICENSE
│   │   │   ├── main.c
│   │   │   ├── Makefile
│   │   │   └── README.md
│   │   └── config
│   ├── i3status
│   │   └── config
│   ├── sway
│   │   └── config
│   ├── terminator
│   │   └── config.framework
│   └── waybar
│       ├── config
│       └── style.css
├── .vimrc
├── .xkb
│   ├── rules
│   │   ├── evdev
│   │   └── evdev.org
│   └── symbols
│       └── custom
└── .Xmodmap
usr/
└── share
    └── X11
        └── xkb
            ├── rules
            │   ├── evdev
            │   ├── evdev.org
            │   ├── evdev.xml
            │   └── evdev.xml.org
            └── symbols
                ├── compose
                ├── compose.org
                └── custom

5 directories, 7 files
```

## Tested versions & memo

```
$ rpm -q sway waybar i3 i3status alacritty terminator firefox gimp fcitx5
sway-1.6.1-3.fc35.x86_64
waybar-0.9.8-2.fc35.x86_64
i3-4.20.1-1.fc35.x86_64
i3status-2.14-1.fc35.x86_64
alacritty-0.9.0-1.fc35.x86_64
terminator-2.1.1-3.fc35.noarch
firefox-95.0.2-2.fc35.x86_64
gimp-2.10.28-1.fc35.x86_64
fcitx5-5.0.11-1.fc35.x86_64
```

### Memo

In my experience,

* Sway: A better functionality than i3.
  * Firefox crashed when doing bookmark on Sway.
  * Gimp freezed when opening a window to resize an image on Sway.
  * Alacritty doesn't work with fcitx5 for the Japanese input on Sway.
* i3: A better stability than Sway.
  * I needed to set a background image with another application such as `feh`.
  * I needed to set input/output devices with `/etc/X11/xorg.conf.d/*.conf`.
  * I couldn't find a way to set a window gap setting on i3.

## References

Here are useful examples that you may refer.

* Sway config: https://github.com/201dreamers/sway-config

* i3 config: https://github.com/LukeSmithxyz/voidrice

  ```
  $ git checkout https://github.com/LukeSmithxyz/voidrice.git
  $ cd voidrice
  $ git checkout ad161d9363aadeb9f4ec3c852ca6c96162f2b4b0
  $ vi .config/i3/config
  ```

## Config tips

I am sharing the configuration tips for Framework Laptop on this repository's [wiki](https://github.com/junaruga/framework-laptop-config/wiki).

## Call to action

Let's share your config files for Framework Laptop!
