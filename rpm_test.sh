#!/bin/bash

if rmp -q sysstat &>/dev/null; then
     echo "sysstat is already installed."
else 
     echo "sysstat is not installed!"
fi
