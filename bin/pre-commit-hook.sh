#!/bin/bash
CSID=$(hg log -r 0 --template "{node}")
if [ "$CSID" == "78720776df5bbed260b4f43ef58a5dfccd932854" ]; then 
	echo "yes"
fi
