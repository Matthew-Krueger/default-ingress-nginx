# Use an official Nginx base image
FROM nginx:latest

# Copy your web application files to the Nginx document root
COPY ./html /usr/share/nginx/html

# Expose port 80 for incoming HTTP traffic
EXPOSE 80
