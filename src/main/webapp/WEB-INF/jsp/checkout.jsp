<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value="/js/jquery.validate.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/additional-methods.js"/>" type="text/javascript"></script>

<jsp:useBean id="p" scope="request" type="viewmodel.CheckoutViewModel"/>

<script type="text/javascript">
    $(document).ready(function () {
        $("#checkoutForm").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    number: true
                },
                address: "required",
                creditCard: {
                    required: true,
                    number: true
                }
            }
        });
    });
</script>

<!doctype html>
<html>
<head>
    <title>Masatsugu Bookstore</title>
    <meta charset="utf-8">
    <meta name="description" content="The checkout page for My Bookstore">

    <!--
        normalize-and-reset.css.css is a basic CSS reset; useful for starting from ground zero.
        always include this first.
    -->

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">

    <!--
        cascading appropriately, we have:

        main.css    --  all things common
        header.css  --  header-specific rules
        footer.css  --  footer-specific rules
        <page>.css  --  page-specific rules
        extras.css  --  extras you may want
    -->

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/checkout.css"/>">

</head>

<body class="checkout">
<main>
    <jsp:include page="header.jsp"/>

    <div id="checkout">
        <section id="mainCheckout">
            <p id="checkoutTitle" style="color:black; font-family:'Harlow Solid Italic'">Checkout</p>
            <br>
            <div id="checkoutFormErrors" style="color:black; font-family:'Harlow Solid Italic'">
                <c:if test="${p.hasValidationError}">
                    <c:if test="${p.customerForm.hasNameError}">
                        ${p.customerForm.nameErrorMessage}<br>
                    </c:if>
                    <c:if test="${p.customerForm.hasAddressError}">
                        ${p.customerForm.addressErrorMessage}<br>
                    </c:if>
                    <c:if test="${p.customerForm.hasPhoneError}">
                        ${p.customerForm.phoneErrorMessage}<br>
                    </c:if>
                    <c:if test="${p.customerForm.hasEmailError}">
                        ${p.customerForm.emailErrorMessage}<br>
                    </c:if>
                    <c:if test="${p.customerForm.hasCreditCardError}">
                        ${p.customerForm.creditCardErrorMessage}<br>
                    </c:if>
                    <c:if test="${p.customerForm.hasCcMonthError}">
                        ${p.customerForm.ccMonthErrorMessage}<br>
                    </c:if>
                </c:if>
                <c:if test="${p.hasTransactionError}">
                    Transactions have not been implemented yet.<br>
                </c:if>
                <br>
            </div>
            <div id="checkoutFormAndInfo">
                <div id="checkoutFormBox">
                    <form id="checkoutForm" action="<c:url value='checkout'/>" method="post">
                        <p id="nameTitle" style="color:black; font-family:'Harlow Solid Italic'">Name</p>
                        <input class="textField" type="text" size="20" maxlength="45" name="name"
                               value="${p.customerForm.name}">
                        <br>
                        <br>
                        <p id="addressTitle" style="color:black; font-family:'Harlow Solid Italic'">Address</p>
                        <input class="textField" type="text" size="20" maxlength="45" name="address"
                               value="${p.customerForm.address}">
                        <br>
                        <br>
                        <p id="phoneTitle" style="color:black; font-family:'Harlow Solid Italic'">Phone</p>
                        <input class="textField" type="text" size="20" maxlength="45" id="phone" name="phone"
                               value="${p.customerForm.phone}">
                        <br>
                        <br>
                        <p id="emailTitle" style="color:black; font-family:'Harlow Solid Italic'">Email</p>
                        <input class="textField" type="text" size="20" maxlength="45" name="email"
                               value="${p.customerForm.email}">
                        <br>
                        <br>
                        <p id="creditCardTitle" style="color:black; font-family:'Harlow Solid Italic'">Credit Card</p>
                        <input class="textField" type="text" size="20" maxlength="45" name="creditCard">
                        <br>
                        <br>
                        <p id="expDateTitle" style="color:black; font-family:'Harlow Solid Italic'">Exp. Date</p>
                        <select class="selectMenu" name="ccMonth">
                            <c:set var="montharr"
                                   value="${['January','February','March','April','May','June','July','August','September','October','November','December']}"/>
                            <c:forEach begin="1" end="12" var="month">
                                <option style="color:black; font-family:'Harlow Solid Italic'" value="${month}"
                                        value="${p.customerForm.ccMonth}"
                                        <c:if test="${p.customerForm.ccMonth eq month}">selected</c:if>>
                                        ${month}-${montharr[month - 1]}
                                </option>
                            </c:forEach>
                        </select>
                        <select class="selectMenu" name="ccYear">
                            <c:forEach begin="2019" end="2027" var="year">
                                <option style="color:black; font-family:'Harlow Solid Italic'" value="${year}"
                                        value="${p.customerForm.ccYear}"
                                        <c:if test="${p.customerForm.ccYear eq year}">selected</c:if>>
                                        ${year}
                                </option>
                            </c:forEach>
                        </select>
                        <input id="submitButton" style="color:black; font-family:'Harlow Solid Italic'" type="submit"
                               value="Submit">
                    </form>
                    <br>
                    <br>
                </div>
                <div id="checkoutInfo">
        <span id="checkoutInfoText" style="color:black; font-family:'Harlow Solid Italic'">
            Your credit card will be charged <strong><fmt:formatNumber type="currency"
                                                                       currencySymbol="$"
                                                                       value="${((p.cart.subtotal)/100.0) + 5}"/></strong><br>
            (<strong><fmt:formatNumber type="currency"
                                       currencySymbol="$"
                                       value="${p.cart.subtotal/100.0}"/></strong> + <strong><fmt:formatNumber
                type="currency"
                currencySymbol="$" value="${p.cart.surcharge/100.0}"/></strong> shipping)
        </span>
                </div>
            </div>
        </section>
    </div>
    <script>
        $("checkoutForm").validate();
    </script>
    <jsp:include page="footer.jsp"/>
</main>
</body>
</html>
