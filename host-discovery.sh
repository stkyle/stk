

# Nmap is most often used to perform a ping sweep with its default 
# series of packets. This option was -sP and is now -sn.
#         'nmap -sn -iL targets nmap-default-ping'

# -sn (No port scan)
# -iL <inputfilename> (Input from list)
# -n (No DNS resolution)

# With root privileges this will send ICMP ech request (ping), a TCP 
# SYN packet to port 443, a TCP ACK packet to port 80, and an ICMP 
# timestamp request.
# ref: https://isc.sans.edu/forums/diary/Host+discovery+with+nmap/18519/

if [[ $EUID -ne 0 ]]; then
        echo "$0 must be run as root"
        exit 1

Now consider the following:
 'nmap -sn -PS -PA -PU -PY -PE -PP -PM -PO -n -vv --reason --packet-trace --traceroute -iL targets -oA nmap-full-sweep'
