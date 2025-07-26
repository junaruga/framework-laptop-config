# Configuration files for Framework Laptop

This repository is to share a part of my configuration files on Framework Laptop for people who are interested in using Sway or i3 window manager on Framework Laptop. My environment is Fedora Linux. I don't intend to update this repository regularly. The files are just a snapshot.

The following config files are included:

* Sway (window manager)
  * Using Waybar.
  * Using `home/.config/xkb/`. Sway has a feature to load `~/.config/xkb`.
* i3 (window manager)
  * Using i3blocks with [i3blocks-contrib](https://github.com/vivien/i3blocks-contrib) original version and my [forked custom version](https://github.com/junaruga/i3blocks-contrib/tree/mine) until my pull-requests are merged in the original version.
  * Using `etc/X11/xorg.conf.d/*.conf` for the input device settings.
  * Using Compton.
  * Using `.Xmodmap`. Only i3 loads the `.Xmodmap`. Sway doesn't load it.
  * Setting `/usr/share/X11/xkb/symbols/custom` for custom keyboard layout. See [this page on my blog](https://junaruga.hatenablog.com/entry/2022/08/11/165301) for details.
* VIM: In the `.vimrc`, the `highlight` settings are related to the terminals.
* Alacritty (terminal)
* Terminator (terminal)
* Mouseless
* `.bash_profile`: It seems that this file is only loaded by i3, not by Sway.
* `.bashrc`: Only contents related to window managers and terminals.

## License

Public Domain (CC0)

## Screenshots

### Framework Laptop 12 Sway

![Laptop 12 Sway screenshot](image/screenshot_laptop_12_sway.png)

![Laptop 12 Sway screenshot programming](image/screenshot_laptop_12_sway_programming.png)

### Framework Laptop 13 Sway

![Laptop 13 Sway screenshot](image/screenshot_laptop_13_sway.png)

### Framework Laptop 13 i3

![Laptop 13 i3 screenshot](image/screenshot_laptop_13_i3.png)

## File list

The directory structure is equivalent with the actual directories under the root "/". You can run the following command to find the directory structure.

```
$ tree -a etc/ home/ usr/
```
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
