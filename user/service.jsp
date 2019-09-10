<%@include file="check_login.jsp"%>
<%@include file="connection.jsp"%>
<%
ps=con.prepareStatement("SELECT path FROM image");
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
<body>
   <div class="header-outs" id="home">
      <div class="header-bar">
         <%@include file="topbar.jsp"%>
         <%@include file="menu.jsp"%>
      </div>
      <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Toys Shop</h3>
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
                                       <img src="<%=rs.getString(1)%>" height="180px" width="80px">
                                       <div class="men-cart-pro">
                                          <div class="inner-men-cart-pro">
                                             <a href="single.jsp" class="link-product-add-cart">Quick View</a>
                                          </div>
                                       </div>
                                       <span class="product-new-top">New</span>
                                    </div>
                                    <div class="item-info-product">
                                       <div class="info-product-price">
                                          <div class="grid_meta">
                                             <div class="product_price">
                                                <h4>
                                                   <a href="single.jsp">toys(barbie)</a>
                                                </h4>
                                                <div class="grid-price mt-2">
                                                   <span class="money ">$575.00</span>
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
                                             <form action="#" method="post">
                                                <input type="hidden" name="cmd" value="_cart">
                                                <input type="hidden" name="add" value="1">
                                                <input type="hidden" name="toys_item" value="toys(barbie)">
                                                <input type="hidden" name="amount" value="575.00">
                                                <button type="submit" class="toys-cart ptoys-cart">
                                                   <i class="fas fa-cart-plus"></i>
                                                </button>
                                             </form>
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








                        <div class="col-lg-4 col-md-6 col-sm-6 product-men women_two">
                           <div class="product-toys-info">
                              <div class="men-pro-item">
                                 <div class="men-thumb-item">
                                    <img src="images/a2.jpg" class="img-thumbnail" alt="">
                                    <div class="men-cart-pro">
                                       <div class="inner-men-cart-pro">
                                          <a href="single.jsp" class="link-product-add-cart">Quick View</a>
                                       </div>
                                    </div>
                                    <span class="product-new-top">New</span>
                                 </div>
                                 <div class="item-info-product">
                                    <div class="info-product-price">
                                       <div class="grid_meta">
                                          <div class="product_price">
                                             <h4>
                                                <a href="single.jsp">toy(todos)</a>
                                             </h4>
                                             <div class="grid-price mt-2">
                                                <span class="money ">$480.00</span>
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
                                                   <i class="fa fa-star" aria-hidden="true"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fa fa-star" aria-hidden="true"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fas fa-star" ></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="far fa-star-half-o" ></i>
                                                </a>
                                             </li>
                                          </ul>
                                       </div>
                                       <div class="toys single-item hvr-outline-out">
                                          <form action="#" method="post">
                                             <input type="hidden" name="cmd" value="_cart">
                                             <input type="hidden" name="add" value="1">
                                             <input type="hidden" name="toys_item" value="toy(todos)">
                                             <input type="hidden" name="amount" value="480.00">
                                             <button type="submit" class="toys-cart ptoys-cart">
                                                <i class="fas fa-cart-plus"></i>
                                             </button>
                                          </form>
                                       </div>
                                    </div>
                                    <div class="clearfix"></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 product-men women_two">
                           <div class="product-toys-info">
                              <div class="men-pro-item">
                                 <div class="men-thumb-item">
                                    <img src="images/a3.jpg" class="img-thumbnail" alt="">
                                    <div class="men-cart-pro">
                                       <div class="inner-men-cart-pro">
                                          <a href="single.jsp" class="link-product-add-cart">Quick View</a>
                                       </div>
                                    </div>
                                    <span class="product-new-top">New</span>
                                 </div>
                                 <div class="item-info-product">
                                    <div class="info-product-price">
                                       <div class="grid_meta">
                                          <div class="product_price">
                                             <h4>
                                                <a href="single.jsp">toys (Grey)</a>
                                             </h4>
                                             <div class="grid-price mt-2">
                                                <span class="money ">$265.00</span>
                                             </div>
                                          </div>
                                          <ul class="stars">
                                             <li>
                                                <a href="#">
                                                   <i class="fa fa-star" aria-hidden="true"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fa fa-star" aria-hidden="true"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fa fa-star" aria-hidden="true"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fa fa-star" aria-hidden="true"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                                </a>
                                             </li>
                                          </ul>
                                       </div>
                                       <div class="toys single-item hvr-outline-out">
                                          <form action="#" method="post">
                                             <input type="hidden" name="cmd" value="_cart">
                                             <input type="hidden" name="add" value="1">
                                             <input type="hidden" name="toys_item" value="toys (Grey)">
                                             <input type="hidden" name="amount" value="265.00">
                                             <button type="submit" class="toys-cart ptoys-cart">
                                                <i class="fas fa-cart-plus"></i>
                                             </button>
                                          </form>
                                       </div>
                                    </div>
                                    <div class="clearfix"></div>
                                 </div>
                              </div>
                           </div>
                        </div>                     
                     </div>
                  </div>
               </div>
            </div>
         </section>    
      </div>      
   </body>
   </html>