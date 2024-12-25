#!/bin/bash
read -p "Enter command: " command

eval $command &
echo "PID $!"