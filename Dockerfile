# Use Nginx official image
FROM nginx:alpine

# Copy website files
COPY html/ /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY logo.png /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
