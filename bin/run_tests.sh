#!/bin/bash
source `which virtualenvwrapper.sh`
VENV=""
if [[ "$VIRTUAL_ENV" = "" ]]; then
    echo "no venv loaded, switching to 'rhw'" && workon rhw
elif [[ "$VIRTUAL_ENV" != "rhw" ]]; then
    echo "working on venv $VIRTUAL_ENV - switching to 'rhw'"
    VENV="$VIRTUAL_ENV"
    deactivate
    workon rhw
fi

cd $HOME/repos/rhw/rhw
exec python ./manage.py test

if [[ "$VENV" != "" ]]; then
    echo "tests completed - returning to previously loaded venv"
    deactivate
    workon $VENV
fi

