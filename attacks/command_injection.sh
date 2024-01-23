#!/bin/bash

# This script is used to test command injection attacks on a WAF (Web Application Firewall)

curl -vvv "http://localhost:8081/?cmd=;ls%20-la"

# This tries to execute the ls -la command, which should be blocked by the WAF.