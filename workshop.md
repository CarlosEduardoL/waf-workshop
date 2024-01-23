### Workshop: Setting Up a Local WAF with Docker Compose

#### Prerequisites

- Docker and Docker Compose installed on your machine.
- Basic understanding of Docker, Docker Compose, and Nginx.

#### Steps

1. **Create a Docker Compose File**
   
   Create a file named `docker-compose.yml` in a convenient directory. This file will define the services, networks, and volumes for our dummy app and the WAF.

2. **Define the Services**
   
   Your `docker-compose.yml` file should look something like this:
   
   ```yaml
   version: '3.8'
   services:
     dummy-app:
       image: nginx
       networks:
         - waf-network
       ports:
         - "8080:80"
   
     nginx-modsec:
       image: owasp/modsecurity-crs:3.3.5-nginx-202401080101
       networks:
         - waf-network
       ports:
         - "80:80"
       depends_on:
         - dummy-app
   
   networks:
     waf-network:
   ```
   
   Here, we define two services: `dummy-app` (our basic Nginx web application) and `nginx-modsec` (the ModSecurity WAF with OWASP CRS).

3. **Run Docker Compose**
   
   In the directory where your `docker-compose.yml` file is located, run:
   
   ```bash
   docker-compose up -d
   ```
   
   This command will download the necessary images and start the containers.

4. **Configure Reverse Proxy**
   
   We need to configure the Nginx in the `nginx-modsec` container to reverse proxy requests to the `dummy-app`. This can be done by creating a custom Nginx configuration file and mounting it into the container.
   
   Create a file named `modsec_proxy.conf` with the following content:
   
   ```nginx
   server {
       listen 80;
   
       location / {
           proxy_pass http://dummy-app:80;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header X-Forwarded-Proto $scheme;
       }
   }
   ```
   
   Update the `docker-compose.yml` to mount this file into the `nginx-modsec` service:
   
   ```yaml
   services:
     nginx-modsec:
       ...
       volumes:
         - ./modsec_proxy.conf:/etc/nginx/conf.d/default.conf
   ```

5. **Restart Docker Compose**
   
   Apply the changes by running:
   
   ```bash
   docker-compose down docker-compose up -d
   ```

6. **Test Your Setup**
   
   - Your dummy web application is now accessible at `http://localhost`.
   - Try simulating attacks to see how the WAF responds.

7. **Monitor Logs**
   
   To see the logs of the ModSecurity container, use:
   
   ```bash
   docker-compose logs -f nginx-modsec
   ```
