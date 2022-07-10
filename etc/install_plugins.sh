#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202207042123-git
# @Author            :  Jason Hempstead
# @Contact           :  jason@casjaysdev.com
# @License           :  LICENSE.md
# @ReadME            :  install_plugins --help
# @Copyright         :  Copyright: (c) 2022 Jason Hempstead, Casjays Developments
# @Created           :  Saturday, Jul 09, 2022 15:22 EDT
# @File              :  install_plugins
# @Description       :
# @TODO              :
# @Other             :
# @Resource          :
# @sudo/root         :  no
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
APPNAME="$(basename "$0")"
VERSION="202207042123-git"
HOME="${USER_HOME:-$HOME}"
USER="${SUDO_USER:-$USER}"
RUN_USER="${SUDO_USER:-$USER}"
SRC_DIR="${BASH_SOURCE%/*}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set bash options
if [[ "$1" == "--debug" ]]; then shift 1 && set -xo pipefail && export SCRIPT_OPTS="--debug" && export _DEBUG="on"; fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
TMUX_HOME="${TMUX_HOME:-$HOME/.config/tmux}"
TMUX_SHARE_DIR="${TMUX_SHARE_DIR:-$HOME/.local/share/tmux}"
TMUX_PLUGIN_MANAGER_PATH="${TMUX_PLUGIN_MANAGER_PATH:-$TMUX_SHARE_DIR/tpm}"
export TMUX_HOME TMUX_PLUGIN_MANAGER_PATH TMUX_SHARE_DIR
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[[ -d "$TMUX_PLUGIN_MANAGER_PATH/.git" ]] && git -C "$TMUX_PLUGIN_MANAGER_PATH" pull ||
  git clone "https://github.com/tmux-plugins/tpm" "$TMUX_PLUGIN_MANAGER_PATH"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[ -x "$TMUX_PLUGIN_MANAGER_PATH/bin/install_plugins" ] &&
  "$TMUX_PLUGIN_MANAGER_PATH/bin/install_plugins"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mkdir -p "$TMUX_SHARE_DIR/resurrect"
[[ -f "$TMUX_HOME/resurrect" ]] &&
  ln -sf "$TMUX_HOME/resurrect" "$TMUX_SHARE_DIR/resurrect/last"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[[ -f "$TMUX_PLUGIN_MANAGER_PATH/tpm" ]] && [[ -f "$TMUX_SHARE_DIR/resurrect/last" ]] &&
  echo "Install completed"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
exit ${exitCode:-$?}
