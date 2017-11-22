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
                        <div id="mainBody"  >
                            <div class="container" style='width:800px;margin:0 auto;'>
                                <div class="row">
                                    <div class="span9">
                                        <ul class="breadcrumb">
                                            <li><a href="Home">Home</a> <span class="divider">/</span></li>
                                            <li class="active">Add Product</li>
                                        </ul>
                                        <h3> Add Product</h3>	
                                        <hr class="soft"/>

                                        <div class="row" style='width:800px;margin:0 auto;' >
                                            <div class="span4" style='width:800px;margin:0 auto;'>
                                                <div class="well">
                                                    <script src=../themes/js/validation.js></script> 
                                                    <form class="form-horizontal" name="newProductForm" action="AddProduct" method="post" onsubmit="return !!(ValidateProductName(document.form.ProductName) & ValidateProductArabicName(document.form.ProductArabicName) & ValidateProductDescription(document.form.ProductDescription) & ValidateProductArabicDescription(document.form.ProductArabicDescription) & ValidateProductViewers(document.form.ProductViewers) & ValidateProductQuantity(document.form.ProductQuantity) & ValidateProductPrice(document.form.ProductPrice) & ValidateProductOrders(document.form.ProductOrders) & ValidateDate(document.form.ProductDate))" >
                                                        <div class="control-group">
                                                            <!-- inputs ============================================== -->
                                                            <label class="control-label" for="ProductName">Product  Name <sup>*</sup></label>
                                                            <div class="controls">
                                                                <input type="text" name="ProductName" id="ProductName" placeholder="Product Name" onblur="return ValidateProductName(document.form.ProductName)">
                                                                <div id="PNmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductArabicName">Product Arabic Name <sup>*</sup></label>
                                                            <div class="controls">
                                                                <input type="text" name="ProductArabicName" id="ProductArabicName" placeholder="Product Arabic Name" onblur="return ValidateProductArabicName(document.form.ProductArabicName)">
                                                                <div id="PANmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                            </div>
                                                        </div>

                                                        <div class="control-group">
                                                            <label class="control-label" for="Product_Category">Category <sup>*</sup></label>
                                                            <div class="controls">
                                                                <select id="ddl" name="ProductCategory" onchange="configureDropDownLists(this, document.getElementById('ddl2'))">
                                                                    <option value=""> </option>
                                                                    <option value="mobile"> mobile Accessories </option>
                                                                    <option value="Computer Accessories">computer Accessories </option>
                                                                    <option value="Beauty And Personal Care">Beauty and PersonalCare </option>
                                                                    <option value="Glasses">glasses </option>
                                                                    <option value="Camping Equipment">Camping equipment </option>
                                                                    <option value="Shoes And Bags">Shoes and Bags </option>
                                                                    <option value="House Utensils">House Utensils </option>
                                                                    <option value="Gifts">gifts </option>
                                                                    <option value="Cups">cups </option>
                                                                    <option value="Toys">toys </option>
                                                                    <option value="Others">other </option>
                                                                </select> 
                                                            </div>
                                                        </div>

                                                        <div class="control-group">
                                                            <label class="control-label" for="Product_Category">SubCategory <sup>*</sup></label>
                                                            <div class="controls">
                                                                <select id="ddl2" name="subCategory">
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <script type="text/javascript">
                                                            function configureDropDownLists(ddl1, ddl2) {
                                                                var mobile = ['Apple', 'Samsung', 'Sony', 'HTC', 'Huawei'];

                                                                switch (ddl1.value) {
                                                                    case 'mobile':
                                                                        ddl2.options.length = 0;
                                                                        for (i = 0; i < mobile.length; i++) {
                                                                            createOption(ddl2, mobile[i], mobile[i]);
                                                                        }
                                                                        break;


                                                                    default:
                                                                        ddl2.options.length = 0;
                                                                        break;
                                                                }

                                                            }

                                                            function createOption(ddl, text, value) {
                                                                var opt = document.createElement('option');
                                                                opt.value = value;
                                                                opt.text = text;
                                                                ddl.options.add(opt);
                                                            }
                                                        </script>

                                                        <div class="control-group">
                                                            <label class="control-label" for="Price">Product Price <sup>*</sup></label>
                                                            <div class="controls">
                                                                <input type="number"  name="ProductPrice" id="price" placeholder="Product Price" onblur="return ValidateProductPrice(document.form.ProductPrice)"/>
                                                                <div id="PPmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div><br>
                                                                Featured? <input type="checkbox" name="productFeatured"/>
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
                                                                Hot Offer ? 
                                                                <input type="checkbox" id="chkYes" name="chkPrice" />

                                                            </div>

                                                            <div class="control-group" id="dvPrice" style="display: none">
                                                                <label class="control-label" for="NEWprice">New Price </label>
                                                                <div class="controls">
                                                                    <input type="number" value="0" name="NewPrice" id="NewPrice" placeholder="Product New Price"/> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductBrand">Product Brand</label>
                                                            <div class="controls">
                                                                <input type="text" name="ProductBrand" id="ProductBrand" placeholder="Product Brand">
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductArabicBrand">Product Arabic Brand <sup>*</sup></label>
                                                            <div class="controls">
                                                                <input type="text" name="ProductArabicBrand" id="ProductArabicBrand" placeholder="Product Arabic Brand">
                                                            </div>
                                                        </div>

                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductQuantity">Product Quantity <sup>*</sup></label>
                                                            <div class="controls">
                                                                <input type="number" id="ProductQuantity" placeholder="Quantity" name="ProductQuantity" onblur="return ValidateProductQuantity(document.form.ProductQuantity)">
                                                                <div id="PQmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                            </div>
                                                        </div>    

                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductSerial">Product Serial</label>
                                                            <div class="controls">
                                                                <input type="text" id="ProductSerial" placeholder="Product Serial" name="ProductSerial">
                                                            </div>
                                                        </div> 

                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductDimentions">Product Dimentions</label>
                                                            <div class="controls">
                                                                <input type="text" id="ProductDimentions" placeholder="Product Dimentions" name="ProductDimentions">
                                                            </div>
                                                        </div>  

                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductDate">Product Date </label>
                                                            <div class="controls">
                                                                <input type="text" onblur="return ValidateDate(document.form.ProductDate)"  id="ProductDate" name="ProductDate" placeholder="MM/dd/yyyy" >
                                                                <div id="Pdatemsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                            </div>
                                                        </div>   

                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductViewers">Product Viewers <sup>*</sup></label>
                                                            <div class="controls">
                                                                <input type="number" id="ProductViewers" placeholder="Product Viewers" name="ProductViewers" onblur="return ValidateProductViewers(document.form.ProductViewers)">
                                                                <div id="PVmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                            </div>
                                                        </div>   

                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductOrders">Product Orders <sup>*</sup></label>
                                                            <div class="controls">
                                                                <input type="number" id="ProductOrders" placeholder="Product Orders" name="ProductOrders" onblur="return ValidateProductOrders(document.form.ProductOrders)">
                                                                <div id="POmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                            </div>
                                                        </div>  

                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductDescription">Product Description <sup>*</sup></label>
                                                            <div class="controls">
                                                                <textarea name="ProductDescription" onblur="return ValidateProductDescription(document.form.ProductDescription)" placeholder="Product Description" data-mintext="10" data-maxtext="500" id="ProductDescription" style="height: 140px; width: 400px; resize: none; overflow-y: hidden; z-index: auto; position: relative; line-height: normal; font-size: 14px; transition: none; background-color: white !important;" cols="80" rows="1" data-gramm="true"  spellcheck="false" ></textarea>
                                                                <div id="PDmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <label class="control-label" for="ProductArabicDescription">Product Arabic Description <sup>*</sup></label>
                                                            <div class="controls">
                                                                <textarea name="ProductArabicDescription" onblur="return ValidateProductArabicDescription(document.form.ProductArabicDescription)" placeholder="Product Arabic Description" data-mintext="10" data-maxtext="500" id="ProductArabicDescription" style="height: 140px; width: 400px; resize: none; overflow-y: hidden; z-index: auto; position: relative; line-height: normal; font-size: 14px; transition: none; background-color: white !important;" cols="80" rows="1" data-gramm="true"  spellcheck="false" ></textarea>
                                                                <div id="PADmsg" style="color:Red;display:none"><fmt:message key="cantBeEmpty" /></div>
                                                            </div>
                                                        </div>



                                                        <p><sup>*</sup>Required field   </p>

                                                        <div class="control-group">
                                                            <div class="controls">
                                                                <input class="btn btn-large btn-success" type="submit" value="ADD Product" />
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


                        </body>
                        </html>
