#!/bin/bash
echo " █████  █████  █████████      █████████  ███████████   ██████████    ███████████                                   "
echo "░░███  ░░███  ███░░░░░███    ███░░░░░███░░███░░░░░███ ░░███░░░░░█   ░█░░░███░░░█                                   "
echo " ░███   ░███ ░███    ░░░    ░███    ░░░  ░███    ░███  ░███  █ ░    ░   ░███  ░   ██████   ██████   █████████████  "
echo " ░███   ░███ ░░█████████    ░░█████████  ░██████████   ░██████          ░███     ███░░███ ░░░░░███ ░░███░░███░░███ "
echo " ░███   ░███  ░░░░░░░░███    ░░░░░░░░███ ░███░░░░░███  ░███░░█          ░███    ░███████   ███████  ░███ ░███ ░███ "
echo " ░███   ░███  ███    ░███    ███    ░███ ░███    ░███  ░███ ░   █       ░███    ░███░░░   ███░░███  ░███ ░███ ░███ "
echo " ░░████████  ░░█████████    ░░█████████  █████   █████ ██████████       █████   ░░██████ ░░████████ █████░███ █████"
echo "  ░░░░░░░░    ░░░░░░░░░      ░░░░░░░░░  ░░░░░   ░░░░░ ░░░░░░░░░░       ░░░░░     ░░░░░░   ░░░░░░░░ ░░░░░ ░░░ ░░░░░ "
echo "                                "

regions=("us-east-1" "us-east-2" "us-west-1" "us-west-2" "eu-west-1" "eu-west-2") # Add more regions as needed
cat /dev/null > output.txt
for region in "${regions[@]}"
do
    echo "Checking SSM into server in $region..." | tee -a output.txt
    export AWS_DEFAULT_REGION=$region
    python3 script.py | tee -a output.txt
done
