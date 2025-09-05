# Use official Nginx image
FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy all project files (html, css, logo, etc.) into Nginx root
COPY . /usr/share/nginx/html/

# Expose port 80 for web access
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
