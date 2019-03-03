FROM nginx:alpine
MAINTAINER app4rpi \
      Description="Docker image with Nginx over Alpine Linux."
RUN apk --no-cache add 

RUN mkdir -p /var/cache/nginx
RUN chown nginx /var/cache/nginx
COPY drop.conf /etc/nginx/drop.conf
COPY errors.conf /etc/nginx/errors.conf
COPY nginx.conf /etc/nginx/nginx.conf


EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
