<%@page import="java.sql.*" %>
<%@page import="java.sql.Statement" %>
<%!
    Connection con;
    Statement stmt;
    ResultSet rs,rs1;
%>
<%
    Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/automobileDB","postgres","7488");
%>