#!/bin/bash

TYPE=$1
NAME=$2
STATE=$3

case $STATE in
    "MASTER") echo "[$1 - $2] I'm the MASTER! Let's go" > /proc/1/fd/1
        exit 0
    ;;
    "BACKUP") echo "[$1 - $2] Ok, i'm just a backup, okey but not." > /proc/1/fd/1
        exit 0
    ;;
    "FAULT")  echo "[$1 - $2] Fault, whatAF ?" > /proc/1/fd/1
        exit 0
    ;;
    *)        echo "[$1 - $2] Unknown state, this is a problem" > /proc/1/fd/1
        exit 1
    ;;
esac
