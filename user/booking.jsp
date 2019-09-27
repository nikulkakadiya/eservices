<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
	String city=null;
	String serviceId=request.getParameter("service_id");
	String book=(String)session.getAttribute("mobile");
	ps=con.prepareStatement("select city_id from address where user_id=?");	
	ps.setString(1,book);
	rs=ps.executeQuery();
	while(rs.next())
	{		
        city=rs.getString(1);
    }
            		
	
	if (rs!=null) {
		
%>

	<!DOCTYPE html>
<html lang="zxx">
<head>
  <%@include file="head_tag.jsp"%>
</head>
<style type="text/css">
   
   .topaddress{
      padding-top: 50px;      
      position:absolute; right:400px; top:50px;
      width: 500px;
      
   
</style>
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
   </div>
<!----top Address-------------->

<div class="topaddress">
 <div class="container py-lg-5 py-md-4 py-sm-4 py-3" id="exampleModal">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h3>Service Provider Name</h3>
              <!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <spasn aria-hidden="true">&times;</span>
               </button> -->
            </div>
            	<div class="modal-body">
            		<%						
						ps=con.prepareStatement("select u.name,spk.service_provider_id from address a inner join service_provider_skill spk on a.user_id=spk.service_provider_id inner join user u on spk.service_provider_id=u.mobile_no where spk.service_id=? && a.city_id=?");
						ps.setString(1,serviceId);
						ps.setString(2,city);					
                  %>
                      
                      <table>                      
                    <%
               			rs=ps.executeQuery();
               			while(rs.next())
               			{
                    %>
                        <tr>                          
               				     <td><h3><%=rs.getString(1)%><h3></td>
                           <td>
                              <div class="col-sm-10">
                              <a href="add_booking.jsp?service_provider_id=<%=rs.getString(2)%>&service_id=<%=serviceId%>"><button class="btn btn-primary">Select</button></a>       
                              </div>
                           </td>
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
  </body>
  </html>
     <%		
	}
	else{
		response.sendRedirect("profile.jsp");
	}
%>



