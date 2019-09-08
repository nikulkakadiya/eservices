<%@include file="connection.jsp"%>
<%

String login = request.getParameter("login");


   //int mobile_no=null;
if(login!=null)
   {
      // name=Character.parseChar(request.getParameter("name"));
      String mobileno = request.getParameter("mobileno").toString();
      
      String password = request.getParameter("password");
      String usertype = request.getParameter("usertype");

      ps = con.prepareStatement("select * from user where password = ? && mobile_no = ? && user_type_id=?");

      ps.setString(1,password);
      ps.setString(2,mobileno);
      ps.setString(3,usertype);
      
      rs = ps.executeQuery();
      if(rs.next())
      {
         
         session.setAttribute("name",rs.getString(3));
         //session.setAttribute("password",rs.getString(2));            
         response.sendRedirect("service.jsp");
      }
      else
      {
         out.println("<script>alert('Enter Correct User or Password')</script>");
      }     
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
               <h5 class="modal-title" id="exampleModalLabel">Login</h5>
              <!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button> -->
            </div>
            <div class="modal-body">
               <div class="register-form">
                  <form action="#" method="post">
                     <div class="fields-grid">
                        <div class="styled-input">
                           <input type="text" placeholder="Your Mobile Number" name="mobileno" required="">
                        </div>                        
                        <div class="styled-input">
                           <input type="password" placeholder="password" name="password" required="">
                        </div>
                        <div class="dropdown">
                            <select name = "usertype">
                              <%
                              ps = con.prepareStatement("select * from user_type where id !=1");
                              rs = ps.executeQuery();       
                              while(rs.next())
                                 {
                                    %>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                    <%
                                 }
                                 %>
                              </select>
                           </div>                        
                        <button name="login" type="submit" class="btn subscrib-btnn">Login</button>
                     </div>
                  </form>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" ata-dismiss="modal"><a href="register.jsp">Register</a></button>
            </div>
         </div>
      </div>
   </div>
   </div>
</body>
</html>