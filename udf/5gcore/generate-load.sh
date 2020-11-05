#!/usr/bin/env bash

# siege - An HTTP/HTTPS stress tester
#
#   -d NUM, --delay=NUM : DELAY, each siege simulated users sleeps for a random interval in seconds between 0 and NUM.
#   -r NUM, --reps=NUM, --reps=once : REPS, allows you to run the siege for NUM repetitions.
#   -c NUM, --concurrent=NUM : CONCURRENT, allows you to set the concurrent number of simulated users to num. 
#   -H HEADER, --header=HEADER : HEADER, this option allows you to add additional header information.

auth=$(echo -n 'basic:a' | openssl base64)
siege http://10.1.1.4:80 -d1 -r1000 -c25 --header="Host: amf.k8s.intra.local" --header="Authorization:Basic ${auth}"
