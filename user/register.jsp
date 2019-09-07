<%@include file="connection.jsp"%>
<%


   String sub = request.getParameter("sub");
   
   if(sub!=null)
   {
      String mobileno = request.getParameter("mobileno");
      String password = request.getParameter("password");      
      String name = request.getParameter("name");
      String email = request.getParameter("email");
      //String num=request.getParameter("num"); -->
      
      
      String usertype = request.getParameter("usertype");
      ps =con.prepareStatement("insert into user(mobile_no,password,name,email_id,status_id,user_type_id)values(?,?,?,?,1,?)");
      ps.setString(1,mobileno);
      ps.setString(2,password);
      ps.setString(3,name);
      ps.setString(4,email);
      //ps.setString(5,num);
      ps.setString(5,usertype);
      int i=ps.executeUpdate();
      
      if(i==1)
      {
         response.sendRedirect("login.jsp");
      }
      else
      {
         out.println("<script>alert('Record Not Add')</script>");
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
                  <h5 class="modal-title" id="exampleModalLabel">Register</h5>                   
               </div>
               <div class="modal-body">
                  <div class="register-form">
                     <form action="#" method="post">
                        <div class="fields-grid">
                           <div class="styled-input">
                              <input type="text" placeholder="Mobile Number" name="mobileno" required="">
                           </div>
                           <div class="styled-input">
                              <input type="password" placeholder="password" name="password" required="">
                           </div>
                           <div class="styled-input">
                              <input type="text" placeholder="Your name" name="name" required="">
                           </div>
                           <div class="styled-input">
                              <input type="email" placeholder="Your Email" name="email" required="">
                           </div>  
                           <!-- <div class="styled-input">
                              <input type="number" placeholder="Your Email" name="num" required="">
                           </div>   -->
                           
                          <div class="dropdown">
                             <select name = "usertype">
                              <option value = "2">Customer</option>
                              <option value = "3">Service Provider</option>
                           </select>
                        </div>                        
                        <button type="submit" name="sub" class="btn subscrib-btnn">Register</button>
                     </div>                       
                  </form>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal"><a href="login.jsp">Log-In</a></button>
            </div>
         </div>
      </div>
   </div>
</div>
</body>
</html>