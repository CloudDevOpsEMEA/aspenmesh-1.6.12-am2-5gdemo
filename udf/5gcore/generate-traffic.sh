#!/usr/bin/env bash

while true 
do 
    http http://10.1.1.4:80 Host:amf.k8s.intra.local -a basic:a ; 
    sleep 0.1 ; 
done
