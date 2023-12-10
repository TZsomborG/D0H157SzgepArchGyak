#!/bin/bash

echo "For ciklus:"
for ((i=0; i<=10; i++)); do
    echo $i
done

echo "While ciklus:"
i=0
while [ $i -le 10 ]; do
    echo $i
    ((i++))
done

echo "Until ciklus:"
i=0
until [ $i -gt 10 ]; do
    echo $i
    ((i++))
done
