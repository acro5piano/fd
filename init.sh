#!/bin/bash

FD_DIR="${${(%):-%x}:A:h}"
alias fd="source $FD_DIR/src/fd.sh"

