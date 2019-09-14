<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
   String mobile=(String)session.getAttribute("mobile");
   ps=con.prepareStatement("select s.name,s.description from service_provider_skill spk inner join service s on spk.service_id=s.id where spk.service_provider_id=?");
      ps.setString(1,mobile);
%>
<!--A Design by W3layouts
   Author: W3layout
   Author URL: http://w3layouts.com
   License: Creative Commons Attribution 3.0 Unported
   License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">
<head>
   <title>Toys Shop an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>
   <!--meta tags -->
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="keywords" content="Toys Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
   Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
   <%@include file="js_script.jsp"%>
   <!--//meta tags ends here-->
   <%@include file="css.jsp"%>

</head>
<style type="text/css">
   .table{
      padding-top: 150px;
   }
</style>
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
      <div class="table">
      <form>
         <table align="center" border="1px">
            <tr>
               <th>Name</th>
               <th>Des</th>
               <th>Action</th>
            </tr>
            <%
               rs=ps.executeQuery();
               while(rs.next())
                  {
            %>
            <tr>
               <td><%=rs.getString(1)%></td>
               <td><%=rs.getString(2)%></td>
               <td><a href="delete_skill.jsp">Delete</a></td>
            </tr>
            <%}%>
         </table>
      </form>
      </div>
   </div>      
   </body>
   </html>