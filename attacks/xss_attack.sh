#!/bin/bash

# This script is used to test XSS attacks on a WAF (Web Application Firewall)

curl -vvv "http://localhost:8081/?id=<script>alert('XSS')</script>"

# This would normally cause a JavaScript alert to appear, but a properly configured WAF 
# should block such attempts.