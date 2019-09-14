<%
String molile=(String) session.getAttribute("mobile");

if(molile==null)
   {
      response.sendRedirect("login.jsp");
   }
%>