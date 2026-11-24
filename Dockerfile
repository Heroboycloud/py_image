# Use Python 3 on Alpine for a small image
FROM python:3.12-alpine

# Set working directory
WORKDIR /app

# Install build deps needed to compile any C-extension packages,
# then install Bottle, then remove build deps to keep image small
RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
    && pip install --no-cache-dir bottle \
    && apk del .build-deps

# Copy app source
COPY app.py .

# Bottle binds to 0.0.0.0 so the port is reachable from outside the container
ENV BOTTLE_HOST=0.0.0.0
ENV BOTTLE_PORT=5444

# Document the exposed port
EXPOSE 5444

# Run the app
CMD ["python", "app.py"]
