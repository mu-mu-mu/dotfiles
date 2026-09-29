#!/usr/bin/env bash
set -euxo pipefail

all_components=(keyd)

install_keyd() {
  if ! dpkg-query -W -f='${Status}' keyd 2>/dev/null | grep -q '^install ok installed$'; then
    sudo apt-get update
    sudo apt-get install -y keyd
  fi

  if ! systemctl is-enabled --quiet keyd || ! systemctl is-active --quiet keyd; then
    sudo systemctl enable --now keyd
  fi
}

if (( $# == 0 )); then
  set -- "${all_components[@]}"
fi

for component in "$@"; do
  case "${component}" in
    keyd) ;;
    *)
      printf 'Unknown component: %s\n' "${component}" >&2
      printf 'Available components: %s\n' "${all_components[*]}" >&2
      exit 1
      ;;
  esac
done

for component in "$@"; do
  case "${component}" in
    keyd) install_keyd ;;
  esac
done
