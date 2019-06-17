#!/usr/bin/env bash

echo "================================"
echo "I am a task that will consume the files from task 1"

sleep 5

ls important-files/file-with-contents.txt

echo "==========================="
echo "File contents:"
cat important-files/file-with-contents.txt

echo "================================"