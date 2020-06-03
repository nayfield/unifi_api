
What am I trying to do?

Pull all the aliases I've made from one unifi controller, so I can populate another.


* api is not documented except for a shell stub (unifi_sh.api included here) that the vendor publishes.
* a PHP project has found a bunch of the api endpoints via 'inspect' 
* but I'm not a PHP person

Current status/notes:

# looks like if noted is true in the json record,
# 'name' is what was in the UI
# ('hostname' is probably dhcp ask)

qq - ignore 'noted' and just look for 'name'?

# So algorithm to 'move names' ends up like
# Export:
# grab json as in try1 from 'old controller'
# Save json entries 'if noted' to punchlist
# backup copy of punchlist (totallist)

# Import: (repeatable)
# grab userlist from new controller as in try1
# load punchlist
# walk userlist - if mac matches (and does not have name?)
#  .  call https://<ip address/hostname>:8443/api/s/<siteid>/upd/user/<_id>
#     payload:
#     {name: "device name", note: "device note"}
#   remove from punchlist

