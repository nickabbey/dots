#!/bin/bash
if [[ "$VIRTUAL_ENV" = "" ]]
then
    workon rhw
elif [[ "$VIRTUAL_ENV" != "rhw" ]]
    VENV="$VIRTUAL_ENV"
    deactivate
    workon rhw
fi

cd
cd rhw
./manage.py test
