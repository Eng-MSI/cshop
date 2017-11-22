<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:if test="${not empty cookie['lang']}">
    <c:set var="language" value="${cookie['lang'].value}"></c:set>
</c:if>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="CanShop.Localization.text" />
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
                        <div id="mainBody" dir="auto">
                            <div class="container">
                                <hr class="soften">
                                <h1><fmt:message key="visitUs" /></h1>
                                <hr class="soften"/>	
                                <div class="row">
                                    <div class="span4">
                                        <h4><fmt:message key="contactDetails" /></h4>
                                        <p><fmt:message key="address" />
                                            <br/><br/>
                                            info@bootsshop.com<br/>
                                        <div dir="auto"> <h4>  <fmt:message key="Tel" /></h4>
                                            <div dir="ltr"> <h5> +(965) 666 2500 7 </h5></div><br/>
                                        </div>
                                        
                                    </div>

                                    <div class="span4">
                                        <h4><fmt:message key="openingHours" /></h4>
                                        <h5><fmt:message key="Sunday" /> - <fmt:message key="Thursday" /></h5>
                                        <p>09:00am - 09:00pm<br/><br/></p>

                                    </div>
                                    <div class="span4">
                                        <h4><fmt:message key="emailUs" /></h4>
                                        <form class="form-horizontal">
                                            <fieldset>
                                                <div class="control-group">

                                                    <input type="text" placeholder="<fmt:message key="name" />" class="input-xlarge"/>

                                                </div>
                                                <div class="control-group">

                                                    <input type="text" placeholder="<fmt:message key="email" />" class="input-xlarge"/>

                                                </div>
                                                <div class="control-group">

                                                    <input type="text" placeholder="<fmt:message key="subject" />" class="input-xlarge"/>

                                                </div>
                                                <div class="control-group">
                                                    <textarea rows="3" id="textarea" class="input-xlarge"></textarea>

                                                </div>

                                                <button class="btn btn-large" type="submit"><fmt:message key="sendMsg" /></button>

                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                                <div class="row" >
                                    <div class="span12" >
                                        <iframe style="width:100%; height:300; border: 0px" scrolling="no" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3484.71062711494!2d48.066911484902114!3d29.302891882158153!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xab110d4ea3cf8e4b!2sMarafi+Mosque!5e0!3m2!1sar!2seg!4v1501596050920&amp;z=14&amp;output=embed"></iframe><br />
                                        <small><a href="https://www.google.com.eg/maps/place/Marafi+Mosque/@29.3028919,48.0669115,17z/data=!4m13!1m7!3m6!1s0x3fcf9e0c20c8c31d:0x5c6deedc26eec83!2zNiDYtNin2LHYuSA02Iwg2LPZhNmI2YnYjCDYp9mE2YPZiNmK2KrigI4!3b1!8m2!3d29.3028919!4d48.0647228!3m4!1s0x0:0xab110d4ea3cf8e4b!8m2!3d29.3033989!4d48.0669431&amp;z=14" style="color:#0000FF;text-align:left">View Larger Map</a></small>
                                    </div>
                                </div>
                            </div>
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

