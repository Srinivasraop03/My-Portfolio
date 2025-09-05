FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY html/index.html /usr/share/nginx/html/index.html
COPY css/ /usr/share/nginx/html/css/
COPY Web_page_logo.png /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
