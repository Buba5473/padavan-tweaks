#!/bin/sh

# https://habrahabr.ru/post/329248/

# блокировки сайтов в Украине: 
# http://4pda.ru/forum/index.php?s=&showtopic=686221&view=findpost&p=61727672

modprobe ip_set_hash_net
modprobe xt_set
ipset create tor-ua nethash
# Списки блокируемых сетей с https://zaborona.help/ips.txt
echo "87.240.128.0/18
93.186.224.0/20
95.142.192.0/20
95.213.0.0/18
185.29.130.0/24
185.32.248.0/22
5.45.192.0/18
5.255.192.0/18
37.9.64.0/18
37.140.128.0/18
77.75.152.0/22
77.75.159.0/24
77.88.0.0/18
84.201.128.0/18
87.250.224.0/19
93.158.128.0/18
95.108.128.0/17
100.43.64.0/19
109.235.160.0/21
130.193.32.0/19
141.8.128.0/18
178.154.128.0/17
185.32.185.0/24
185.32.186.0/24
185.71.76.0/22
199.21.96.0/22
199.36.240.0/22
213.180.192.0/19
5.61.16.0/21
5.61.232.0/21
79.137.157.0/24
79.137.183.0/24
94.100.176.0/20
95.163.32.0/19
95.163.248.0/21
128.140.168.0/21
178.22.88.0/21
178.237.16.0/20
185.5.136.0/22
185.16.148.0/22
185.16.244.0/22
188.93.56.0/21
194.186.63.0/24
195.211.20.0/22
195.218.168.0/24
217.20.144.0/20
217.69.128.0/20
178.22.91.0/24
178.22.92.0/23
185.16.244.0/23
195.211.128.0/22
208.87.94.0/24
77.74.176.0/22
77.74.181.0/24
93.159.228.0/22
185.54.220.0/23
185.85.12.0/24
185.85.14.0/23
77.74.176.0/21
91.103.64.0/21
93.159.224.0/21
213.180.193.105
87.250.251.105" | while read net; do ipset add tor-ua $net; done