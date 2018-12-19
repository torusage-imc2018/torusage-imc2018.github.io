#!/bin/sh
xzcat ../domain-top-1m-20171221.txt.xz | rev | cut -d. -f1 | rev | sort | uniq -c | sort -rn | grep [1-9][0-9][0-9][0-9][0-9]
