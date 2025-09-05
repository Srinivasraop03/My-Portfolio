# Use a lightweight web server image
FROM nginx:alpine

# Copy all HTML/CSS files to Nginx default folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
