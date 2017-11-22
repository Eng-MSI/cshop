
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:if test="${not empty cookie['lang']}">
    <c:set var="language" value="${cookie['lang'].value}"></c:set>
</c:if>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="CanShop.Localization.text" />
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
                <div id="welcomeLine" class="row"><c:if test="${not empty user}">
                        <div class="span6"><fmt:message key="welcome" /> <strong> <c:out value="${sessionScope.user.userFname}"/></strong></div>
                    </c:if>
                    <c:if test="${empty user}">
                        <div class="span6"><fmt:message key="welcomeMessage" /> <strong> <fmt:message key="canshop" /></strong></div>
                    </c:if>
                    <c:url var="englishURL" value="Language">
                        <c:param name="language" value="en"></c:param>
                    </c:url>
                    <c:url var="arabicURL" value="Language">
                        <c:param name="language" value="ar"></c:param>
                    </c:url>
                    <div class="span6">
                        <div class="pull-right">
                            <c:if test="${language == 'en' }" >
                                <a href="${englishURL}" class="btn btn-mini btn-success">En</a>
                                <a href="${arabicURL}" class="btn btn-mini">ع</a>
                            </c:if>
                            <c:if test="${language == 'ar' }" >
                                <a href="${englishURL}" class="btn btn-mini ">En</a>
                                <a href="${arabicURL}" class="btn btn-mini btn-success">ع</a>
                            </c:if>
                            <c:if test="${not empty user}">
                                <span class="btn btn-mini">$<c:out value="${sessionScope.cartTotalPrice}"/></span>
                            </c:if>
                            <c:if test="${empty user}">
                                <span class="btn btn-mini">$0.00</span>
                            </c:if>
                            <a href="Checkout"><c:if test="${not empty user}">
                                    <span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ <c:out value="${sessionScope.noOfProducts}"/> ] <fmt:message key="itemsInCart" /> </span>

                                </c:if>
                                <c:if test="${empty user}">
                                    <span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ 0 ] <fmt:message key="itemsInCart" /> </span>
                                </c:if> </a> </div>
                    </div>
                </div>
                <!-- Navbar ================================================== -->
                <a class="brand" href="Home"><img src="themes/images/CanShop.png" alt="Bootsshop"/></a>
                <ul id="topMenu" class="nav pull-right">
                    <li>
                        <div id="logoArea" class="navbar">
                            <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>

                            </a>
                            <div class="navbar-inner">


                                <form class="form-inline navbar-search" method="get" action="Search" >
                                    <input name="searchString" placeholder="<fmt:message key="searchHint" />" id="srchFld" class="srchTxt" type="text" />
                                    <select name="category" class="srchTxt">
                                        <option value="all"><fmt:message key="all" /></option>
                                        <option value="PhoneAccessories "> <fmt:message key="mobileAccessories" /> </option>
                                        <option value="ComputerAccessories"><fmt:message key="computerAccessories" /> </option>
                                        <option value="Clothes"><fmt:message key="clothes" /> </option>
                                        <option value="Gifts"><fmt:message key="gifts" /> </option>
                                        <option value="Cups"><fmt:message key="cups" /> </option>
                                        <option value="Toys"><fmt:message key="toys" /> </option>
                                        <option value="Others"><fmt:message key="other" /> </option>
                                    </select> 
                                    <button type="submit" id="submitButton" class="btn btn-primary"><fmt:message key="search" /></button>
                                </form>

                                <ul id="topMenu" class="nav pull-right">
                                    <li class=""><a href="special_offer.jsp"><fmt:message key="specialOffers" /></a></li>
                                    <li class=""><a href="normal.jsp"><fmt:message key="delivery" /></a></li>
                                    <li class=""><a href="contact.jsp"><fmt:message key="contact" /></a></li>
                                        <c:if test="${not empty user}">
                                        <li class=""><a href="<c:url value='Logout'/>" role="button" ><span class="btn btn-large btn-success"><fmt:message key="logout" /></span></a></li>
                                            </c:if>
                                            <c:if test="${empty user}">
                                        <li class=""><a href="login.jsp" role="button" ><span class="btn btn-large btn-success"><fmt:message key="login" /></span></a></li>
                                            </c:if>
                                </ul>
                                </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Header End====================================================================== -->
                        <div id="mainBody">
                            <div class="container">
                                <div class="row">
                                    <!-- Sidebar ================================================== -->
                                    <div id="sidebar" class="span3">
                                        <div id="cartDiv">
                                            <c:if test="${empty user}">
                                                <div class="well well-small">
                                                    <a id="myCart" href="Checkout">
                                                        <img src="themes/images/ico-cart.png" alt="cart">0 <fmt:message key="itemsInCart" />  
                                                        <span class="badge badge-warning pull-right">$0.00</span>
                                                    </a>
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty user}">
                                                <div class="well well-small">
                                                    <a id="myCart" href="Checkout">
                                                        <img src="themes/images/ico-cart.png" alt="cart">${sessionScope.noOfProducts} <fmt:message key="itemsInCart" />  
                                                        <span class="badge badge-warning pull-right">$${sessionScope.cartTotalPrice}</span>
                                                    </a>
                                                </div>
                                            </c:if>
                                        </div>

                                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                                            <c:url value="Products" var="Apple" >
                                                <c:param name="category" value="Phone_Apple" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Samsung" >
                                                <c:param name="category" value="Phone_Samsung" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Sony" >
                                                <c:param name="category" value="Phone_Sony" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="HTC" >
                                                <c:param name="category" value="Phone_HTC" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="HUAWEI" >
                                                <c:param name="category" value="Phone_HUAWEI" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="computerAccessories" >
                                                <c:param name="category" value="computerAccessories" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Men" >
                                                <c:param name="category" value="Clothes_Men" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Women" >
                                                <c:param name="category" value="Clothes_Women" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Kids" >
                                                <c:param name="category" value="Clothes_Kids" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Gifts" >
                                                <c:param name="category" value="Gifts" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Toys" >
                                                <c:param name="category" value="Toys" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Others" >
                                                <c:param name="category" value="Others" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <li class="subMenu open"><a> <fmt:message key="mobileAccessories" /> </a>
                                                <ul>
                                                    <li><a class="active" href="${Apple}"><i class="icon-chevron-right"></i><fmt:message key="apple" /> </a></li>
                                                    <li><a href="${Samsung}"><i class="icon-chevron-right"></i><fmt:message key="samsung" /> </a></li>
                                                    <li><a href="${Sony}"><i class="icon-chevron-right"></i><fmt:message key="sony" /> </a></li>
                                                    <li><a href="${HTC}"><i class="icon-chevron-right"></i><fmt:message key="htc" /> </a></li>
                                                    <li><a href="${HUAWEI}"><i class="icon-chevron-right"></i><fmt:message key="huawei" /> </a></li>
                                                </ul>
                                            </li>

                                            <li><a href="${computerAccessories}"> <fmt:message key="computerAccessories" /> </a></li>
                                            <li class="subMenu"><a> <fmt:message key="clothes" /> </a>
                                                <ul style="display:none">
                                                    <li><a href="${Women}"><i class="icon-chevron-right"></i><fmt:message key="women" /></a></li>
                                                    <li><a href="${Men}"><i class="icon-chevron-right"></i><fmt:message key="men" /></a></li>												
                                                    <li><a href="${Kids}"><i class="icon-chevron-right"></i><fmt:message key="kids" /></a></li>												
                                                </ul>
                                            </li>
                                            <li><a href="${Gifts}"><fmt:message key="gifts" /></a></li>
                                            <li><a href="${Toys}"><fmt:message key="toys" /></a></li>
                                            <li><a href="${Others}"><fmt:message key="other" /></a></li>
                                        </ul>


                                    </div>
                                    <!-- Sidebar end=============================================== -->
                                    <div class="span9">
                                        <ul class="breadcrumb">
                                            <li><a href="<c:url value='Home'/>">Home</a> <span class="divider">/</span></li>
                                            <li class="active">Unsuccess</li>
                                        </ul>
                                     
                                        <div class="row">
                                            <div class="span9" style="min-height:500px">
                                                <div class="well">
                                                    <h5>Unsuccess Purchase</h5><br/>
                                                    Sorry you didin't buy any thing yet <br/><br/><br/>
                                                    
                                                </div>
                                            </div>
                                        </div>	

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- MainBody End ============================= -->
                        <!-- Footer ================================================================== -->
                        <div  id="footerSection">
                            <div class="container">
                                <div class="row">
                                    <div class="span3">
                                         <h5>ACCOUNT</h5>
                                        <a href="login.jsp">YOUR ACCOUNT</a>
                                        <!--<a href="login.jsp">PERSONAL INFORMATION</a>--> 
                                        <!--<a href="login.jsp">ADDRESSES</a>--> 
                                        <!--<a href="login.jsp">DISCOUNT</a>-->  
                                        <a href="login.jsp">ORDER HISTORY</a>
                                    </div>
                                    <div class="span3">
                                        <h5>INFORMATION</h5>
                                        <a href="contact.jsp">CONTACT</a>  
                                        <a href="register.jsp">REGISTRATION</a>  
                                        <!--<a href="legal_notice.jsp">LEGAL NOTICE</a>-->  
                                        <a href="tac.jsp">TERMS AND CONDITIONS</a> 
                                        <!--<a href="faq.jsp">FAQ</a>-->
                                    </div>
                                    <div class="span3">
                                        <h5>OUR OFFERS</h5>
                                        <a href="add_product.jsp">NEW PRODUCTS</a> 
                                        <a href="#">TOP SELLERS</a>  
                                        <a href="special_offer.jsp">SPECIAL OFFERS</a>  
                                        <!--<a href="#">MANUFACTURERS</a>--> 
                                        <!--<a href="#">SUPPLIERS</a>--> 
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