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
<html lang="en">
    <head>
        <style>
            table {
                width:100%;
            }
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td {
                padding: 5px;
                text-align: center;
            }
            table#t01 tr:nth-child(even) {
                background-color: #eee;
            }
            table#t01 tr:nth-child(odd) {
                background-color:#fff;
            }
            table#t01 th {
                background-color: black;
                color: white;
            }
        </style>
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
        <link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="../themes/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../themes/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../themes/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../themes/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../themes/images/ico/apple-touch-icon-57-precomposed.png">
        <style type="text/css" id="enject"></style>
    </head>
    <body><div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">
                    <div class="span6"></div>
                    <div class="span6">
                        <div class="pull-right">

                            <c:if test="${language == 'ar' }" >
                                <a href="${englishURL}" class="btn btn-mini ">En</a>
                                <a href="${arabicURL}" class="btn btn-mini btn-success">ع</a>
                            </c:if>
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
                            <div class="navbar-inner">


                                <form class="form-inline navbar-search" method="get" action="Search" >
                                    <input name="searchString"  placeholder="<fmt:message key="searchHint" />" id="srchFld" class="srchTxt" type="text" />
                                    <select name="category" class="srchTxt">
                                        <option value="all"><fmt:message key="all" /></option>
                                        <option value="Phone Accessories "> <fmt:message key="mobileAccessories" /> </option>
                                        <option value="Computer Accessories"><fmt:message key="computerAccessories" /> </option>
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


                        <div class="row">
                            <!-- Sidebar end=============================================== -->
                            <div class="span9" style="position: absolute; top: 30%; left: 20%;">
                                <h3>Products Info</h3>   
                                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                                <script >
                                    jQuery(document).ready(function ($) {
                                        $(".clickable-row").click(function () {

                                            window.location = $(this).data("href");
                                        });
                                    });
                                </script>
                                <table id="t01">
                                    <div class="control-group">


                                    </div>        

                                    <tr>
                                        <th>Name</th>
                                        <th> price</th>
                                        <th> Amount</th>
                                        <th> No of viewers</th>
                                        <th> No of orders</th>

                                    </tr>
                                    <c:forEach items="${productsList}" var="product">
                                        <c:url value="AdminEditProductServlet" var="EditProductUrl" >
                                            <c:param name="Product_Id" value="${(product.productId)}" ></c:param>
                                        </c:url>
                                        <c:url value="AdminRemoveProduct" var="removeURL" >
                                            <c:param name="productId" value="${product.productId}" ></c:param>
                                        </c:url>
                                        <tr  class="clickable-row" class="menu_links" onclick="displayData(11, 1, 0, 'A')" onmouseover="" style="cursor: pointer;" data-href="${EditProductUrl}">

                                            <td>${product.productName}</td>
                                            <td>${product.productPrice}</td>
                                            <td>${product.productAmount}</td>
                                            <td>${product.productViewer}</td>
                                            <td>${product.productOrdersNo}</td>
                                            <td><a href="${removeURL}"  class="btn btn-danger" ><i class="icon-remove icon-white"></i></a></td>



                                        </tr>

                                    </c:forEach>



                                </table>
                                <br>
                                <br>
                                <a href="add_product.jsp" class="btn btn-large btn-success">Add Product</a>

                            </div>  

                        </div>
                        </div>
                        </div>
                        </div>


                        </body>
                        </html>
