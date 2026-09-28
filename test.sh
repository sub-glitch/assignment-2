#!/bin/bash

IMAGE="diagnostic-tool"

echo "Running diagnostic-tool tests..."
echo

echo "Test 1: help"
docker run --rm "$IMAGE" help
if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

echo
echo "Test 2: system"
docker run --rm "$IMAGE" system
if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

echo
echo "Test 3: disk"
docker run --rm "$IMAGE" disk
if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL"
    exit 1
fi

echo
echo "Test 4: invalid command"
docker run --rm "$IMAGE" nonsense
EXIT_CODE=$?

if [ "$EXIT_CODE" -eq 2 ]; then
    echo "PASS"
else
    echo "FAIL (expected exit code 2, got $EXIT_CODE)"
    exit 1
fi

echo
echo "All tests passed!"