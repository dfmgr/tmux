#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
APPNAME="$(basename "$0")"
VERSION="202108242343-git"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"
SRC_DIR="${BASH_SOURCE%/*}"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set bash options
[[ "$1" == "--debug" ]] && shift 1 && set -euo pipefail

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202108242343-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.com
# @License       : WTFPL
# @ReadME        : install_plugins.sh
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Tuesday, Aug 24, 2021 23:43 EDT
# @File          : install_plugins.sh
# @Description   : Install tmux plugins
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
TMUX_HOME="$HOME/.config/tmux"
TMUX_SHARE_DIR="$HOME/.local/share/tmux"
TMUX_PLUGIN_MANAGER_PATH="$TMUX_SHARE_DIR/tpm"
export TMUX_HOME TMUX_PLUGIN_MANAGER_PATH TMUX_SHARE_DIR
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[[ -d "$TMUX_PLUGIN_MANAGER_PATH/.git" ]] && git -C "$TMUX_PLUGIN_MANAGER_PATH" pull ||
  git clone https://github.com/tmux-plugins/tpm "$TMUX_PLUGIN_MANAGER_PATH"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[ -x "$TMUX_PLUGIN_MANAGER_PATH/bin/install_plugins" ] &&
  $TMUX_PLUGIN_MANAGER_PATH/bin/install_plugins
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mkdir -p "$TMUX_SHARE_DIR/resurrect"
[[ -f "$TMUX_HOME/resurrect" ]] && ln -sf "$TMUX_HOME/resurrect" "$TMUX_SHARE_DIR/resurrect/last"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[[ -f "$TMUX_PLUGIN_MANAGER_PATH/tpm" ]] && [[ -f "$TMUX_SHARE_DIR/resurrect/last" ]] && echo "Install completed"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
exit ${exitCode:-$?}
