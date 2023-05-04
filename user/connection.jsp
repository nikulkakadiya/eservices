<%@page import="java.sql.*"%>
<%
session = request.getSession(true);
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-services","root",""); 
PreparedStatement ps = null;
ResultSet rs = null;
PreparedStatement ps1 = null;
ResultSet rs1 = null;
%>
