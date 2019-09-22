<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<!-- <%
ps = con.prepareStatement("SELECT name,description,path,s.id FROM service s inner join image i on s.image_id=i.id");
%> -->
<!--A Design by W3layouts
   Author: W3layout
   Author URL: http://w3layouts.com
   License: Creative Commons Attribution 3.0 Unported
   License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">
<head>
  <%@include file="head_tag.jsp"%>
</head>
<style type="text/css">
  .table
  {
    padding-top: 100px;
    padding-left: 200px; 
  }
</style>
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
      <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">            
            <div class="row">               
               <div class="left-ads-display col-lg-9">
                  <div class="table">
                    <h1 align="center">Booking</h1>                  
                    <table>
                      <tr>
                        <th>Id</th>
                        <th>Service Id</th>
                        <th>Service Provider Id</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                      </tr>
                        <%
                            String id=(String)session.getAttribute("mobile");
                            ps=con.prepareStatement("select b.id,b.service_id,b.service_provider_id,b.customer_id,b.date,bs.name from booking b inner join booking_status bs on b.booking_status_id=bs.id where b.service_provider_id=? || b.customer_id=?");
                            ps.setString(1,id);
                            ps.setString(2,id);

                            rs=ps.executeQuery();
                            while(rs.next())
                            {
                        %>
                              <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                                <td><a href="edit_booking.jsp?booking_id=<%=rs.getString(1)%>"><button class="btn btn-primary">Edit</button></a></td>
                              </tr>
                        <% 
                            }
                        %>
                    </table>
                  </div>
                </div>
             </div>
          </div>
       </div>
    </section>    
 </div>      
</body>
</html>