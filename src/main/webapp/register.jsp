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
                        <div id="mainBody" >
                            <div class="container" >
                                <div class="row" >
                                    <!-- Sidebar ================================================== -->
                                    <div id="sidebar" class="span3"dir="auto">
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
                                    <div class="span9" >
                                        <ul class="breadcrumb" dir="auto">
                                            <li><a href="<c:url value='Home'/>"><fmt:message key="home" /></a> <span class="divider">/</span></li>
                                            <li class="active"><fmt:message key="registration" /></li>
                                        </ul>
                                        <h3 dir="auto"> <fmt:message key="registration" /></h3>	
                                        <div class="well">
                                            <script src=themes/js/validation.js></script>  

                                            <form name="form" method="post"  class="form-horizontal" action="Regsiter" onsubmit="return !!(ValidateEmail() & ValidateFirstName(document.form.firstName) & ValidateLastName(document.form.lastName) & ValidateFirstPass() & ValidateSecondPass());" >
                                                <h4 dir="auto"><fmt:message key="urPersonalInfo" /></h4>
                                                <div class="control-group">
                                                    <label class="control-label" for="inputFname1"><fmt:message key="firstName" /> <sup>*</sup></label>
                                                    <div class="controls">
                                                        <input type="text" name="firstName" id="inputFname1" placeholder="<fmt:message key="firstName" />" onblur="return ValidateFirstName(document.form.firstName);">
                                                        <div id="FNmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="inputLnam"><fmt:message key="lastName" /> <sup>*</sup></label>
                                                    <div class="controls">
                                                        <input type="text" name="lastName" id="inputLnam" placeholder="<fmt:message key="lastName" /> " onblur="return ValidateLastName(document.form.lastName);">
                                                        <div id="LNmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="mobile"><fmt:message key="mobile" /> <sup>*</sup></label>
                                                    <div class="controls">
                                                        <input type="text"  name="mobile" id="mobile" placeholder="<fmt:message key="mobile" />"/>
                                                        <div id="phonemsg" style="color:Red;display:none">Please enter a valid mobile number</div>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="input_email"><fmt:message key="email" /> <sup>*</sup></label>
                                                    <div class="controls">
                                                        <input type="text" name="email" id="input_email" placeholder="<fmt:message key="email" />" onblur="return ValidateEmail();" > 
                                                        <div id="emailmsg" style="color:Red;display:none"><fmt:message key="emailErrMsg" /></div>
                                                    </div>
                                                </div>	  
                                                <div class="control-group">
                                                    <label class="control-label" for="inputPassword1"><fmt:message key="password" /> <sup>*</sup></label>
                                                    <div class="controls">
                                                        <input type="password" name="firstPass" id="inputPassword1" placeholder="<fmt:message key="password" />" onblur="return ValidateFirstPass();">
                                                        <div id="pass1msg" style="color:Red;display:none"><fmt:message key="passwordErrMsg" /> </div>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <label class="control-label" for="inputPassword2"><fmt:message key="confirmPassword" /> <sup>*</sup></label>
                                                    <div class="controls">
                                                        <input type="password" name="secondPass" id="inputPassword2" placeholder="<fmt:message key="confirmPassword" />" onblur="return ValidateSecondPass();">
                                                        <div id="pass2msg" style="color:Red;display:none"><fmt:message key="confirmPassErrMsg" /></div>
                                                    </div>
                                                </div>        


                                                <h4 dir="auto"><fmt:message key="urAddress" /></h4>


                                                <div class="control-group">
                                                    <label class="control-label" for="country"><fmt:message key="country" /><sup>*</sup></label>
                                                    <div class="controls">
                                                        <select id="country" name="country" >
                                                            <option value="Kuwait">الكويت</option>
                                                        </select>
                                                    </div>
                                                </div>	

                                                <div class="control-group">
                                                    <label class="control-label" for="city"><fmt:message key="city" /><sup>*</sup></label>
                                                    <div class="controls">
                                                        <select id="city" name="city" >
                                                            <option value="Kuwait">الكويت</option>
                                                            <option value="Hawally">الحوالى</option>
                                                            <option value="Farwaniya">الفروانية</option>
                                                            <option value="AlJahra">الجهراء</option>
                                                            <option value="Mubarak_AlKabeer">مبارك الكبير</option>
                                                        </select>
                                                    </div>
                                                </div>	



                                                <p><sup>*</sup><fmt:message key="requiredField" />	</p>

                                                <div class="control-group">
                                                    <div class="controls">
                                                        <input type="hidden" name="email_create" value="1">
                                                        <input type="hidden" name="is_new_customer" value="1">
                                                        <input class="btn btn-large btn-success" type="submit" value="<fmt:message key="register" />" onclick="ValidateEmail(document.form1.email)" />
                                                    </div>
                                                </div>		
                                            </form>
                                        </div>

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

