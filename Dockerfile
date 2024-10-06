# Use the official Tomcat image from Docker Hub
FROM tomcat:9.0

# Remove the default ROOT webapp from Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your project files into the ROOT directory of Tomcat
COPY ./ /usr/local/tomcat/webapps/ROOT/

# Expose the port Railway will use (default: 8080)
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
