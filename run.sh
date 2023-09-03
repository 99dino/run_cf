#!/usr/bin/bash
path=$(pwd)
contestId="${path##*/}"


g++ $1.cpp -o $1
