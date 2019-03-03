# Create Docker image with Nginx over Alpine Linux
Nginx in docker container, with config files and content web in filesystem &amp; reverse proxy capable.
## 1. Cloning data from GitHub and modify config files
Use one alternative
```
$ git clone https://username:password@github.com/app4rpi/docker-nginx.git
$ git clone https://github.com/app4rpi/docker-nginx.git
```
## 2. Create a docker image
``` 
$ cd nginxDocker
$ docker build --rm -t nginx4docker .
```
The image nginx:latest has been created with a size of 17.8MB
## 3. Run Nginx ...
### 3a. ... with data & files in Docker area filesystem
  ```
  $ docker run -d --name nginx --net=host nginx4docker:latest
  ```
  ### 3b. ... with web data & files in server filesystem
  ```
  $  docker run -d --net=host -v /var/www/html:/usr/share/nginx/html --name nginx nginx4docker:latest
  ```
  ### 3c. ... with web data & config files in server filesystem
  ```
  $ docker run -d --net=host -v /var/www:/var/www/ -v /app/nginx:/etc/nginx/conf.d/ --name nginx nginx4docker:latest
  ```
## 4. Run Nginx with data & config files in server filesystem and start automatically
```
$  docker run -d --restart always --net=host -v /var/www:/var/www/ -v /app/nginx:/etc/nginx/conf.d/ --name nginx nginx4docker:latest
```
## Configuration of Web Directory
The configuration file of nginx is set to "/app/nginx"

The internal web data directory is set to "/var/www/html"

The port of service has been fixed at 80
