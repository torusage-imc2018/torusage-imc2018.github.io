#!/bin/bash
for domain in `./find-top-level-domains.sh | cut -d" " -f2`; do
    grep "$domain"$ ../domain-top-1m-20171221.txt > tld-"$domain"-20171221.txt
done
