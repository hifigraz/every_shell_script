#!/usr/bin/env sh

clean_up() {
  log_info cleaning up all stuff
}

if [ ! $(which every_shell_script.sh) >/dev/null 2>&1 ]; then
  echo "install https://www.github.com/hifigraz/every_shell_script" >&2
  exit 255 
fi

. $(every_shell_script.sh)

log_info do your magic here

clean_up
