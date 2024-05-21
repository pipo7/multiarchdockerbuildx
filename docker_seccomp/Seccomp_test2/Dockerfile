FROM alpine:latest

# Add the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the custom entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
