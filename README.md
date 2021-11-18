<div align="center">
  
# tmux.fish ❐ 🐟
  
</div>

This is a [tmux](https://github.com/tmux/tmux) plugin for [fish](https://fishshell.com/). Inspired by or rather a port for [ohmyzsh tmux plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux).

## Features

This plugin does the following:

- determines if tmux is installed or not, if not, prompt user to install tmux
- autostart/autoconnect tmux by default
- determines if the terminal supports the 256 colors or not, sets the appropriate configuration variable
- sets the correct local config file to use
- aliases for tmux

## Installation

First, make sure you have the recent version of tmux and fish as I don't test this on older version. Next, install this plugin with [Fisher](https://github.com/jorgebucaran/fisher):
```
fisher install budimanjojo/tmux.fish
```

## Aliases

| Alias  | Command                | Description                                               |
| ------ | -----------------------|---------------------------------------------------------- |
| `ta`   | tmux attach -t         | Attach new tmux session to already running named session  |
| `tad`  | tmux attach -d -t      | Detach named tmux session                                 |
| `ts`   | tmux new-session -s    | Create a new named tmux session                           |
| `tl`   | tmux list-sessions     | Displays a list of running tmux sessions                  |
| `tksv` | tmux kill-server       | Terminate all running tmux sessions                       |
| `tkss` | tmux kill-session -t   | Terminate named running tmux session                      |

## Configuration Variables

| Variable                            | Description                                                                               |
|-------------------------------------|-------------------------------------------------------------------------------------------|
| `fish_tmux_fixterm`                 | Sets `$TERM` to 256-color term or not based on current terminal support (default: `true`) |
| `fish_tmux_iterm2`                  | Sets the `-CC` option for iTerm2 tmux integration (default: `false`)                      |
| `fish_tmux_fixterm_without_256color`| `$TERM` to use for non 256-color terminals (default: `screen`)                            |
| `fish_tmux_fixterm_with_256color`   | `$TERM` to use for 256-color terminals (default: `screen-256color`                        |
| `fish_tmux_config`                  | Set the configuration path (default: `$HOME/.tmux.conf`)                                  |
| `fish_tmux_unicode`                 | Set `tmux -u` option to support unicode (default: `false`)                                |

## Configuration

You can export the default configuration variables either from your `config.fish` or in your terminal, for example:
```
set -Ux fish_tmux_config $HOME/.config/tmux.conf
```

## License
MIT License
