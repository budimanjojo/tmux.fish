<div align="center">

# tmux.fish ❐ 🐟

</div>

> [!NOTE]
> There are breaking changes before v2 which is basically a complete rewrite. This plugin was not one to one port of [ohmyzsh tmux plugin](https://github.com/ohmyzsh/tree/master/plugins/tmux) before v2. After v2 (including this main branch) this plugin works and behaves exactly like the zsh plugin. See [this for more information](https://github.com/budimanjojo/tmux.fish/issues/12).

This is a [tmux](https://github.com/tmux/tmux) plugin for [fish](https://fishshell.com/). It is port of [ohmyzsh tmux plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux) but for Fish shell.

## Features

This plugin does the following:

- determines if tmux is installed or not, if not, prompt user to install tmux
- determines if the terminal supports the 256 colors or not, sets the appropriate configuration variable
- sets the correct local config file to use

## Installation

First, make sure you have the recent version of tmux and fish as I don't test this on older version. Next, install this plugin with [Fisher](https://github.com/jorgebucaran/fisher):
```
fisher install budimanjojo/tmux.fish
```

## Aliases

| Alias      | Command                        | Description                                               |
| ---------- | -------------------------------|---------------------------------------------------------- |
| `ta`       | tmux attach -t                 | Attach new tmux session to already running named session  |
| `tad`      | tmux attach -d -t              | Detach named tmux session                                 |
| `tds`      | `_fish_tmux_directory_session` | Creates or attaches to a session for the current path     |
| `tkss`     | tmux kill-session -t           | Terminate named running tmux session                      |
| `tksv`     | tmux kill-server               | Terminate all running tmux sessions                       |
| `tl`       | tmux list-sessions             | Displays a list of running tmux sessions                  |
| `tmux`     | `_fish_tmux_plugin_run`        | Start a new tmux session                                  |
| `tmuxconf` | `$EDITOR $fish_tmux_config`    | Open .tmux.conf file with an editor                       |
| `ts`       | tmux new-session -s            | Create a new named tmux session                           |

## Configuration Variables

| Variable                            | Description                                                                                                 |
|-------------------------------------|-------------------------------------------------------------------------------------------------------------|
| `fish_tmux_autostart`               | Automatically starts tmux (default: `false`)                                                                |
| `fish_tmux_autostart_once`          | Autostart only if tmux hasn't been started previously (default: `true`)                                     |
| `fish_tmux_autoconnect`             | Automatically connect to previous session if it exits (default: `true`)                                     |
| `fish_tmux_autoquit`                | Automatically closes terminal once tmux exits (default: `fish_tmux_autostart`)                              |
| `fish_tmux_config`                  | Set the configuration path (default: `$HOME/.tmux.conf`, `$XDG_CONFIG_HOME/tmux/tmux.conf`)                 |
| `fish_tmux_default_session_name`    | Set tmux default session name when autostart is enabled                                                     |
| `fish_tmux_autoname_session`        | Automatically name new sessions based on the basename of `$PWD` (default: `false`)                          |
| `fish_tmux_detached`                | Set the detached mode (default: `false`)                                                                    |
| `fish_tmux_fixterm`                 | Sets `$TERM` to 256-color term or not based on current terminal support (default: `true`)                   |
| `fish_tmux_fixterm_without_256color`| `$TERM` to use for non 256-color terminals (default: `tmux` if available, `screen` otherwise)               |
| `fish_tmux_fixterm_with_256color`   | `$TERM` to use for 256-color terminals (default: `tmux-256color` if available, `screen-256color` otherwise) |
| `fish_tmux_iterm2`                  | Sets the `-CC` option for iTerm2 tmux integration (default: `false`)                                        |
| `fish_tmux_unicode`                 | Set `tmux -u` option to support unicode (default: `false`)                                                  |

## Configuration

You can modify the default configuration variables either by exporting the env from your `config.fish` or in your terminal.
To autostart `tmux` when you open your terminal, you can put something like this in your `config.fish`:

```
status is-interactive; and begin
    set fish_tmux_autostart true
end
```

Remember to order the `set` command after `$PATH` is set correctly for `tmux` command so the plugin can it.

## Difference with ZSH Version

- Autostart is a [fish function](https://fishshell.com/docs/current/cmds/function.html) with `--on-variable` option. This means the autostart will run as soon as you change the variable `$fish_tmux_autostart` to `true`. This lets you decide when to start the function. This is needed due to how `fish` handle the order of execution. Fish will always load everything inside `$__fish_config_dir/conf.d` before running user config. This leads to issue such as [tmux not found](https://github.com/budimanjojo/tmux.fish/issues/4).
- Most configuration variables are local to the function when being run. So your current shell won't be filled with `fish_tmux_xxx` variables.

## License
MIT License
