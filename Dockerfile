# Use Tomcat base image
FROM tomcat:9.0-jdk11-adoptopenjdk-hotspot

# Copy your project into the webapps directory of Tomcat
COPY ./ /usr/local/tomcat/webapps/ROOT/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]

