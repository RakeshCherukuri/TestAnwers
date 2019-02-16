#!/usr/bin/env bash

for logfile in *.log
do
        awk '{if($1=="Apr" && $2>="27," && $2<="30," && $3=="2015" && $7=="logSEVERE:") print $0}' $logfile > severe.txt
        entry="$(awk '{if(($2=="27," && $4 > "8:00:00" && $5=="PM") || ($2=="30," && !($4 > "8:00:00" && $5=="PM")) || ($2=="28,") || ($2=="29,")) print NR, $0}' severe.txt)"
        entry="$logfile $entry"
        echo "$entry" >> log.txt
done
