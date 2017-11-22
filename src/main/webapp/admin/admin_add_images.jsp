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
<!DOCTYPE html>
<html>
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
                    <div class="span6"></div>
                    <div class="span6">
                        <div class="pull-right">


                            <!--                            <span class="btn btn-mini">$155.00</span>
                                                        <a href="product_summary.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ 3 ] Itemes in your cart </span> </a> -->
                        </div>
                    </div>
                </div>
                <!-- Navbar ================================================== -->
                <a class="brand" href="admin.jsp"><img src="../themes/images/CanShop.png" alt="Bootsshop"/></a>
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
                                    <input name="searchString"  placeholder="<fmt:message key="searchHint" />" id="srchFld" class="srchTxt" type="text" />
                                    <select name="category" class="srchTxt">
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


                        <!-- Sidebar end=============================================== -->
                        <div id="mainBody">
                            <div class="container" style='width:800px;margin:0 auto;'>
                                <div class="row">
                                    <div class="span9">
                                        <h3> ${requestScope.product.productName}</h3>   
                                        <hr class="soft"/>

                                        <div class="row" style='width:800px;margin:0 auto;' >
                                            <div class="span4" style='width:800px;margin:0 auto;'>
                                                <div class="well">
                                                    <c:if test="${requestScope.product.productFeatured eq true}">
                                                        <h4>Home Page image</h4>
                                                        <form action="UploadImageServlet" method="post" enctype="multipart/form-data">
                                                            <input type="hidden" name="productId" value="${requestScope.product.productId}">
                                                            <input type="hidden" name="imageNo" value="1">
                                                            Select File to Upload:     <input type="file" name="homePageImage">     <input type="submit" value="Upload"><img  src="http://localhost:8080/CanShop/images/featured_${requestScope.product.productName}_${requestScope.product.productId}.png" width="100" height="100" alt="Not Uploaded">

                                                        </form>
                                                    </c:if>
                                                    <h4>Image 1</h4>
                                                    <form action="UploadImageServlet" method="post" enctype="multipart/form-data">
                                                        <input type="hidden" name="productId" value="${requestScope.product.productId}">
                                                        <input type="hidden" name="imageNo" value="1">
                                                        Select File to Upload:     <input type="file" name="fileName">     <input type="submit" value="Upload"><img  src="http://localhost:8080/CanShop/images/${requestScope.product.productName}_${requestScope.product.productId}_1.png" width="100" height="100" alt="Not Uploaded">

                                                    </form>
                                                    <h4>Image 2 (Optional)</h4>
                                                    <form action="UploadImageServlet" method="post" enctype="multipart/form-data">
                                                        <input type="hidden" name="productId" value="${requestScope.product.productId}">
                                                        <input type="hidden" name="imageNo" value="2">
                                                        Select File to Upload:     <input type="file" name="fileName">     <input type="submit" value="Upload"><img src="http://localhost:8080/CanShop/images/${requestScope.product.productName}_${requestScope.product.productId}_2.png" width="100" height="100" alt="Not Uploaded">
                                                    </form>
                                                    <h4>Image 3 (Optional)</h4>
                                                    <form action="UploadImageServlet" method="post" enctype="multipart/form-data">
                                                        <input type="hidden" name="productId" value="${requestScope.product.productId}">
                                                        <input type="hidden" name="imageNo" value="3">
                                                        Select File to Upload:     <input type="file" name="fileName">     <input type="submit" value="Upload"><img src="http://localhost:8080/CanShop/images/${requestScope.product.productName}_${requestScope.product.productId}_3.png" width="100" height="100" alt="Not Uploaded">
                                                    </form>


                                                </div>
                                            </div>

                                        </div>>
                                    </div>

                                </div>  

                            </div>
                        </div>






                        <!-- Footer ================================================================== -->


                        </body>
                        </html>
