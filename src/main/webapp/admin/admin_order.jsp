
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
﻿<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CanShop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!--Less styles -->
        <!-- Other Less css file //different less files has different color scheam
             <link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
             <link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
             <link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
        -->
        <!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
        <script src="themes/js/less.js" type="text/javascript"></script> -->

        <!-- Bootstrap style --> 
        <link id="callCss" rel="stylesheet" href="../themes/bootshop/bootstrap.min.css" media="screen"/>
        <link href="../themes/css/base.css" rel="stylesheet" media="screen"/>
        <!-- Bootstrap style responsive -->	
        <link href="../themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
        <link href="../themes/css/font-awesome.css" rel="stylesheet" type="text/css">
        <!-- Google-code-prettify -->	
        <link href="../themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="../themes/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../themes/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../themes/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../themes/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../themes/images/ico/apple-touch-icon-57-precomposed.png">
        <style type="text/css" id="enject"></style>
    </head>
    <body>
        <div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">

                </div>
                <!-- Navbar ================================================== -->
                <div id="logoArea" class="navbar">
                    <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="navbar-inner">
                        <a class="brand" href="index.jsp"><img src="../themes/images/logo.png" alt="Bootsshop"/></a>
                        <form class="form-inline navbar-search" method="post" action="products.jsp" >
                            <input id="srchFld" class="srchTxt" type="text" />
                            <select class="srchTxt">
                                <option value="all"><fmt:message key="all" /></option>
                                <option value="Phone Accessories "> <fmt:message key="mobileAccessories" /> </option>
                                <option value="Computer Accessories"><fmt:message key="computerAccessories" /> </option>
                                <option value="BeautyandPersonalCare"><fmt:message key="BeautyandPersonalCare" /> </option>
                                <option value="glasses"><fmt:message key="glasses" /> </option>
                                <option value="Campingequipment"><fmt:message key="Campingequipment" /> </option>
                                <option value="ShoesandBags"><fmt:message key="ShoesandBags" /> </option>
                                <option value="HouseUtensils"><fmt:message key="HouseUtensils" /> </option>
                                <option value="Gifts"><fmt:message key="gifts" /> </option>
                                <option value="Cups"><fmt:message key="cups" /> </option>
                                <option value="Toys"><fmt:message key="toys" /> </option>
                                <option value="Others"><fmt:message key="other" /> </option>
                            </select> 
                            <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                        </form>
                        <ul id="topMenu" class="nav pull-right">
                            <li class=""><a href="special_offer.jsp">Specials Offer</a></li>
                            <li class=""><a href="normal.jsp">Delivery</a></li>
                            <li class=""><a href="contact.jsp">Contact</a></li>
                            <li class="">
                                <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
                                <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h3>Login Block</h3>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal loginFrm">
                                            <div class="control-group">								
                                                <input type="text" id="inputEmail" placeholder="Email">
                                            </div>
                                            <div class="control-group">
                                                <input type="password" id="inputPassword" placeholder="Password">
                                            </div>
                                            <div class="control-group">
                                                <label class="checkbox">
                                                    <input type="checkbox"> Remember me
                                                </label>
                                            </div>
                                        </form>		
                                        <button type="submit" class="btn btn-success">Sign in</button>
                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End====================================================================== -->
        <div id="carouselBlk">
            <div id="myCarousel" class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="container">
                            <a href="register.jsp"><img style="width:75%" src="../themes/images/carousel/1.png" alt="special offers"/></a>
                            <div class="carousel-caption">
                                <h4>Second Thumbnail label</h4>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="container">
                            <a href="register.jsp"><img style="width:75%" src="../themes/images/carousel/logoo.png" alt=""/></a>
                            <div class="carousel-caption">
                                <h4>Second Thumbnail label</h4>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="container">
                            <a href="register.jsp"><img style="width:75%" src="../themes/images/carousel/2.png" alt=""/></a>
                            <div class="carousel-caption">
                                <h4>Second Thumbnail label</h4>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <a href="register.jsp"><img style="width:75%" src="../themes/images/carousel/3.png" alt=""/></a>
                            <div class="carousel-caption">
                                <h4>Second Thumbnail label</h4>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>

                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <a href="register.jsp"><img style="width:75%" src="../themes/images/carousel/4.png" alt=""/></a>
                            <div class="carousel-caption">
                                <h4>Second Thumbnail label</h4>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>

                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <a href="register.jsp"><img style="width:75%" src="../themes/images/carousel/5.png" alt=""/></a>
                            <div class="carousel-caption">
                                <h4>Second Thumbnail label</h4>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <a href="register.jsp"><img style="width:75%" src="../themes/images/carousel/6.png" alt=""/></a>
                            <div class="carousel-caption">
                                <h4>Second Thumbnail label</h4>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div> 
        </div>
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <!-- Sidebar ================================================== -->
                    <div id="sidebar" class="span3">
                        <div class="well well-small"><a id="myCart" href="product_summary.jsp"><img src="../themes/images/ico-cart.png" alt="cart">3 Items in your cart  <span class="badge badge-warning pull-right">$155.00</span></a></div>
                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li class="subMenu open"><a> Phone Accessories </a>
                                <ul>
                                    <li><a class="active" href="products.jsp"><i class="icon-chevron-right"></i>APPLE (100) </a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>SAMSUNG (30)</a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>SONY (80)</a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>HTC (15)</a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>HUAWEI (35)</a></li>
                                </ul>
                            </li>
                            <li class="subMenu"><a> Computer Accessories </a>
                                <ul style="display:none">
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Women's Clothing (45)</a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Women's Shoes (8)</a></li>							
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Women's Hand Bags (5)</a></li>	
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Men's Clothings  (45)</a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Men's Shoes (6)</a></li>								
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Kids Clothing (5)</a></li>												
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Kids Shoes (3)</a></li>												
                                </ul>
                            </li>
                            <li class="subMenu"><a> Gifts </a>
                                <ul style="display:none">
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Angoves  (35)</a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Bouchard Aine & Fils (8)</a></li>					
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>French Rabbit (5)</a></li>	
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Louis Bernard  (45)</a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>BIB Wine (Bag in Box) (8)</a></li>					
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Other Liquors & Wine (5)</a></li>						
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Garden (3)</a></li>								
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Khao Shong (11)</a></li>												
                                </ul>
                            </li>
                            <li class="subMenu"><a> Clothes </a>
                                <ul style="display:none">
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Women  (35)</a></li>
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Men (50)</a></li>												
                                    <li><a href="products.jsp"><i class="icon-chevron-right"></i>Kids (5)</a></li>												
                                </ul>
                            </li>
                            <li><a href="products.jsp">Toys</a></li>
                            <li><a href="products.jsp">Others</a></li>
                        </ul>
                        <br>
                        <!-- Admin Sidebar ============================================== -->
                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li class="subMenu open"><a> Admin Tap </a>
                                <ul>

                                    <li><a href="admin_userinfo.jsp"><i class="icon-chevron-right"></i>Users Info </a></li>
                                    <li><a href="admin_userdata.jsp"><i class="icon-chevron-right"></i>User Data</a></li>
                                    <li><a href="admin_proudct.jsp"><i class="icon-chevron-right"></i>Proudcts</a></li>
                                    <li><a href="admin_proudct2.jsp"><i class="icon-chevron-right"></i>Proudcts Info</a></li>
                                    <li><a href="admin_order.jsp"><i class="icon-chevron-right"></i> Order</a></li>
                                    <li><a href="add_product.jsp"><i class="icon-chevron-right"></i>New Product</a></li>
                                </ul>
                            </li>    
                        </ul>
                        <!-- Admin Sidebare End ========================================================= -->
                    </div>

                    <!-- Sidebar end=============================================== -->




                    <div class="span9">		
                        <div class="well well-small">
                            <h4>Featured Products <small class="pull-right">200+ featured products</small></h4>
                            <div class="row-fluid">
                                <div id="featured" class="carousel slide">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <ul class="thumbnails">
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <i class="tag"></i>
                                                        <a href="product_details.jsp"><img src="../themes/images/products/b1.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <i class="tag"></i>
                                                        <a href="product_details.jsp"><img src="../themes/images/products/b2.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <i class="tag"></i>
                                                        <a href="product_details.jsp"><img src="../themes/images/products/b3.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <i class="tag"></i>
                                                        <a href="product_details.jsp"><img src="../themes/images/products/b4.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item">
                                            <ul class="thumbnails">
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <i class="tag"></i>
                                                        <a href="product_details.jsp"><img src="../themes/images/products/5.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <i class="tag"></i>
                                                        <a href="product_details.jsp"><img src="../themes/images/products/6.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/7.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/8.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item">
                                            <ul class="thumbnails">
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/9.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/10.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/11.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/1.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item">
                                            <ul class="thumbnails">
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/2.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/3.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/4.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.jsp"><img src="../themes/images/products/5.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
                                    <a class="right carousel-control" href="#featured" data-slide="next">›</a>
                                </div>
                            </div>
                        </div>
                        <h4>Latest Products </h4>
                        <ul class="thumbnails">
                            <li class="span3">
                                <div class="thumbnail">
                                    <a  href="product_details.jsp"><img src="../themes/images/products/6.jpg" alt=""/></a>
                                    <div class="caption">
                                        <h5>Product name</h5>
                                        <p> 
                                            Lorem Ipsum is simply dummy text. 
                                        </p>

                                        <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
                                    </div>
                                </div>
                            </li>
                            <li class="span3">
                                <div class="thumbnail">
                                    <a  href="product_details.jsp"><img src="../themes/images/products/7.jpg" alt=""/></a>
                                    <div class="caption">
                                        <h5>Product name</h5>
                                        <p> 
                                            Lorem Ipsum is simply dummy text. 
                                        </p>
                                        <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
                                    </div>
                                </div>
                            </li>
                            <li class="span3">
                                <div class="thumbnail">
                                    <a  href="product_details.jsp"><img src="../themes/images/products/8.jpg" alt=""/></a>
                                    <div class="caption">
                                        <h5>Product name</h5>
                                        <p> 
                                            Lorem Ipsum is simply dummy text. 
                                        </p>
                                        <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
                                    </div>
                                </div>
                            </li>
                            <li class="span3">
                                <div class="thumbnail">
                                    <a  href="product_details.jsp"><img src="../themes/images/products/9.jpg" alt=""/></a>
                                    <div class="caption">
                                        <h5>Product name</h5>
                                        <p> 
                                            Lorem Ipsum is simply dummy text. 
                                        </p>
                                        <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
                                    </div>
                                </div>
                            </li>
                            <li class="span3">
                                <div class="thumbnail">
                                    <a  href="product_details.jsp"><img src="../themes/images/products/10.jpg" alt=""/></a>
                                    <div class="caption">
                                        <h5>Product name</h5>
                                        <p> 
                                            Lorem Ipsum is simply dummy text. 
                                        </p>
                                        <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
                                    </div>
                                </div>
                            </li>
                            <li class="span3">
                                <div class="thumbnail">
                                    <a  href="product_details.jsp"><img src="../themes/images/products/11.jpg" alt=""/></a>
                                    <div class="caption">
                                        <h5>Product name</h5>
                                        <p> 
                                            Lorem Ipsum is simply dummy text. 
                                        </p>
                                        <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
                                    </div>
                                </div>
                            </li>
                        </ul>	

                    </div>
                </div>
            </div>
        </div>
        <!-- Footer ================================================================== -->
        <div  id="footerSection">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <h5>ACCOUNT</h5>
                        <a href="login.jsp">YOUR ACCOUNT</a>
                        <a href="login.jsp">PERSONAL INFORMATION</a> 
                        <a href="login.jsp">ADDRESSES</a> 
                        <a href="login.jsp">DISCOUNT</a>  
                        <a href="login.jsp">ORDER HISTORY</a>
                    </div>
                    <div class="span3">
                        <h5>INFORMATION</h5>
                        <a href="contact.jsp">CONTACT</a>  
                        <a href="register.jsp">REGISTRATION</a>  
                        <a href="legal_notice.jsp">LEGAL NOTICE</a>  
                        <a href="tac.jsp">TERMS AND CONDITIONS</a> 
                        <a href="faq.jsp">FAQ</a>
                    </div>
                    <div class="span3">
                        <h5>OUR OFFERS</h5>
                        <a href="add_product.jsp">NEW PRODUCTS</a> 
                        <a href="#">TOP SELLERS</a>  
                        <a href="special_offer.jsp">SPECIAL OFFERS</a>  
                        <a href="#">MANUFACTURERS</a> 
                        <a href="#">SUPPLIERS</a> 
                    </div>
                    <div id="socialMedia" class="span3 pull-right">
                        <h5>SOCIAL MEDIA </h5>
                        <a href="#"><img width="60" height="60" src="../themes/images/facebook.png" title="facebook" alt="facebook"/></a>
                        <a href="#"><img width="60" height="60" src="../themes/images/instagram.png" title="instagram" alt="instagram"/></a>
                        <a href="#"><img width="60" height="60" src="../themes/images/snapchat.png" title="snapchat" alt="snapchat"/></a>
                    </div> 
                </div>
                <p class="pull-right">&copy; CanShop 2017</p>
            </div><!-- Container End -->
        </div>
        <!-- Placed at the end of the document so the pages load faster ============================================= -->
        <script src="../themes/js/jquery.js" type="text/javascript"></script>
        <script src="../themes/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../themes/js/google-code-prettify/prettify.js"></script>

        <script src="../themes/js/bootshop.js"></script>
        <script src="../themes/js/jquery.lightbox-0.5.js"></script>

    </body>
</html>
