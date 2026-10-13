#!/usr/bin/env sh
set -eu

GRADLE_VERSION=8.13
GRADLE_CACHE_DIR="${GRADLE_USER_HOME:-${HOME:-$PWD}/.gradle}/engwe-wrapper"
GRADLE_HOME_DIR="$GRADLE_CACHE_DIR/gradle-$GRADLE_VERSION"

if [ ! -x "$GRADLE_HOME_DIR/bin/gradle" ]; then
    mkdir -p "$GRADLE_CACHE_DIR"
    ARCHIVE="$GRADLE_CACHE_DIR/gradle-$GRADLE_VERSION-bin.zip"
    URL="https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
    if command -v curl >/dev/null 2>&1; then
        curl -fL "$URL" -o "$ARCHIVE"
    elif command -v wget >/dev/null 2>&1; then
        wget "$URL" -O "$ARCHIVE"
    else
        echo "Reikalingas curl arba wget, kad būtų atsisiųstas Gradle $GRADLE_VERSION." >&2
        exit 1
    fi
    if command -v unzip >/dev/null 2>&1; then
        unzip -q -o "$ARCHIVE" -d "$GRADLE_CACHE_DIR"
    elif command -v python3 >/dev/null 2>&1; then
        python3 -m zipfile -e "$ARCHIVE" "$GRADLE_CACHE_DIR"
    else
        echo "Reikalingas unzip arba Python 3 Gradle archyvui išskleisti." >&2
        exit 1
    fi
    rm -f "$ARCHIVE"
fi

exec "$GRADLE_HOME_DIR/bin/gradle" "$@"
