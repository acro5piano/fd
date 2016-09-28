#!/bin/bash

FD_DIR="${${(%):-%x}:A:h}"
alias fd="source $FD_DIR/fd.sh"

