<%@include file="check_login.jsp"%>
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
               <h5 class="modal-title" id="exampleModalLabel">My Profile</h5>
              <!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button> -->
            </div>
            <div class="modal-body">
               <div class="register-form">
                  <form action="#" method="post">
                     <div class="fields-grid">
                        <div class="styled-input">
                           <input type="text" readonly="readonly" placeholder="Your  Name" name="username" value="<%=session.getAttribute("name")%>" required="">
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
</body>
</html>