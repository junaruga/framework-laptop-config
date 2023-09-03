#!/usr/bin/env bash

usage() {
  echo "Usage: $(basename "$0") [-d DEFAULT_BORDER_PX] [-m MAXIMIZED_BORDER_PX]"
}

get_waybar_height() {
  # Waybar's config is JSONC, ie it contains comments. We need to strip
  # these for jq.
  grep -v '//' ~/.config/waybar/config | jq -er '.height'
}

current_output_resolution() {
  swaymsg -t get_outputs | \
    jq -e -r \
    '.[] | select(.focused==true) |
     .current_mode|(.width | tostring) + " " + (.height | tostring)'
}

current_node_size() {
  swaymsg -t get_tree | jq -er \
    'recurse(.nodes[]) | select(.nodes[].focused == true).rect | "\(.width) \(.height)"'
}

is_floating() {
  swaymsg -t get_tree | jq -er \
    '.. | select(.type?) | select(.focused==true) | .type == "floating_con"' >/dev/null
}

is_sole_node() {
  local output_width output_height
  local node_width node_height
  local bar_height

  read -r output_width output_height <<< "$(current_output_resolution)"
  read -r node_width node_height <<< "$(current_node_size)"
  bar_height="$(get_waybar_height)"

  [[ "$(( node_height + bar_height ))" == "$output_height" ]] && \
    [[ "$node_width" == "$output_width" ]]
}

get_next_ws_num() {
  swaymsg -t get_workspaces | jq -er 'sort_by(.num)[-1].num + 1'
}

move_win_to_new_ws() {
  local next_ws_num
  next_ws_num="$(get_next_ws_num)"
  swaymsg "move window to workspace ${next_ws_num}; workspace number ${next_ws_num}"
}

wait_for_focus_change() {
  local cmd=("$@")

  local win_id
  win_id="$(current_window_id)"

  # Wait for focus to change and unfloat
  (swaymsg -t subscribe '[ "window" ]' -m &) | jq -ern 'first(inputs | if (.change == "focus") then (., halt) else empty end)'

  swaymsg "[con_id=${win_id}] ${cmd[*]}"
}

current_window_id() {
  swaymsg -t get_tree | jq -r '..|try select(.focused == true).id'
}

maximize_current_node() {
  local output_width output_height bar_height

  read -r output_width output_height <<< "$(current_output_resolution)"
  bar_height="$(get_waybar_height)"

  swaymsg "border pixel ${MAXIMIZED_BORDER_PX};
           floating enable; resize set ${output_width} $(( output_height - bar_height ))"
  wait_for_focus_change "border pixel ${DEFAULT_BORDER_PX}, floating disable"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  # Legacy. This is the simplest way of "maximizing" a window, by just moving it
  # to a new workspace
  # move_win_to_new_ws

  DEFAULT_BORDER_PX=2
  MAXIMIZED_BORDER_PX=10

  while [[ -n "$*" ]]
  do
    case "$1" in
      help|h|-h|--help)
        usage
        exit 0
        ;;
      -d|--default-border-pixel)
        DEFAULT_BORDER_PX="$2"
        shift 2
        ;;
      -m|--max-border-pixel)
        MAXIMIZED_BORDER_PX="$2"
        shift 2
        ;;
      --)
        shift
        break
        ;;
      *)
        break
        ;;
    esac
  done

  if is_sole_node
  then
    echo "There's only one window on the current workspace" >&2
    exit 1
  fi

  if is_floating
  then
    swaymsg "floating disable; border pixel ${DEFAULT_BORDER_PX}"
    echo "⬇️  Tiling current window (unmaximize)" >&2
    exit "$?"
  fi

  echo "⬆️  Maximize current window" >&2
  maximize_current_node
fi