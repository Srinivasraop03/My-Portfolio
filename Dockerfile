# Use official Nginx image
FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy index.html from html/ folder into root
COPY html/index.html /usr/share/nginx/html/index.html

# Copy CSS folder
COPY css/style.css /usr/share/nginx/html/css/

# Copy logo image
COPY logo.png /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
