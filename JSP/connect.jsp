<%@page import="java.sql.*" %>
<%@page import="java.sql.Statement" %>
<%!
    Connection con;
    Statement stmt;
    ResultSet rs,rs1;
%>
<%
    Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection("jdbc:postgresql://postgresql://postgres:hBRlBwzOrzMZqsKyqizyqTbHPswXrqyO@postgres.railway.internal:5432/railway:5432/railway","postgres","hBRlBwzOrzMZqsKyqizyqTbHPswXrqyO");
%>
