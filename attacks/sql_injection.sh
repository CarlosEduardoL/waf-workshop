#!/bin/bash

# This script is used to test SQL injection attacks on a WAF (Web Application Firewall)

curl -vvv "http://localhost:8081/?id=1OR'1'='1'"

# In a vulnerable application, this might trick the database into returning all records. 
# The WAF should detect this as a SQL injection attempt and block it.