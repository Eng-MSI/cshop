<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:if test="${not empty cookie['lang']}">
    <c:set var="language" value="${cookie['lang'].value}"></c:set>
</c:if>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="CanShop.Localization.text" />
<html>
    <head>
        <meta charset="utf-8">
        <title>CanShop</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
                        <c:if test="${language == 'en' }" >
                            <div class="span6"><fmt:message key="welcome" /> <strong> <c:out value="${sessionScope.user.userFname}"/></strong></div>

                        </c:if>
                        <c:if test="${language == 'ar' }" >
                            <div class="span6"><strong> <c:out value="${sessionScope.user.userFname} "/></strong><fmt:message key="welcome" /> </div>

                        </c:if>                      

  <!--<div class="span6"><fmt:message key="welcome" /> <strong> <c:out value="${sessionScope.user.userFname}"/></strong></div>-->
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
                    <div id="cartDiv2" class="span6">
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
                                <span class="btn btn-mini"><fmt:message key="dinar" /> <c:out value="${sessionScope.cartTotalPrice}"/></span>
                            </c:if>
                            <c:if test="${empty user}">
                                <span class="btn btn-mini"><fmt:message key="dinar" /> 0.00</span>
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
                            <div class="navbar-inner" dir="auto">


                                <form class="form-inline navbar-search" method="get" action="Search" >
                                    <input name="searchString" placeholder="<fmt:message key="searchHint" />" id="srchFld" class="srchTxt" type="text" />
                                    <select name="category" class="srchTxt">
                                        <option value="all"><fmt:message key="all" /></option>
                                        <option value="mobile"> <fmt:message key="mobileAccessories" /> </option>
                                        <option value="Computer Accessories"><fmt:message key="computerAccessories" /> </option>
                                        <option value="Beauty And Personal Care"><fmt:message key="BeautyandPersonalCare" /> </option>
                                        <option value="Glasses"><fmt:message key="glasses" /> </option>
                                        <option value="Camping Equipment"><fmt:message key="Campingequipment" /> </option>
                                        <option value="Shoes And Bags"><fmt:message key="ShoesandBags" /> </option>
                                        <option value="House Utensils"><fmt:message key="HouseUtensils" /> </option>
                                        <option value="Gifts"><fmt:message key="gifts" /> </option>
                                        <option value="Cups"><fmt:message key="cups" /> </option>
                                        <option value="Toys"><fmt:message key="toys" /> </option>
                                        <option value="Others"><fmt:message key="other" /> </option>
                                    </select> 
                                    <button type="submit" id="submitButton" class="btn btn-primary"><fmt:message key="search" /></button>
                                </form>

                                <ul id="topMenu" class="nav pull-right">
                                    <li class=""><a href="<c:url value='HotOffers'/>"><fmt:message key="specialOffers" /></a></li>
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
                        <div id="carouselBlk">
                            <div id="myCarousel" class="carousel slide">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="container">
                                            <a href="register.jsp"><img style="width:75%" src="themes/images/carousel/1.png" alt="special offers"/></a>
                                            <div class="carousel-caption">
                                                <h4>Second Thumbnail label</h4>
                                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <div class="container">
                                            <a href="register.jsp"><img style="width:75%" src="themes/images/carousel/3.png" alt=""/></a>
                                            <div class="carousel-caption">
                                                <h4>Second Thumbnail label</h4>
                                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="item">
                                        <div class="container">
                                            <a href="register.jsp"><img style="width:75%" src="themes/images/carousel/6.png" alt=""/></a>
                                            <div class="carousel-caption">
                                                <h4>Second Thumbnail label</h4>
                                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach var="product" items="${featuredProducts}">
                                        <c:url value="Product" var="productDetailsURL" >
                                            <c:param name="productId" value="${product.productId}" ></c:param>
                                        </c:url>
                                        <div class="item">
                                            <div class="container">
                                                <a href="${productDetailsURL}"><img style="width:75%" src="http://localhost:8080/CanShop/images/featured_${product.productName}_${product.productId}.png" alt=""/></a>
                                                <div class="carousel-caption">
                                                    <h4>Second Thumbnail label</h4>
                                                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                            </div> 
                        </div>
                        <div id="mainBody">
                            <div class="container">
                                <div class="row">
                                    <!-- Sidebar ================================================== -->
                                    <div id="sidebar" class="span3" dir="auto">
                                        <div id="cartDiv">
                                            <c:if test="${empty user}">
                                                <div class="well well-small">
                                                    <a id="myCart" href="Checkout">
                                                        <img src="themes/images/ico-cart.png" alt="cart"> 0 <fmt:message key="itemsInCart" />  
                                                        <span class="badge badge-warning pull-right"><fmt:message key="dinar" /> 0.00</span>
                                                    </a>
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty user}">
                                                <div class="well well-small">
                                                    <a id="myCart" href="Checkout">
                                                        <img src="themes/images/ico-cart.png" alt="cart">${sessionScope.noOfProducts} <fmt:message key="itemsInCart" />  
                                                        <span class="badge badge-warning pull-right"><fmt:message key="dinar" /> ${sessionScope.cartTotalPrice}</span>
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
                                                <c:param name="category" value="Computer Accessories" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="BeautyandPersonalCare" >
                                                <c:param name="category" value="Beauty And Personal Care" ></c:param>
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

                                            <c:url value="Products" var="glasses" >
                                                <c:param name="category" value="Glasses" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="Campingequipment" >
                                                <c:param name="category" value="Camping Equipment" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="ShoesandBags" >
                                                <c:param name="category" value="Shoes And Bags" ></c:param>
                                                <c:param name="pageNo" value="1" ></c:param>
                                            </c:url>
                                            <c:url value="Products" var="HouseUtensils" >
                                                <c:param name="category" value="House Utensils" ></c:param>
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

                                            </li>
                                            <li><a href="${BeautyandPersonalCare}"><fmt:message key="BeautyandPersonalCare" /></a></li>
                                            <li><a href="${glasses}"><fmt:message key="glasses" /></a></li>
                                            <li><a href="${Campingequipment}"><fmt:message key="Campingequipment" /></a></li>
                                            <li><a href="${ShoesandBags}"><fmt:message key="ShoesandBags" /></a></li>
                                            <li><a href="${HouseUtensils}"><fmt:message key="HouseUtensils" /></a></li>
                                            <li><a href="${Gifts}"><fmt:message key="gifts" /></a></li>
                                            <li><a href="${Toys}"><fmt:message key="toys" /></a></li>
                                            <li><a href="${Others}"><fmt:message key="other" /></a></li>
                                        </ul>


                                    </div>
                                    <!-- Sidebar end=============================================== -->
                                    <div class="span9" dir="auto">		
                                        <div class="well well-small">
                                            <h4><fmt:message key="latestProducts" /> </h4>
                                            <div class="row-fluid">
                                                <div id="featured" class="carousel slide">
                                                    <div class="carousel-inner">


                                                        <c:if test="${fn:length(listByDate) gt 0}" > 
                                                            <div class="item active">
                                                                <ul class="thumbnails">

                                                                    <c:forEach items="${listByDate}" var="product" begin="0" end="3" >
                                                                        <c:url value="Product" var="productDetailsURL" >
                                                                            <c:param name="productId" value="${product.productId}" ></c:param>
                                                                        </c:url>
                                                                        <li class="span3">
                                                                            <div class="thumbnail">
                                                                                <i class="tag"></i>
                                                                                <a href="${productDetailsURL}"><img width="160" height="160" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" alt=""></a>
                                                                                <div class="caption">
                                                                                    <c:if test="${language == 'en' }" >
                                                                                        <h5>${product.productName}</h5>
                                                                                    </c:if>
                                                                                    <c:if test="${language == 'ar' }" >
                                                                                        <h5>${product.productArabicName}</h5>
                                                                                    </c:if>

                                                                                    <h4><a class="btn" href="${productDetailsURL}"><fmt:message key="view" /></a>
                                                                                        <c:if test="${product.productHotOffer eq false}">
                                                                                            <a class="btn btn-primary " style="pointer-events: none; cursor: none;" ><fmt:message key="dinar" /> ${product.productPrice}</a>
                                                                                        </c:if>
                                                                                        <c:if test="${product.productHotOffer eq true}">
                                                                                            <a class="btn btn-primary " style="pointer-events: none; cursor: none;" ><fmt:message key="dinar" /> ${product.productNprice}</a>
                                                                                        </c:if>

                                                                                    </h4>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </c:forEach>


                                                                </ul>
                                                            </div>
                                                        </c:if>





                                                        <c:if test="${fn:length(listByDate) gt 4}" >

                                                            <div class="item">
                                                                <ul class="thumbnails">

                                                                    <c:forEach items="${listByDate}" var="product" begin="4" end="7">

                                                                        <c:url value="Product" var="productDetailsURL" >
                                                                            <c:param name="productId" value="${product.productId}" ></c:param>
                                                                        </c:url>
                                                                        <li class="span3">
                                                                            <div class="thumbnail">
                                                                                <i class="tag"></i>
                                                                                <a href="${productDetailsURL}"><img width="160" height="160" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" alt=""></a>
                                                                                <div class="caption">
                                                                                    <c:if test="${language == 'en' }" >
                                                                                        <h5>${product.productName}</h5>
                                                                                    </c:if>
                                                                                    <c:if test="${language == 'ar' }" >
                                                                                        <h5>${product.productArabicName}</h5>
                                                                                    </c:if>
                                                                                    <h4>
                                                                                        <a class="btn" href="${productDetailsURL}"><fmt:message key="view" /></a> 
                                                                                        <c:if test="${product.productHotOffer eq false}">
                                                                                            <a class="btn btn-primary " style="pointer-events: none; cursor: none;" ><fmt:message key="dinar" /> ${product.productPrice}</a>
                                                                                        </c:if>
                                                                                        <c:if test="${product.productHotOffer eq true}">
                                                                                            <a class="btn btn-primary " style="pointer-events: none; cursor: none;" ><fmt:message key="dinar" /> ${product.productNprice}</a>
                                                                                        </c:if>
                                                                                    </h4>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </c:forEach>


                                                                </ul>
                                                            </div>
                                                        </c:if>






                                                        <c:if test="${fn:length(listByDate) gt 8}" >
                                                            <div class="item">
                                                                <ul class="thumbnails">

                                                                    <c:forEach items="${listByDate}" var="product" begin="8" end="11">
                                                                        <c:url value="Product" var="productDetailsURL" >
                                                                            <c:param name="productId" value="${product.productId}" ></c:param>
                                                                        </c:url>
                                                                        <li class="span3">
                                                                            <div class="thumbnail">
                                                                                <i class="tag"></i>
                                                                                <a href="${productDetailsURL}"><img width="160" height="160" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" alt=""></a>
                                                                                <div class="caption">
                                                                                    <c:if test="${language == 'en' }" >
                                                                                        <h5>${product.productName}</h5>
                                                                                    </c:if>
                                                                                    <c:if test="${language == 'ar' }" >
                                                                                        <h5>${product.productArabicName}</h5>
                                                                                    </c:if>
                                                                                    <h4><a class="btn" href="${productDetailsURL}"><fmt:message key="view" /></a> 
                                                                                        <c:if test="${product.productHotOffer eq false}">
                                                                                            <a class="btn btn-primary " style="pointer-events: none; cursor: none;" ><fmt:message key="dinar" /> ${product.productPrice}</a>
                                                                                        </c:if>
                                                                                        <c:if test="${product.productHotOffer eq true}">
                                                                                            <a class="btn btn-primary " style="pointer-events: none; cursor: none;" ><fmt:message key="dinar" /> ${product.productNprice}</a>
                                                                                        </c:if>
                                                                                    </h4>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </c:forEach>


                                                                </ul>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${fn:length(listByDate) gt 12}" >
                                                            <div class="item">
                                                                <ul class="thumbnails">

                                                                    <c:forEach items="${listByDate}" var="product" begin="12" end="15">
                                                                        <c:url value="Product" var="productDetailsURL" >
                                                                            <c:param name="productId" value="${product.productId}" ></c:param>
                                                                        </c:url>
                                                                        <li class="span3">
                                                                            <div class="thumbnail">
                                                                                <i class="tag"></i>
                                                                                <a href="${productDetailsURL}"><img width="160" height="160" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" alt=""></a>
                                                                                <div class="caption">
                                                                                    <c:if test="${language == 'en' }" >
                                                                                        <h5>${product.productName}</h5>
                                                                                    </c:if>
                                                                                    <c:if test="${language == 'ar' }" >
                                                                                        <h5>${product.productArabicName}</h5>
                                                                                    </c:if>
                                                                                    <h4><a class="btn" href="${productDetailsURL}"><fmt:message key="view" /></a> 
                                                                                        <c:if test="${product.productHotOffer eq false}">
                                                                                            <a class="btn btn-primary " style="pointer-events: none; cursor: none;" ><fmt:message key="dinar" /> ${product.productPrice}</a>
                                                                                        </c:if>
                                                                                        <c:if test="${product.productHotOffer eq true}">
                                                                                            <a class="btn btn-primary " style="pointer-events: none; cursor: none;" ><fmt:message key="dinar" /> ${product.productNprice}</a>
                                                                                        </c:if>
                                                                                    </h4>
                                                                                </div>
                                                                            </div>
                                                                        </li>

                                                                    </c:forEach>
                                                                </ul>
                                                            </div>

                                                        </c:if>






                                                    </div>
                                                    <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
                                                    <a class="right carousel-control" href="#featured" data-slide="next">›</a>
                                                </div>
                                            </div>
                                        </div>
                                        <h4><fmt:message key="topSeller" /> </h4>

                                        <ul class="thumbnails" >


                                            <c:forEach items="${listByOrdersNo}" var="product" >
                                                <c:url value="Product" var="productDetailsURL" >
                                                    <c:param name="productId" value="${product.productId}" ></c:param>
                                                </c:url>
                                                <c:url value="Cart" var="CartURL" >
                                                    <c:param name="productId" value="${product.productId}" ></c:param>
                                                    <c:param name="productQuantity" value="1" ></c:param>
                                                </c:url>
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a  href="${productDetailsURL}"><img src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" alt=""/></a>
                                                        <div class="caption">
                                                            <c:if test="${language == 'en' }" >
                                                                <h5>${product.productName}</h5>
                                                            </c:if>
                                                            <c:if test="${language == 'ar' }" >
                                                                <h5>${product.productArabicName}</h5>
                                                            </c:if>

                                                            <script>
                                                                $(document).on("click", "#somebutton${product.productId}", function () { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                                                                    $.get("${CartURL}", function (data, status, request) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                                                                        if (request.getResponseHeader('REQUIRES_AUTH') === '1') {
                                                                            window.location = 'http://localhost:8080/CanShop/login.jsp';
                                                                        } else if (request.getResponseHeader('REQUIRES_AUTH') === '2') {
                                                                            window.location = 'http://localhost:8080/CanShop/email_verfication.jsp';
                                                                        } else {
                                                                            $("#cartDiv").load(" #cartDiv");         // Locate HTML DOM element with ID "somediv" and set its text content with the response text.

                                                                        }
                                                                    });
                                                                });
                                                            </script>

                                                            <h4 style="text-align:center">
                                                                <a class="btn" href="${productDetailsURL}"> <i class="icon-zoom-in"></i></a>
                                                                <button class="btn" id="somebutton${product.productId}" ><fmt:message key="addTo" />
                                                                    <i class="icon-shopping-cart"></i>
                                                                </button>
                                                                <c:if test="${product.productHotOffer eq false}">
                                                                    <button class="btn btn-primary"  >${product.productPrice} <fmt:message key="dinar" /></button>
                                                                </c:if>
                                                                <c:if test="${product.productHotOffer eq true}">
                                                                    <button class="btn btn-primary"  >${product.productNprice} <fmt:message key="dinar" /></button>
                                                                </c:if>

                                                            </h4>
                                                        </div>
                                                    </div>
                                                </li>



                                            </c:forEach>




                                        </ul>	

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Footer ================================================================== -->
                        <div  id="footerSection" dir="auto">
                            <div class="container">
                                <div class="row">
