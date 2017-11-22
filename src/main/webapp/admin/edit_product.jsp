<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CanShop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen"/>
        <link href="themes/css/base.css" rel="stylesheet" media="screen"/>
        <!-- Bootstrap style responsive -->	
        <link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
        <link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
        <!-- Google-code-prettify -->	
        <link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="themes/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
        <style type="text/css" id="enject"></style>
    </head>
    <body>
        <div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">
                    <c:if test="${not empty user}">
                        <div class="span6">Welcome <strong> <c:out value="${sessionScope.user.userFname}"/></strong></div>
                    </c:if>
                    <c:if test="${empty user}">
                        <div class="span6">Welcome to <strong> CanShop</strong></div>
                    </c:if>
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
                        <a class="brand" href="IndexServlet"><img src="themes/images/logo.png" alt="Bootsshop"/></a>
                        <form class="form-inline navbar-search" method="get" action="SearchServlet" >
                            <input name="searchString" id="srchFld" class="srchTxt" type="text" />
                            <select name="category" class="srchTxt">
                                <option value="all">All</option>
                                <option value="PhoneAccessories ">Phone Accessories </option>
                                <option value="ComputerAccessories">Computer Accessories </option>
                                <option value="Clothes">Clothes </option>
                                <option value="Gifts">Gifts </option>
                                <option value="Cups">Cups </option>
                                <option value="Toys">Toys </option>
                                <option value="Others">Others </option>
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
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">ol-group">								
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

                                            <button type="submit" class="btn btn-success">Sign in</button>
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                    </div>
                                </div>

                                </div>
                                </div>
                                </div>

                                <!-- Header End====================================================================== -->
                                <div id="mainBody"  >
                                    <div class="container" style='width:800px;margin:0 auto;'>
                                        <div class="row">
                                            <div class="span9">
                                                <ul class="breadcrumb">
                                                    <li><a href="IndexServlet">Home</a> <span class="divider">/</span></li>
                                                    <li class="active">Edit Product</li>
                                                </ul>
                                                <h3> Edit Product</h3>	
                                                <hr class="soft"/>

                                                <div class="row" style='width:800px;margin:0 auto;' >
                                                    <div class="span4" style='width:800px;margin:0 auto;'>
                                                        <div class="well">
                                                            <form class="form-horizontal" action="AddProductServelt" method="post" >
                                                                <div class="control-group">
                                                                    <label class="control-label" for="inputFname1">Product Name <sup>*</sup></label>
                                                                    <div class="controls">
                                                                        <input type="text" name="ProductName" id="inputFname1" placeholder="Product Name" value="${requestScope.product.productName}">
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="Product_Category">Category <sup>*</sup></label>
                                                                    <div class="controls">
                                                                        <select class="srchTxt" name="ProductCategory">
                                                                            <option>Phone Accessories </option>
                                                                            <option>Computer Accessories </option>
                                                                            <option>Gifts </option>
                                                                            <option>Cups </option>
                                                                            <option>Toys </option>
                                                                            <option>Others </option>
                                                                        </select> 
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="Price">Product Price <sup>*</sup></label>
                                                                    <div class="controls">
                                                                        <input type="number"  name="ProductPrice" id="price" placeholder="Product Price"/> 
                                                                        Featured? <input type="checkbox" name="Hotprice" id="HotOffer"/>
                                                                        <br>
                                                                        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                                                                        <script type="text/javascript">
                                                                            $(function () {
                                                                                $("input[name='chkPrice']").click(function () {
                                                                                    if ($("#chkYes").is(":checked")) {
                                                                                        $("#dvPrice").show();
                                                                                    } else {
                                                                                        $("#dvPrice").hide();
                                                                                    }
                                                                                });
                                                                            });
                                                                        </script>
                                                                        <span>Hot Offer ?</span>
                                                                        <label for="chkYes">
                                                                            <input type="radio" id="chkYes" name="chkPrice" />
                                                                            Yes
                                                                        </label>
                                                                        <label for="chkNo">
                                                                            <input type="radio" id="chkNo" name="chkPrice" />
                                                                            No
                                                                        </label>
                                                                        <hr />


                                                                    </div>

                                                                    <div class="control-group" id="dvPrice" style="display: none">
                                                                        <label class="control-label" for="Price">New Price </label>
                                                                        <div class="controls">
                                                                            <input type="number"  name="NEWprice" id="NEWprice" placeholder="Product New Price"/> 
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="input_Quantity">Product Quantity <sup>*</sup></label>
                                                                    <div class="controls">
                                                                        <input type="number" id="input_Quantity" placeholder="Quantity" name="ProductQuantity">
                                                                    </div>
                                                                </div>	  

                                                                <div class="control-group">
                                                                    <label class="control-label" for="Product_Serial">Product Serial</label>
                                                                    <div class="controls">
                                                                        <input type="text" id="ProductSerial" placeholder="Product Serial" name="ProductSerial">
                                                                    </div>
                                                                </div> 

                                                                <div class="control-group">
                                                                    <label class="control-label" for="Product_Dimentions">Product Dimentions</label>
                                                                    <div class="controls">
                                                                        <input type="text" id="ProductDimentions" placeholder="Product Dimentions" name="ProductDimentions">
                                                                    </div>
                                                                </div>  

                                                                <div class="control-group">
                                                                    <label class="control-label" for="ProductDate">Product Date </label>
                                                                    <div class="controls">
                                                                        <input type="date" id="date" name="ProductDate">
                                                                    </div>
                                                                </div>   

                                                                <div class="control-group">
                                                                    <label class="control-label" for="Product_Viewers">Product Viewers <sup>*</sup></label>
                                                                    <div class="controls">
                                                                        <input type="number" id="ProductViewers" placeholder="Product Viewers" name="ProductViewers">
                                                                    </div>
                                                                </div>   

                                                                <div class="control-group">
                                                                    <label class="control-label" for="Product_Orders">Product Orders <sup>*</sup></label>
                                                                    <div class="controls">
                                                                        <input type="number" id="ProductOrders" placeholder="Product Orders" name="ProductOrders">
                                                                    </div>
                                                                </div>  

                                                                <div class="control-group">
                                                                    <label class="control-label" for="inputLnam">Product Description <sup>*</sup></label>
                                                                    <div class="controls">
                                                                        <textarea name="ProductDes" data-mintext="10" data-maxtext="500" id="add-description" style="height: 140px; width: 400px; resize: none; overflow-y: hidden; z-index: auto; position: relative; line-height: normal; font-size: 14px; transition: none; background-color: white !important;" cols="80" rows="1" data-gramm="true"  spellcheck="false" ></textarea>
                                                                    </div>
                                                                </div>



                                                                <p><sup>*</sup>Required field	</p>

                                                                <div class="control-group">
                                                                    <div class="controls">
                                                                        <input class="btn btn-large btn-success" type="submit" value="Edit Product" />
                                                                    </div>
                                                                </div>	

                                                            </form>
                                                        </div>
                                                    </div>

                                                </div>	

                                            </div>
                                        </div></div>
                                </div>
                                <!-- MainBody End ============================= -->
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

                                <!-- Themes switcher section ============================================================================================= -->
                                <div id="secectionBox">
                                    <link rel="stylesheet" href="themes/switch/themeswitch.css" type="text/css" media="screen" />
                                    <script src="themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
                                    <div id="themeContainer">
                                        <div id="hideme" class="themeTitle">Style Selector</div>
                                        <div class="themeName">Oregional Skin</div>
                                        <div class="images style">
                                            <a href="themes/css/#" name="bootshop"><img src="themes/switch/images/clr/bootshop.png" alt="bootstrap business templates" class="active"></a>
                                            <a href="themes/css/#" name="businessltd"><img src="themes/switch/images/clr/businessltd.png" alt="bootstrap business templates" class="active"></a>
                                        </div>

                                    </div>

                                </div>
                                </body>
                                </html>