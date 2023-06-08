#!/bin/sh

if [[ -z "${DEBUG}" ]]; then
  DEBUG="false"
fi

if [[ -z "${LISTEN}" ]]; then
  LISTEN=":9002"
fi

if [[ -n "${API_PATH}" ]]; then
  API="$(cat $API_PATH)"
fi

if [[ -z "${STORAGE}" ]]; then
  STORAGE="file"
fi

if [[ -n "${ENQUEUE_KEY_PATH}" ]]; then
  ENQUEUE_KEY="$(cat $ENQUEUE_KEY_PATH)"
fi

if [[ -z "${MICROMDM}" ]]; then
  MICROMDM="false"
fi

exec /kmfddm-linux-amd64 \
    -debug="$DEBUG" \
    -listen="$LISTEN" \
    -api="$API" \
    -storage="$STORAGE" \
    -storage-dsn="$STORAGE_DSN" \
    -dump-status="$DUMP_STATUS" \
    -enqueue="$ENQUEUE" \
    -enqueue-key="$ENQUEUE_KEY" \
    -cors-origin="$CORS_ORIGIN" \
    -micromdm="$MICROMDM"
