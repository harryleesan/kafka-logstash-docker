#!/bin/bash

for number in {1..100}
do
    curl -X POST -d @test.json http://localhost:10000 --header "Content-Type:application/json"
done

exit 0
