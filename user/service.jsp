<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
ps = con.prepareStatement("SELECT name,description,path,s.id FROM service s inner join image i on s.image_id=i.id");
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
  .service
  {
    padding-top: 50px;
  }
</style>
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
      <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
        <div class="service">
        <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3"></h3>
            <div class="row">               
               <div class="left-ads-display col-lg-9">
                  <div class="row">
                     <%
                     rs = ps.executeQuery();

                     while(rs.next())
                        {
                           %>
                           <div class="col-lg-4 col-md-6 col-sm-6 product-men women_two">
                              <div class="product-toys-info">
                                 <div class="men-pro-item">
                                    <div class="men-thumb-item">
                                       <img src="<%=rs.getString(3)%>" height="180px" width="80px">
                                       <!-- <div class="men-cart-pro">
                                          <div class="inner-men-cart-pro">
                                             <a href="single.jsp" class="link-product-add-cart">Quick View</a>
                                          </div>
                                       </div>
                                       <span class="product-new-top">New</span> -->
                                    </div>
                                    <div class="item-info-product">
                                       <div class="info-product-price">
                                          <div class="grid_meta">
                                             <div class="product_price">
                                               <b>Service Name :</b>
                                               <h4>
                                                <%
                                                String name=rs.getString(1);
                                                out.println(name);
                                                %>
                                             </h4><hr>
                                             <div class="grid-price mt-2">
                                                <span class="money ">
                                                   <b>Description</b><br>
                                                   <%
                                                   String description=rs.getString(2);
                                                   out.println(description);
                                                   %>                                               
                                                </span>
                                             </div>                       
                                          </div>
                                          <ul class="stars">
                                             <li>
                                                <a href="#">
                                                   <i class="fas fa-star"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fas fa-star"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fas fa-star"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fas fa-star" ></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="far fa-star-half-o"></i>
                                                </a>
                                             </li>
                                          </ul>
                                       </div>                             
                                       <div class="toys single-item hvr-outline-out">
                                          <!-- <form action="#" method="post">
                                             <input type="hidden" name="cmd" value="_cart">
                                             <input type="hidden" name="add" value="1">
                                             <input type="hidden" name="toys_item" value="toys(barbie)">
                                             <input type="hidden" name="amount" value="575.00">
                                             <button type="submit" class="toys-cart ptoys-cart">
                                                <i class="fas fa-cart-plus"></i>
                                             </button>
                                          </form> -->
                                                                                
                                          <div class="col-sm-10">
                                             <a href="booking.jsp?service_id=<%=rs.getString(4)%>"><button class="btn btn-primary"> Book</button></a>               
                                          </div>
                                     </div>
                                  </div>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                         </div>
                      </div>
                      <%
                   }
                   %>                       
                </div>
             </div>
          </div>
        </div>
        </div>
    </section>    
 </div>      
</body>
</html>