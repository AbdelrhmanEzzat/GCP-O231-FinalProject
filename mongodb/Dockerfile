# Use the official MongoDB image as the base image
FROM mongo:5.0.15
#6.1.0
# Add any custom configurations or scripts if necessary
# For example, if you have a custom MongoDB configuration file:
# COPY mongod.conf /etc/mongod.conf

# Expose MongoDB port
EXPOSE 27017

# Run MongoDB as the default command when the container starts
CMD ["mongod", "--bind_ip_all"]
