# Use an official Tomcat runtime as a parent image
FROM tomcat:9.0-jdk11

# Copy your web.xml to the appropriate location in Tomcat
COPY ./WEB-INF/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/web.xml

# Copy JSP files to the ROOT directory of Tomcat
COPY ./index.jsp /usr/local/tomcat/webapps/ROOT/

# Copy any static resources like CSS, JS, Media (if any)
COPY ./CSS /usr/local/tomcat/webapps/ROOT/CSS/
COPY ./JS /usr/local/tomcat/webapps/ROOT/JS/
COPY ./Media /usr/local/tomcat/webapps/ROOT/Media/

# Copy additional directories such as admin and JSP
COPY ./admin /usr/local/tomcat/webapps/ROOT/admin/
COPY ./JSP /usr/local/tomcat/webapps/ROOT/JSP/

# Expose the default port used by Tomcat
EXPOSE 8080

# Start Tomcat when the container is run
CMD ["catalina.sh", "run"]
