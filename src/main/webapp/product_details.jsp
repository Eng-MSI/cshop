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
                        <div id="mainBody">
                            <div class="container">
                                <div class="row">
                                    <!-- Sidebar ================================================== -->
                                    <div id="sidebar" class="span3" dir="auto">
                                        <div id="cartDiv">
                                            <c:if test="${empty user}">
                                                <div class="well well-small">
                                                    <a id="myCart" href="Checkout">
                                                        <img src="themes/images/ico-cart.png" alt="cart">0 <fmt:message key="itemsInCart" />  
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
                                        <ul class="breadcrumb">
                                            <li><a href="<c:url value='Home'/>"><fmt:message key="home" /></a> <span class="divider">/</span></li>
                                                <c:if test="${language == 'en' }" >
                                                <li class="active">${product.productName}</li>
                                                </c:if>
                                                <c:if test="${language == 'ar' }" >
                                                <li class="active">${product.productArabicName}</li>
                                                </c:if>

                                        </ul>	
                                        <div class="row">	  
                                            <div id="gallery" class="span3">
                                                <a href="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" title="Fujifilm FinePix S2950 Digital Camera">
                                                    <img src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" style="width:100%" alt="Fujifilm FinePix S2950 Digital Camera"/>
                                                </a>
                                                <div id="differentview" class="moreOptopm carousel slide">
                                                    <div class="carousel-inner">
                                                        <div class="item active">
                                                            <a href="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png"> <img style="width:29%" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" alt=""/></a>
                                                            <a href="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_2.png"> <img style="width:29%" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_2.png" alt=""/></a>
                                                            <a href="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_3.png" > <img style="width:29%" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_3.png" alt=""/></a>
                                                        </div>
                                                        <div class="item">
                                                            <a href="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" > <img style="width:29%" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_1.png" alt=""/></a>
                                                            <a href="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_2.png"> <img style="width:29%" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_2.png" alt=""/></a>
                                                            <a href="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_2.png"> <img style="width:29%" src="<%=request.getContextPath()%>/images/${product.productName}_${product.productId}_3.png" alt=""/></a>
                                                        </div>
                                                    </div>
                                                    <!--  
                                                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                                                    <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
                                                    -->
                                                </div>


                                            </div>
                                            <div class="span6">
                                                <c:if test="${language == 'en' }" >
                                                    <h3>${product.productName}  </h3>
                                                </c:if>
                                                <c:if test="${language == 'ar' }" >
                                                    <h3>${product.productArabicName}  </h3>
                                                </c:if>


                                                <hr class="soft"/>

                                                <script src="http://code.jquery.com/jquery-latest.min.js"></script>
                                                <script>
                                                    $(document).on("click", "#somebutton", function () { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                                                        $.get("Cart", {productId: "${product.productId}", productQuantity: $('input[name=productQuantity]').val()}, function (data, status, request) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                                                            if (request.getResponseHeader('REQUIRES_AUTH') === '1') {
                                                                window.location = 'http://localhost:8080/CanShop/login.jsp';
                                                            } else if (request.getResponseHeader('REQUIRES_AUTH') === '2') {
                                                                window.location = 'http://localhost:8080/CanShop/email_verfication.jsp';
                                                            } else {
                                                                $("#cartDiv").load(" #cartDiv");         // Locate HTML DOM element with ID "somediv" and set its text content with the response text.

                                                            }         // Locate HTML DOM element with ID "somediv" and set its text content with the response text.

                                                        });
                                                    });
                                                </script>
                                                <div class="control-group">
                                                    <c:if test="${product.productHotOffer eq false}">
                                                        <h4><label class="control-label"><span>${product.productPrice} <fmt:message key="dinar" /></span></label></h4>
                                                    </c:if>
                                                    <c:if test="${product.productHotOffer eq true}">
                                                        <h4><label class="control-label"><span><del>${product.productPrice}</del>  ${product.productNprice} <fmt:message key="dinar" /></span></label> <fmt:message key="orders" /></h4>
                                                    </c:if>

                                                    <div class="controls" dir="ltr">
                                                        <input type="number" class="span1" value="1" name="productQuantity" placeholder="Qty." min="1" max="${product.productAmount}"/>
                                                        <input type="hidden" name="productId" value="${product.productId}" />
                                                        <button id="somebutton" type="submit" class="btn btn-large btn-primary pull-right"> <fmt:message key="addToCart" /> <i class=" icon-shopping-cart"></i></button>
                                                    </div>
                                                </div>


                                                <hr class="soft"/>

                                                <h4>${product.productAmount} <fmt:message key="itemsInStock" /></h4>
                                                <h4>${product.productViewer} <fmt:message key="views" /></h4>
                                                <h4>${product.productOrdersNo} <fmt:message key="orders" /></h4>






                                                <hr class="soft clr"/>
                                                <c:if test="${language == 'en' }" >
                                                    <p>
                                                        ${product.productDescription}

                                                    </p>
                                                </c:if>
                                                <c:if test="${language == 'ar' }" >
                                                    <p>
                                                        ${product.productArabicDescription}

                                                    </p>
                                                </c:if>

                                                <a class="btn btn-small pull-right" href="#detail"><fmt:message key="moreDetails" /></a>
                                                <br class="clr"/>
                                                <a href="#" name="detail"></a>
                                                <hr class="soft"/>
                                            </div>

                                            <div class="span9">
                                                <ul id="productDetail" class="nav nav-tabs">
                                                    <li class="active"><a href="#home" data-toggle="tab"><fmt:message key="productDetails" /></a></li>
                                                    <li><a href="#profile" data-toggle="tab"><fmt:message key="relatedProducts" /></a></li>
                                                </ul>
                                                <div id="myTabContent" class="tab-content">
                                                    <div class="tab-pane fade active in" id="home">
                                                        <h4><fmt:message key="productInformation" /></h4>
                                                        <table class="table table-bordered">
                                                            <c:if test="${language == 'en' }" >
                                                                <tbody>
                                                                    <tr class="techSpecRow"><td class="techSpecTD1"><fmt:message key="brand" />: </td><td class="techSpecTD2">${product.productBrand}</td></tr>

                                                                    <tr class="techSpecRow"><td class="techSpecTD1"><fmt:message key="releasedOn" />:</td><td class="techSpecTD2"> ${product.productDate}</td></tr>
                                                                    <tr class="techSpecRow"><td class="techSpecTD1"><fmt:message key="dimensions" />:</td><td class="techSpecTD2"> ${product.productDimentions}</td></tr>

                                                                </tbody>
                                                            </c:if>
                                                            <c:if test="${language == 'ar' }" >
                                                                <tbody>
                                                                    <tr class="techSpecRow"><td class="techSpecTD1"><fmt:message key="brand" />: </td><td class="techSpecTD2">${product.productArabicBrand}</td></tr>

                                                                    <tr class="techSpecRow"><td class="techSpecTD1"><fmt:message key="releasedOn" />:</td><td class="techSpecTD2"> ${product.productDate}</td></tr>
                                                                    <tr class="techSpecRow"><td class="techSpecTD1"><fmt:message key="dimensions" />:</td><td class="techSpecTD2"> ${product.productDimentions}</td></tr>

                                                                </tbody>
                                                            </c:if>


                                                        </table>


                                                    </div>
                                                    <div class="tab-pane fade" id="profile">
                                                        <div id="myTab" class="pull-right">
                                                            <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
                                                            <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
                                                        </div>
                                                        <br class="clr"/>
                                                        <hr class="soft"/>
                                                        <div class="tab-content">
                                                            <div class="tab-pane" id="listView">
                                                                <div class="row">	  
                                                                    <div class="span2">
                                                                        <img src="themes/images/products/4.jpg" alt=""/>
                                                                    </div>
                                                                    <div class="span4">
                                                                        <h3>New | Available</h3>				
                                                                        <hr class="soft"/>
                                                                        <h5>Product Name </h5>
                                                                        <p>
                                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                                            that is why our goods are so popular..
                                                                        </p>
                                                                        <a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
                                                                        <br class="clr"/>
                                                                    </div>
                                                                    <div class="span3 alignR">
                                                                        <form class="form-horizontal qtyFrm">
                                                                            <h3> $222.00</h3>
                                                                            <label class="checkbox">
                                                                                <input type="checkbox">  Adds product to compair
                                                                            </label><br/>
                                                                            <div class="btn-group">
                                                                                <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                                                                                <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <hr class="soft"/>
                                                                <div class="row">	  
                                                                    <div class="span2">
                                                                        <img src="themes/images/products/5.jpg" alt=""/>
                                                                    </div>
                                                                    <div class="span4">
                                                                        <h3>New | Available</h3>				
                                                                        <hr class="soft"/>
                                                                        <h5>Product Name </h5>
                                                                        <p>
                                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                                            that is why our goods are so popular..
                                                                        </p>
                                                                        <a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
                                                                        <br class="clr"/>
                                                                    </div>
                                                                    <div class="span3 alignR">
                                                                        <form class="form-horizontal qtyFrm">
                                                                            <h3> $222.00</h3>
                                                                            <label class="checkbox">
                                                                                <input type="checkbox">  Adds product to compair
                                                                            </label><br/>
                                                                            <div class="btn-group">
                                                                                <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                                                                                <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <hr class="soft"/>
                                                                <div class="row">	  
                                                                    <div class="span2">
                                                                        <img src="themes/images/products/6.jpg" alt=""/>
                                                                    </div>
                                                                    <div class="span4">
                                                                        <h3>New | Available</h3>				
                                                                        <hr class="soft"/>
                                                                        <h5>Product Name </h5>
                                                                        <p>
                                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                                            that is why our goods are so popular..
                                                                        </p>
                                                                        <a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
                                                                        <br class="clr"/>
                                                                    </div>
                                                                    <div class="span3 alignR">
                                                                        <form class="form-horizontal qtyFrm">
                                                                            <h3> $222.00</h3>
                                                                            <label class="checkbox">
                                                                                <input type="checkbox">  Adds product to compair
                                                                            </label><br/>
                                                                            <div class="btn-group">
                                                                                <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                                                                                <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <hr class="soft"/>
                                                                <div class="row">	  
                                                                    <div class="span2">
                                                                        <img src="themes/images/products/7.jpg" alt=""/>
                                                                    </div>
                                                                    <div class="span4">
                                                                        <h3>New | Available</h3>				
                                                                        <hr class="soft"/>
                                                                        <h5>Product Name </h5>
                                                                        <p>
                                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                                            that is why our goods are so popular..
                                                                        </p>
                                                                        <a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
                                                                        <br class="clr"/>
                                                                    </div>
                                                                    <div class="span3 alignR">
                                                                        <form class="form-horizontal qtyFrm">
                                                                            <h3> $222.00</h3>
                                                                            <label class="checkbox">
                                                                                <input type="checkbox">  Adds product to compair
                                                                            </label><br/>
                                                                            <div class="btn-group">
                                                                                <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                                                                                <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>

                                                                <hr class="soft"/>
                                                                <div class="row">	  
                                                                    <div class="span2">
                                                                        <img src="themes/images/products/8.jpg" alt=""/>
                                                                    </div>
                                                                    <div class="span4">
                                                                        <h3>New | Available</h3>				
                                                                        <hr class="soft"/>
                                                                        <h5>Product Name </h5>
                                                                        <p>
                                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                                            that is why our goods are so popular..
                                                                        </p>
                                                                        <a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
                                                                        <br class="clr"/>
                                                                    </div>
                                                                    <div class="span3 alignR">
                                                                        <form class="form-horizontal qtyFrm">
                                                                            <h3> $222.00</h3>
                                                                            <label class="checkbox">
                                                                                <input type="checkbox">  Adds product to compair
                                                                            </label><br/>
                                                                            <div class="btn-group">
                                                                                <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                                                                                <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <hr class="soft"/>
                                                                <div class="row">	  
                                                                    <div class="span2">
                                                                        <img src="themes/images/products/9.jpg" alt=""/>
                                                                    </div>
                                                                    <div class="span4">
                                                                        <h3>New | Available</h3>				
                                                                        <hr class="soft"/>
                                                                        <h5>Product Name </h5>
                                                                        <p>
                                                                            Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
                                                                            that is why our goods are so popular..
                                                                        </p>
                                                                        <a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
                                                                        <br class="clr"/>
                                                                    </div>
                                                                    <div class="span3 alignR">
                                                                        <form class="form-horizontal qtyFrm">
                                                                            <h3> $222.00</h3>
                                                                            <label class="checkbox">
                                                                                <input type="checkbox">  Adds product to compair
                                                                            </label><br/>
                                                                            <div class="btn-group">
                                                                                <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                                                                                <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <hr class="soft"/>
                                                            </div>
                                                            <div class="tab-pane active" id="blockView">
                                                                <ul class="thumbnails">
                                                                    <li class="span3">
                                                                        <div class="thumbnail">
                                                                            <a href="product_details.jsp"><img src="themes/images/products/10.jpg" alt=""/></a>
                                                                            <div class="caption">
                                                                                <h5>Manicure &amp; Pedicure</h5>
                                                                                <p> 
                                                                                    Lorem Ipsum is simply dummy text. 
                                                                                </p>
                                                                                <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="span3">
                                                                        <div class="thumbnail">
                                                                            <a href="product_details.jsp"><img src="themes/images/products/11.jpg" alt=""/></a>
                                                                            <div class="caption">
                                                                                <h5>Manicure &amp; Pedicure</h5>
                                                                                <p> 
                                                                                    Lorem Ipsum is simply dummy text. 
                                                                                </p>
                                                                                <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="span3">
                                                                        <div class="thumbnail">
                                                                            <a href="product_details.jsp"><img src="themes/images/products/12.jpg" alt=""/></a>
                                                                            <div class="caption">
                                                                                <h5>Manicure &amp; Pedicure</h5>
                                                                                <p> 
                                                                                    Lorem Ipsum is simply dummy text. 
                                                                                </p>
                                                                                <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="span3">
                                                                        <div class="thumbnail">
                                                                            <a href="product_details.jsp"><img src="themes/images/products/13.jpg" alt=""/></a>
                                                                            <div class="caption">
                                                                                <h5>Manicure &amp; Pedicure</h5>
                                                                                <p> 
                                                                                    Lorem Ipsum is simply dummy text. 
                                                                                </p>
                                                                                <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="span3">
                                                                        <div class="thumbnail">
                                                                            <a href="product_details.jsp"><img src="themes/images/products/1.jpg" alt=""/></a>
                                                                            <div class="caption">
                                                                                <h5>Manicure &amp; Pedicure</h5>
                                                                                <p> 
                                                                                    Lorem Ipsum is simply dummy text. 
                                                                                </p>
                                                                                <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="span3">
                                                                        <div class="thumbnail">
                                                                            <a href="product_details.jsp"><img src="themes/images/products/2.jpg" alt=""/></a>
                                                                            <div class="caption">
                                                                                <h5>Manicure &amp; Pedicure</h5>
                                                                                <p> 
                                                                                    Lorem Ipsum is simply dummy text. 
                                                                                </p>
                                                                                <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                                <hr class="soft"/>
                                                            </div>
                                                        </div>
                                                        <br class="clr">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div> </div>
                        </div>
                        <!-- MainBody End ============================= -->
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

