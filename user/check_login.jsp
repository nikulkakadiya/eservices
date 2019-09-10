<%
String name=(String) session.getAttribute("name");

if(name==null)
   {
      response.sendRedirect("login.jsp");
   }
%>