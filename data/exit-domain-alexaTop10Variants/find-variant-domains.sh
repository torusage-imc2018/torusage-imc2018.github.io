#!/usr/bin/env bash

for domain in `xzcat ../domain-top-1m-20171221.txt.xz | grep -v '^#' | \
    head -10 | cut -d. -f1 | sort -u` duckduckgo torproject ; do

    xzcat ../domain-top-1m-20171221.txt.xz | grep "^$domain\." | \
        grep -v -e "$domain\.tmall\.com" \
                -e "$domain\.github\.io" \
                -e "$domain\.tumblr\.com" \
        > "$domain".txt
done
