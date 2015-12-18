#!/bin/bash
API_KEY=`sed -n -e 's/newrelic_api_key: //p' < ~/repos/rhw-infrastructure/group_vars/all`
POLICY_ID=`sed -n -e 's/newrelic_monitoring_policy_id: //p' < ~/repos/rhw-infrastructure/group_vars/all`
CONDITION_ID=`sed -n -e 's/newrelic_downtime_policy_id: //p' < ~/repos/rhw-infrastructure/group_vars/all`

if [[ $1 == 'on' ]]; then
    curl -X PUT "https://api.newrelic.com/v2/alert_policies/$POLICY_ID.json" -H "X-Api-Key:$API_KEY" -i -H "Content-Type: application/json" -d "{"alert_policy":{"conditions": [{"id": "$CONDITION_ID","enabled": true}] }}"
elif [[ $1 == 'off' ]]; then
    curl -X PUT "https://api.newrelic.com/v2/alert_policies/$POLICY_ID.json" -H "X-Api-Key:$API_KEY" -i -H "Content-Type: application/json" -d "{"alert_policy":{"conditions": [{"id": "$CONDITION_ID","enabled": false}] }}"
else
    echo "No arguments provided - valid options are 'off' and 'on'"
fi
