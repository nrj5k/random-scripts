#! /usr/bin/env bash

DAR_SO=~/root/lib/libdarshan.so

DARSHAN_ENABLE_NONMPI=1
DARSHAN_LOG_LOC=~/darshan_logs/
DXT_ENABLE_IO_TRACE=1

env LD_PRELOAD=$DAR_SO "$@"
