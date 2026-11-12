#!/usr/bin/env bash

while read -r ip names; do
    [[ -z $ip || $ip == \#* ]] && continue
    for name in ${names%%#*}; do
        if ! dig +short "$name" | grep -qxF "$ip"; then
            echo "Bogus IP for $name in /etc/hosts!"
        fi
    done
done < /etc/hosts