<!--                                    <div class="span3"> <h5>    <fmt:message key="Account" /> </h5>
                                        <a href="reset_pass.jsp"><fmt:message key="YOUR ACCOUNT" /></a>
                                        <a href="login.jsp">PERSONAL INFORMATION</a> 
                                        <a href="login.jsp">ADDRESSES</a> 
                                        <a href="login.jsp">DISCOUNT</a>  
                                        <a href="login.jsp"><fmt:message key="ORDER HISTORY" /></a>
                                    </div>-->
                                    <div class="span3">
                                        <h5><fmt:message key="INFORMATION" /></h5>
                                        <a href="contact.jsp"><fmt:message key="CONTACT" /></a>  
                                        <a href="register.jsp"><fmt:message key="REGISTRATION" /></a>  
                                        <!--<a href="legal_notice.jsp">LEGAL NOTICE</a>-->  
                                        <a href="tac.jsp"><fmt:message key="Selling Policies" /></a> 
                                        <!--<a href="faq.jsp">FAQ</a>-->
                                    </div>
                                    <div class="span3">
                                        <h5><fmt:message key="OUR OFFERS" /></h5>
<!--                                        <a href="add_product.jsp"><fmt:message key="NEW PRODUCTS" /></a>  -->
                                        <a href="special_offer.jsp"><fmt:message key="SPECIAL OFFERS" /></a>  
                                        <!--<a href="#">MANUFACTURERS</a>--> 
                                        <!--<a href="#">SUPPLIERS</a>--> 
                                    </div>
                                    <div id="socialMedia" class="span3 pull-right">
                                        <h5><fmt:message key="SOCIAL MEDIA"  /></h5>
                                        <a href="#"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook"/></a>
                                        <a href="#"><img width="60" height="60" src="themes/images/instagram.png" title="instagram" alt="instagram"/></a>
                                        <a href="#"><img width="60" height="60" src="themes/images/snapchat.png" title="snapchat" alt="snapchat"/></a>
                                    </div> 

                                </div>
                                <div id="store" dir="rtl">
                                    <a href="#"><img width="140" height="90" src="themes/images/googleplay.png"/></a>
                                    <a href="#"><img width="140" height="90" src="themes/images/appstore.png"/></a>
                                </div>
                                <p class="pull-right" dir="ltr">&copy; CanShop 2017</p>
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
