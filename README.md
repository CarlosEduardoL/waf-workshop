# WAF Implementation Workshop Using Docker Compose

## Description

This workshop provides a practical introduction to setting up a Web Application Firewall (WAF) using Docker Compose, focusing on protecting a dummy web application from common web threats. The workshop utilizes ModSecurity with Nginx to create a realistic and interactive WAF learning experience.

## Prerequisites

- Docker and Docker Compose
- Basic understanding of Nginx, WAF, and command-line operations

## Setup and Installation

1. Install Docker and Docker Compose.
2. Clone the repository: `git clone https://github.com/CarlosEduardoL/waf-workshop`

## Repository Structure

- `docker-compose.yml`: Configuration for Docker Compose.
- `modsec_proxy.conf`: Nginx configuration for ModSecurity.
- `attacks/`: Scripts simulating various web attacks.
- `screenshots/`: Visual evidence of the WAF in action.
- `workshop.md`: Detailed instructions for running the workshop.

## Quick Start

Follow these simple steps to get the workshop running:

1. Start the services: `docker-compose up -d`
2. Access the dummy web application at `http://localhost`.
3. Use scripts in `attacks/` to simulate attacks and test the WAF.

For detailed instructions, refer to the [workshop.md](workshop.md) file.

## Attack Simulations

The `attacks/` directory contains `.sh` scripts for different types of attacks:

- `sql_injection.sh`: Simulates SQL Injection.
- `xss_attack.sh`: Simulates Cross-Site Scripting (XSS).
- `path_traversal.sh`: Simulates Path Traversal.
- `command_injection.sh`: Simulates Command Injection.

To run an attack, use:

```bash
bash attacks/<attack_script.sh>
```

## Monitoring and Logs

View the WAF's logs: `docker-compose logs -f nginx-modsec`