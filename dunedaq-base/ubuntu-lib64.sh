#!/bin/bash

cd /usr/lib64
for i in $(ls /usr/lib/x86_64-linux-gnu/)
do 
	if [[ "$i" != "ld-linux"* ]]; then 
		ln -s /usr/lib/x86_64-linux-gnu/$i .
	fi
done

