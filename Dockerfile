# Use an Alpine-based NGINX image as the base
FROM nginx:alpine

# Install required dependencies
RUN apk add --no-cache git

# Set a temporary directory for cloning the repo
WORKDIR /tmp

# Clone the SnowRider3D repository
RUN git clone --depth 1 https://github.com/bgulla/snowrider3D.git

# Remove the default NGINX content and move the cloned repo
RUN rm -rf /usr/share/nginx/html/* && \
    mv /tmp/snowrider3D/* /usr/share/nginx/html/ && \
    rm -rf /tmp/snowrider3D

# Expose the NGINX port
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
