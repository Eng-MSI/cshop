<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CanShop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
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
                    <div class="span6">Welcome <strong> User</strong></div>
                    <div class="span6">
                        <div class="pull-right">
                            <span class="btn btn-mini">En</span>
                            <span class="btn btn-mini">Ar</span>
                            <span class="btn btn-mini">$155.00</span>
                            <a href="product_summary.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ 3 ] Itemes in your cart </span> </a> 
                        </div>
                    </div>
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
                                <option>All</option>
                                <option>Phone Accessories </option>
                                <option>Computer Accessories </option>
                                <option>Gifts </option>
                                <option>Cups </option>
                                <option>Toys </option>
                                <option>Others </option>
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
                    <div id="mainBody">
                        <div class="span9">
                            <h3> User Info</h3>   
                            <div class="well">
                                <form class="form-horizontal" action="AddProductServelt" method="post" >
                                    <div class="control-group">
                                        <label class="control-label" for="inputFname">User (First Name)<sup>*</sup></label>
                                        <div class="controls">
                                            <input type="text" name="User (Name)" id="inputFname1" placeholder="User (First Name)">
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <div class="control-group">
                                            <label class="control-label" for="inputLname">User (Last Name)<sup>*</sup></label>
                                            <div class="controls">
                                                <input type="text" name="User (Phone)" id="inputFname1" placeholder="User (Last Name)">
                                            </div>
                                        </div>       
                                    </div>



                                    <div class="control-group">
                                        <label class="control-label" for="User Phone">User Phone <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="text" id="User Phone" placeholder="User Phone" name="User Phone">
                                        </div>
                                    </div>    

                                    <div class="control-group">
                                        <label class="control-label" for="User_Email">User Email</label>
                                        <div class="controls">
                                            <input type="text" id="User_Email" placeholder="User Email" name="User Email">
                                        </div>
                                    </div> 



                                    <div class="control-group">
                                        <label class="control-label" for="ProductDate">Join Date </label>
                                        <div class="controls">
                                            <input type="date" id="date" placeholder="ProductDate" name="ProductDate">
                                        </div>
                                    </div>   

                                    <div class="control-group">
                                        <label class="control-label" for="User_Address">User Address <sup>*</sup></label>
                                        <div class="controls">
                                            <input type="number" id="User_Address" placeholder="User Address" name="User_Address">
                                        </div>
                                    </div>   


                                    <div class="control-group">
                                        <label class="control-label" for="inputLnam">Message To User  <sup>*</sup></label>
                                        <div class="controls">
                                            <textarea name="Message_to_User" data-mintext="10" data-maxtext="500" id="add-description" style="height: 140px; width: 400px; resize: none; overflow-y: hidden; z-index: auto; position: relative; line-height: normal; font-size: 14px; transition: none; background-color: white !important;" cols="80" rows="1" data-gramm="true"  spellcheck="false" ></textarea>
                                        </div>
                                    </div>



                                    <p><sup>*</sup>Required field   </p>

                                    <div class="control-group">
                                        <div class="controls">
                                            <input class="btn btn-large btn-success" type="submit" value="Send Message" />
                                            <input class="btn btn-large btn-success" type="submit" value="Daelete User" />
                                        </div>
                                    </div>  

                                </form>
                            </div>
                        </div>

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
                        <a href="#"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook"/></a>
                        <a href="#"><img width="60" height="60" src="themes/images/instagram.png" title="instagram" alt="instagram"/></a>
                        <a href="#"><img width="60" height="60" src="themes/images/snapchat.png" title="snapchat" alt="snapchat"/></a>
                    </div> 
                </div>
                <p class="pull-right">&copy; CanShop 2017</p>
            </div><!-- Container End -->
        </div>
        <!-- Placed at the end of the document so the pages load faster ============================================= -->
        <script src="themes/js/jquery.js" type="text/javascript"></script>
        <script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="themes/js/google-code-prettify/prettify.js"></script>

        <script src="themes/js/bootshop.js"></script>
        <script src="themes/js/jquery.lightbox-0.5.js"></script>

    </body>
</html>
