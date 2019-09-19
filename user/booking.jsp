<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
  String bookCityId=request.getParameter("b_city_id");
  ps=con.prepareStatement("SELECT u.name FROM address a INNER JOIN service_provider_skill spk ON a.user_id=spk.service_provider_id INNER JOIN user u ON a.user_id=u.mobile_no WHERE a.city_id=?");
    ps.setString(1,bookCityId);
%>
<!--A Design by W3layouts
   Author: W3layout
   Author URL: http://w3layouts.com
   License: Creative Commons Attribution 3.0 Unported
   License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%
  String s=request.getParameter("service_id");
  out.println(s);
%>