#!/bin/bash
 diskutil erasevolume HFS+ 'RAM_Disk' `hdiutil attach -nomount ram://4194304`
 rsync -avzh --exclude='.Trashes' ~/DevOps/RAM_Disk_backup /Volumes/RAM_Disk
echo "start the server with 'pg_ctl start -D /Volumes/RAM_Disk/postgresql' - you probably need to do user rights and tablespaces inside the psql server"
