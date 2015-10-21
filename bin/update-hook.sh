#!/bin/bash
BRANCH=$(hg branch)

if [[ "$BRANCH" == "default" ]]; then
    ln -f -s Vagrantfile.default Vagrantfile
    echo "Your Vagrantfile is different, you probably need to do a 'vagrant reload' and possbily a 'vagrant provision'"
elif [[ "$BRANCH" == "rhw-conversion" ]]; then
    ln -f -s Vagrantfile.rhw-conversion Vagrantfile
    echo "Your Vagrantfile is different, you probably need to do a 'vagrant reload' and possbily a 'vagrant provision'"
fi
