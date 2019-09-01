<%@page import="java.sql.*" %>
<%
session = request.getSession(true);
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root",""); 
PreparedStatement ps;
ResultSet rs;
%>
