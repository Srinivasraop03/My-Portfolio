# Use official Nginx image
FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy HTML folder content to Nginx root
COPY html/ /usr/share/nginx/html/

# Copy CSS folder content
COPY css/ /usr/share/nginx/html/css/

# Copy logo image (assuming it's in root)
COPY logo.png /usr/share/nginx/html/

# Expose port 80 for web access
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
