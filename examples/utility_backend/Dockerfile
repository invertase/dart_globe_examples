# Use the official Dart image as a parent image
FROM --platform=$BUILDPLATFORM dart:latest AS BUILDER

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./build .

# Since we are building for multi architecture 
ARG TARGETPLATFORM


# Resolve application dependencies
RUN dart pub get

# Build the application
RUN dart compile exe bin/server.dart -o bin/server 

RUN chmod +x bin/server

# Expose the port on which your app runs
EXPOSE 8080

# Build a minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch
COPY --from=BUILDER /runtime/ /
COPY --from=BUILDER /app/bin/server /app/bin/

# Run the compiled server
CMD ["./app/bin/server"]

