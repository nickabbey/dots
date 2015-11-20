#!/bin/bash
TODAY=`date +"%Y-%m-%d"`
mkdir -p /tmp/conversion_errors
grep $TODAY /var/log/celery/celeryd-conversion.log | grep "conversion problem" > /tmp/conversion_errors/failed.$TODAY
sed -r 's/.*for//' /tmp/conversion_errors/failed.$TODAY | sed -r 's/:.*//' > /tmp/conversion_errors/all_ids.$TODAY
sort -un /tmp/conversion_errors/all_ids.$TODAY > ~/failed_resume_conversion_ids.$TODAY
echo "`wc ~/failed_resume_conversion_ids.$TODAY`"
rm -rf /tmp/conversion_errors
