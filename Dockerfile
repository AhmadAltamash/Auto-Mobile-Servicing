# Use an official Tomcat image with Java 11
FROM tomcat:9.0-jdk11

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps/

# Copy your JSP files and the compiled Java classes to the webapps folder
COPY . .

# Expose port 8080 for accessing the web application
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
