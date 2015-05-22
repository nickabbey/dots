#!/bin/bash
source /usr/local/bin/virtualenvwrapper.sh
workon rhw && cd rhw && ./manage.py runserver_plus 192.168.56.101:8000
