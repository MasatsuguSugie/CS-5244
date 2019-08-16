<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="p" type="viewmodel.ConfirmationViewModel" scope="request"/>
<html>
<head>
    <title>MasatsuguBookstore</title>
    <meta charset="utf-8">
    <meta name="description" content="The cart page for Futurist Press">

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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/confirmation.css"/>">

</head>

<body>
<main>
    <jsp:include page="header.jsp"/>
    <div id="confirm">
        <section id="mainConfirm">
            <div id="confirmText">
                <br>
                <h2 id="confirmTitle" style="color:black; font-family:'Harlow Solid Italic'">Confirmation</h2>
                <br>
                <p id="confirmNumber" style="color:black; font-family:'Harlow Solid Italic'">
                    Your confirmation number is: ${p.orderDetails.order.confirmationNumber}
                </p>
                <br>
                <p id="date" style="color:black; font-family:'Harlow Solid Italic'">
                    <%=(new java.util.Date())%>
                </p>
                <br>
            </div>
            <table id="confirmTable">
                <tr>
                    <th id="title">Title</th>
                    <th id="quantity">Quantity</th>
                    <th id="subtotal">Subtotal</th>
                </tr>
                <c:forEach var="lineItem" items="${p.orderDetails.lineItems}" varStatus="i">
                    <tr>
                        <td class="bookTitle">${p.orderDetails.books.get(i.index).title}</td>
                        <td class="quantity">${p.orderDetails.lineItems.get(i.index).quantity}</td>
                        <td class="price"><fmt:formatNumber type="currency"
                                                            currencySymbol="$"
                                                            value="${p.orderDetails.books.get(i.index).price * lineItem.quantity/100.0}"/></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td style="color:red; font-family:'Harlow Solid Italic'">Delivery Surcharge</td>
                    <td></td>
                    <td id="surcharge"><fmt:formatNumber type="currency"
                                                         currencySymbol="$" value="${p.cart.surcharge/100.0}"/></td>
                </tr>
                <tr>
                    <td style="color:black; font-family:'Harlow Solid Italic'"><strong>Total</strong></td>
                    <td></td>
                    <td class="price"><strong><fmt:formatNumber type="currency"
                                                                currencySymbol="$"
                                                                value="${p.orderDetails.order.amount/100.0}"/></strong>
                    </td>
                </tr>
            </table>
            <br>
            <div id="custBox">
                <div id="customerInfo" style="color:black; font-family:'Harlow Solid Italic'">
                    <p><strong>Customer Information</strong></p>
                    <p>Name: ${p.orderDetails.customer.customerName}
                    <p>Email: ${p.orderDetails.customer.email}</p>
                    <p>Address: ${p.orderDetails.customer.address}</p>
                    <p>Credit Card: ${p.astericks(p.orderDetails.customer.ccNumber)} (<my:ccExp
                            stringArg="${p.orderDetails.customer.ccExpDate}"/>)</p>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="footer.jsp"/>
</main>
</body>
</html>