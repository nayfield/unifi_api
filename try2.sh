#!/bin/bash


# secrets in the file 'secrets'
. secrets2

# looks like
#export username=user
#export password=pass
#export baseurl=https://hostname:8443
#export site=default



. unifiOS_sh_api

unifi_login
echo

unifi_api /list/user > userlist2.json

echo 'try cat userlist2.json | python -m json.tool |less'

# looks like if noted is True in the json record,
# 'name' is what was in the UI
# ('hostname' is probably dhcp ask)

# So algorithm to 'move names' ends up like
# Export:
# grab json as above from 'old controller'
# Save json entries 'if noted' to punchlist
# backup copy of punchlist (totallist)
# Import: (repeatable)
# grab userlist from new controller as above
# load punchlist
# walk userlist - if mac matches (and does not have name?) 
#  .  call https://<ip address/hostname>:8443/api/s/<siteid>/upd/user/<_id>
#     payload:
#     {name: "device name", note: "device note"}
#   remove from punchlist

