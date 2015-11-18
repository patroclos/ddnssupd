# ddnssupd is an IP-Updater for the Dynamic DNS Service DDNSS.DE based on python

This daemon regularly checks if your IP-Address differs from the IP-Addresses of the specified Hosts.
If the Hosts Value is set to "all", all hosts associated with the specified key will be updated, when the daemon starts and when your IP changes.

#In order to use this daemon you need a config file at /etc/ddnssupd.

#Config Values:
Interval : Integer -> Time (in secs) between updates

Key : String -> Key obtained from ddnss.de Dashboard

Hosts: String -> List of hosts to updated (seperated by a comma)

#Example:
Interval:30

Key:YOUR_KEY

Hosts:yoursub.ddnss.de
