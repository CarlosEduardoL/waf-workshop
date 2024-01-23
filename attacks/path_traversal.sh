#!/bin/bash

# This script is used to test path traversal attacks on a WAF (Web Application Firewall)

curl -vvv "http://localhost:8081/?id=../../../../etc/passwd"

# A well-configured WAF should prevent this type of attack by blocking 
# requests that attempt to navigate up the directory tree.