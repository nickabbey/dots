#!/bin/bash
rm -rf ~/repos/rhw/rhw/tests_cached_http_responses/*
if [ $? -eq 0 ]
then
    echo "Degauss completed successfully"
else
    echo "Degauss FAILED!"
fi

