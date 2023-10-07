# Use Debian Buster as the base image
FROM debian:buster

# Update the package list and install Nginx and OpenSSL
RUN apt-get update && \
    apt-get install -y nginx vim

# Copy your custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the self-signed certificate and key from host to container
COPY certificate.pem /etc/ssl/certs/certificate.pem
COPY private_key.pem /etc/ssl/private/private_key.pem

# Expose ports
EXPOSE 80 443

# Start Nginx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["nginx", "-g", "daemon off;"]
