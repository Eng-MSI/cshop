function ValidateEmail()
{
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (document.form.email.value.match(mailformat))
    {
        document.getElementById("emailmsg").hidden = true;
        document.forms["form"]["email"].style.border = "";
        return true;
    } else
    {
        document.getElementById("emailmsg").hidden = false;
        document.getElementById("emailmsg").style.display = "";
        document.forms["form"]["email"].style.border = "1px solid red";

        return false;
    }
}
function ValidateFirstName(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("FNmsg").hidden = false;
        document.getElementById("FNmsg").style.display = "";
        document.forms["form"]["firstName"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("FNmsg").hidden = true;
        document.forms["form"]["firstName"].style.border = "";
        return true;

    }
}
function ValidateLastName(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("LNmsg").hidden = false;
        document.getElementById("LNmsg").style.display = "";
        document.forms["form"]["lastName"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("LNmsg").hidden = true;
        document.forms["form"]["lastName"].style.border = "";
        return true;

    }
}
function ValidateFirstPass()
{

    if (document.form.firstPass.value.length < 8)
    {


        document.getElementById("pass1msg").hidden = false;
        document.getElementById("pass1msg").style.display = "";
        document.forms["form"]["firstPass"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("pass1msg").hidden = true;
        document.forms["form"]["firstPass"].style.border = "";
        return true;

    }
}
function ValidateSecondPass()
{

    if (document.form.firstPass.value == document.form.secondPass.value)
    {
        document.getElementById("pass2msg").hidden = true;
        document.forms["form"]["secondPass"].style.border = "";
        return true;


    } else
    {

        document.getElementById("pass2msg").hidden = false;
        document.getElementById("pass2msg").style.display = "";
        document.forms["form"]["secondPass"].style.border = "1px solid red";

        return false;

    }
}
function ValidateProductName(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("PNmsg").hidden = false;
        document.getElementById("PNmsg").style.display = "";
        document.getElementById("PNmsg").style.display = "";
        document.forms["newProductForm"]["ProductName"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("PNmsg").hidden = true;
        document.forms["newProductForm"]["ProductName"].style.border = "";
        return true;

    }
}
function ValidateProductArabicName(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("PANmsg").hidden = false;
        document.getElementById("PANmsg").style.display = "";
        document.forms["newProductForm"]["ProductArabicName"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("PANmsg").hidden = true;
        document.forms["newProductForm"]["ProductArabicName"].style.border = "";
        return true;

    }
}
function ValidateProductPrice(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("PPmsg").hidden = false;
        document.getElementById("PPmsg").style.display = "";
        document.forms["newProductForm"]["ProductPrice"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("PPmsg").hidden = true;
        document.forms["newProductForm"]["ProductPrice"].style.border = "";
        return true;

    }
}
function ValidateProductQuantity(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("PQmsg").hidden = false;
        document.getElementById("PQmsg").style.display = "";
        document.forms["newProductForm"]["ProductQuantity"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("PQmsg").hidden = true;
        document.forms["newProductForm"]["ProductQuantity"].style.border = "";
        return true;

    }
}
function ValidateProductViewers(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("PVmsg").hidden = false;
        document.getElementById("PVmsg").style.display = "";
        document.forms["newProductForm"]["ProductViewers"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("PVmsg").hidden = true;
        document.forms["newProductForm"]["ProductViewers"].style.border = "";
        return true;

    }
}
function ValidateProductOrders(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("POmsg").hidden = false;
        document.getElementById("POmsg").style.display = "";
        document.forms["newProductForm"]["ProductOrders"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("POmsg").hidden = true;
        document.forms["newProductForm"]["ProductOrders"].style.border = "";
        return true;

    }
}
function ValidateProductDescription(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("PDmsg").hidden = false;
        document.getElementById("PDmsg").style.display = "";
        document.forms["newProductForm"]["ProductDescription"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("PDmsg").hidden = true;
        document.forms["newProductForm"]["ProductDescription"].style.border = "";
        return true;

    }
}
function ValidateProductArabicDescription(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("PADmsg").hidden = false;
        document.getElementById("PADmsg").style.display = "";
        document.forms["newProductForm"]["ProductArabicDescription"].style.border = "1px solid red";

        return false;
    } else
    {
        document.getElementById("PADmsg").hidden = true;
        document.forms["newProductForm"]["ProductArabicDescription"].style.border = "";
        return true;

    }
}
function ValidateDate(inputText)
{

    if (inputText.value.length == 0)
    {


        document.getElementById("PDatemsg").hidden = false;
        document.getElementById("PDatemsg").style.display = "";
        document.forms["newProductForm"]["ProductDate"].style.border = "1px solid red";

        return false;
    } else
    {
        
        document.getElementById("Pdatemsg").hidden = true;
        document.forms["newProductForm"]["ProductDate"].style.border = "";
        return true;

    }
}