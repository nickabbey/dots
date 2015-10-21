#!/bin/bash
if [ -z "$1" ]
    then
        echo "No argument supplied"
        exit 1
fi

if [ -h "$1" ] && [ -e "$1" ]
    then
        echo "The link is alive"
    else
        echo "The link is dead"
fi

