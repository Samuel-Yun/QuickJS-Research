#!/usr/bin/env bash

set -euo pipefail

: "${QJS_SOURCE_DIR:?QJS_SOURCE_DIR is required}"
: "${QJS_MINGW_BIN:?QJS_MINGW_BIN is required}"
: "${QJS_JOBS:?QJS_JOBS is required}"

source_dir="$(cygpath -u "$QJS_SOURCE_DIR")"
mingw_bin="$(cygpath -u "$QJS_MINGW_BIN")"

cd "$source_dir"
export PATH="$mingw_bin:$PATH"
export MSYSTEM=MINGW64

if [[ "${QJS_CLEAN_BUILD:-1}" == "1" ]]; then
    mingw32-make.exe clean
fi

mingw32-make.exe -j"$QJS_JOBS" qjs.exe
