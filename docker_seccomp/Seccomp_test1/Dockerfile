# Dockerfile
FROM alpine:latest

# Add a test script
RUN echo '#!/bin/sh' > /test.sh && echo 'echo Hello, world!' >> /test.sh && chmod +x /test.sh

CMD ["/bin/sh"]