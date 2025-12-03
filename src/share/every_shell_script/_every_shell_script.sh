#!/usr/bin/env sh

TMP_USER=/tmp/$(id -u)
TMP_DIR=${TMP_USER}/$(uuidgen)
USAGE_FILE=${TMP_DIR}/usage.txt

[ -z "${LOG_LEVEL}" ] && LOG_LEVEL=2
[ -z "${LOG_TIME_FORMAT}" ] && LOG_TIME_FORMAT="+%Y%m%d:%H%M%S"

log() {
  level=$1
  shift
  level_string="UNKNOWN"
  if [ "${level}" -ge "${LOG_LEVEL}" ]; then
    case ${level} in 
      0) level_string="TRACE"
        ;;
      1) level_string="DEBUG"
        ;;
      2) level_string="INFO"
        ;;
      3) level_string="WARNING"
        ;;
      4) level_string="ERROR"
        ;;
      5) level_string="CRITICAL"
        ;;
      6) level_string="FATAL"
    esac
    printf "%s %-8s %s\n" $(date "${LOG_TIME_FORMAT}") "${level_string}" "$*" >&2
  fi
}

log_trace() {
  log 0 $*
}
log_debug() {
  log 1 $*
}
log_info() {
  log 2 $*
}
log_warning() {
  log 3 $*
}
log_error() {
  log 4 $*
}
log_critical() {
  log 5 $*
}
log_fatal() {
  log 6 $*
}

if [ "$(basename $0)" == "_every_shell_script.sh" ]; then
  log_fatal dont call this file directly
  log_fatal create your own script and source this file
  exit 255
fi

declare -F clean_up || {
  log_fatal clean_up not defined.
  log_fatal declare a function clean_up, which will be called in case of SIGINT or SIGTERM
  log_fatal declare this function before sourcing _every_shell_script.sh
  exit 254
}

mkdir -p ${TMP_DIR}
chmod 700 ${TMP_USER}

_clean_up() {
  [ -d "${TMP_DIR}" ] && rm -rf "${TMP_DIR}"
  clean_up
}

trap _clean_up SIGTERM SIGINT
