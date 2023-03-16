<%@ page import="java.io.*,java.util.*" %>
<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
   boolean isCorrectAddress=false;
try{
      String addAddress=request.getParameter("add_address");  

      String addressId = UUID.randomUUID().toString();

      String userId=(String)session.getAttribute("mobile");
      String line1=request.getParameter("line_1"); 
      String line2=request.getParameter("line_2"); 
      String pincode=request.getParameter("pincode"); 
      String cityId=request.getParameter("city_id"); 
      String name=request.getParameter("address_name"); 

      ps =con.prepareStatement("insert into address(id,user_id,line_1,line_2,pincode,city_id,name) values(?,?,?,?,?,?,?)");
      ps.setString(1,addressId);      
      ps.setString(2,userId);      
      ps.setString(3,line1);      
      ps.setString(4,line2);      
      ps.setString(5,pincode);      
      ps.setString(6,cityId);      
      ps.setString(7,name);    

      int result = ps.executeUpdate();
      
      if(result == 1)
      {
         response.sendRedirect("profile.jsp");
      }
      else
      {
         isCorrectAddress=true;
      }
   }
   catch(Exception e)
   {
      out.println(e);
   }
   

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
   <%@include file="head_tag.jsp"%>
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
            <!-- <%
               if (!isCorrectAddress) {                  
            %>
               <div class="alert alert-info alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info"></i> Alert!</h4>
                Username or password are invalid.
              </div>
            <% 
               }
            %> -->
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
                  <form action="add_address.jsp" method="post">
                     <div class="fields-grid">  
                        
                              <div class="form-group">
                                 <label for="inputAddress">Address 1</label>
                                 <input type="text" name="line_1" class="form-control" id="inputAddress">
                              </div>
                              <div class="form-group">
                                 <label for="inputAddress2">Address 2</label>
                                 <input type="text" name="line_2" class="form-control" id="inputAddress2">
                              </div>
                              <div class="form-group col-md-6">
                                 <label for="inputState">City</label>
                                 <select id="inputState" name="city_id" class="form-control">
                                    <option value="1">surat</option>
                                    <option value="2">Rajkot</option>
                                    <option value="3">Ahemdabad</option>
                                    <option value="4">Baroda</option>
                                 </select>                 
                                 </div>   
                                 <div class="form-group col-md-6">
                                    <label for="inputZip">Zip</label>
                                    <input type="text" name="pincode" class="form-control" id="inputZip">
                                 </div>
                                 <div class="form-group">
                                    <label for="inputZip">Name</label>
                                    <input type="text" name="address_name" class="form-control" id="inputZip">
                                 </div>       
                        
                                 <button name="add_address" type="submit" class="btn subscrib-btnn">add</button>

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