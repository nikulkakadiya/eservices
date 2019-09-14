<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
   String userId=(String)session.getAttribute("mobile");   
   ps = con.prepareStatement("select line_1,line_2,pincode,city_id,a.name,c.name from address a inner join city c on a.city_id=c.id where a.user_id=?");
   ps.setString(1,userId);
   rs=ps.executeQuery();

try{
      String edit=request.getParameter("edit"); 
      if (edit!=null) {      
      String line1=request.getParameter("line_1");
      String line2=request.getParameter("line_2");
      String cityId=request.getParameter("city_id");
      String pincode=request.getParameter("pincode");
      String name=request.getParameter("address_name");

      ps =con.prepareStatement("update address set line_1=?,line_2=?,city_id=?,pincode=?,name=? where user_id=?");

         ps.setString(1,line1);
         ps.setString(2,line2);
         ps.setString(3,cityId);
         ps.setString(4,pincode);
         ps.setString(5,name);
         ps.setString(6,userId);
         int i=ps.executeUpdate();
         
         if(i==1)
         {
            response.sendRedirect("profile.jsp");
         }
         else
         {
            out.println("<script>alert('Record Not Update')</script>");
         }
      }
   }
   catch(Exception ex){}
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
   .toppadding{
      padding-top: 80px;
      position:fixed; left:80px; top:20px;
   }
   .topaddress{
      padding-top: 50px;      
      position:absolute; right:100px; top:20px;
      width: 500px;
      
   }
</style>
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
   </div>

   <!--Login-->
   <div class="toppadding">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3" id="exampleModal">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">My Profile :<%=session.getAttribute("userType")
                  %></h5>
              <!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button> -->
            </div>
            <div class="modal-body">
               <div class="register-form">
                  <form action="#" method="post">
                     <div class="fields-grid">
                        <div class="styled-input">                           
                           <input type="text" readonly="readonly" placeholder="Your  Name" name="username" value="<%=session.getAttribute("name")%>">
                        </div>                        
                        <div class="styled-input">
                           <input type="text" readonly="readonly" placeholder="Your Mobile Number" name="mobileno" value="<%=session.getAttribute("mobile")%>" required="">
                        </div>                        
                        <div class="styled-input">
                           <input type="email" readonly="readonly" placeholder="password" name="password" value="<%=session.getAttribute("email")%>" required="">
                        </div>                      
                        
                     </div>
                  </form>
               </div>
            </div>           
         </div>
      </div>
   </div>
</div>

<!----top Address-------------->


<div class="topaddress">
 <div class="container py-lg-5 py-md-4 py-sm-4 py-3" id="exampleModal">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">My Address :<%=session.getAttribute("userType")
            %></h5>
              <!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button> -->
            </div>
            <div class="modal-body">
               <div class="register-form">
                  <form action="adit_address.jsp" method="post">
                     <div class="fields-grid">  
                        <%
                        
                        if(rs.next())
                           {
                              %>      

                              <div class="form-group">
                                 <label for="inputAddress">Address 1</label>
                                 <input type="text" name="line_1" value="<%=rs.getString(1)%>" class="form-control" id="inputAddress">
                              </div>
                              <div class="form-group">
                                 <label for="inputAddress2">Address 2</label>
                                 <input type="text" name="line_2" value="<%=rs.getString(2)%>" class="form-control" id="inputAddress2">
                              </div>
                              <div class="form-group col-md-6">
                                 <label for="inputState">City</label>
                                 <select name="city_id" id="inputState" class="form-control">
                                    <option value="1">surat</option>
                                    <option value="2">Rajkot</option>
                                    <option value="3">Ahemdabad</option>
                                    <option value="4">Baroda</option>
                                 </select>
                              </div>
                              <div class="form-group col-md-6">
                                 <label for="inputZip">Zip</label>
                                 <input type="text" name="pincode" value="<%=rs.getString(3)%>" class="form-control" id="inputZip">
                              </div>
                              <div class="form-group">
                                 <label for="inputZip">Name</label>
                                 <input type="text" name="address_name" value="<%=rs.getString(5)%>" class="form-control" id="inputZip">
                              </div>                               
                              <%
                           }
                           %>
                           <div class="col-sm-10">
                             <button name="edit" class="btn btn-primary">Click Edit</button>               
                          </div>                                 
                       </div>
                    </form>
                 </div>
              </div>           
           </div>
        </div>
     </div>   
  </div>
</body>
</html>