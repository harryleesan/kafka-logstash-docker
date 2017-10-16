#!/bin/bash

for number in {1..100}
do
    echo 'Hello' | nc localhost 10000
done

exit 0
