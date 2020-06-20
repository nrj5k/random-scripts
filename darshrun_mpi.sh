#! /usr/bin/env bash

DAR_SO=~/root/lib/libdarshan.so

DARSHAN_LOG_LOC=~/darshan_logs/
DXT_ENABLE_IO_TRACE=1

env LD_PRELOAD=$DAR_SO "$@"
