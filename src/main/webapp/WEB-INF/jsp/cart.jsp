<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="p" type="viewmodel.CartViewModel" scope="request"/>
<!doctype html>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/cart.css"/>">

</head>

<body>
<main>
    <jsp:include page="header.jsp"/>
    <div id="cart">
        <section id="leftCart">
            <br>
            <h2 id="cartTitle" style="color:black; font-family:'Harlow Solid Italic'">Cart Contents</h2>
            <br>
            <c:if test="${p.cart.numberOfItems > 0}">
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="clear"/>
                    <input id="clearCart" type="submit" name="submit" value="Clear Cart"/>
                </form>
            </c:if>
            <br>
            <table id="cartTable">
                <tr>
                    <th id="title">Title</th>
                    <th id="quantity">Quantity</th>
                    <th id="subtotal">Subtotal</th>
                </tr>
                <c:forEach var="cartItem" items="${p.cart.items}">
                    <c:set var="book" value="${cartItem.book}"/>
                    <tr>
                        <td class="bookTitle">${book.title}</td>
                        <td class="quantityNumber">
                            <form action="cart" method="post">
                                <input type="hidden" name="bookId" value="${book.bookId}"/>
                                <input type="hidden" name="action" value="increment"/>
                                <input type="hidden" name="category" value="${p.cart.increment(book)}"/>
                                <input class="add" style="color:white;" type="submit" name="submit" value="+"/>
                            </form>
                            <p class="quantity"> ${cartItem.quantity - 1} </p>
                            <form action="cart" method="post">
                                <input type="hidden" name="bookId" value="${book.bookId}"/>
                                <input type="hidden" name="action" value="decrement"/>
                                <input type="hidden" name="category" value="${p.cart.decrement(book)}"/>
                                <input class="subtract" style="color:white;" type="submit" name="submit" value="-"/>
                            </form>
                        </td>
                        <td class="price">$${book.price/100.0}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td class="totalQuantity"> ${p.cart.numberOfItems}</td>
                    <td class="price">$${p.cart.subtotal/100.0}</td>
                </tr>
            </table>
            <div id="contOrProceed">
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="return"/>
                    <input id="contShopping" style="color:black; font-family:'Harlow Solid Italic'" type="submit"
                           name="submit" value="Continue Shopping"/>
                </form>
                <c:if test="${p.cart.numberOfItems > 0}">
                    <a id="checkOut" href="checkout"
                       style="color:black; font-family:'Harlow Solid Italic'">Proceed to Checkout</a>
                </c:if>
            </div>
        </section>
        <section id="rightCart">
            <div id="register">
                <p id="registerTitle" style="font-family:'Harlow Solid Italic'"><strong>Register an Account</strong></p>
                <p>Speed up your delivery time and </p>
                <p>save your order information by
                <p/>
                <p><a href="#">creating an account.</a></p>
                <p> Or <a href="#">login in to an existing account</a></p>
            </div>
        </section>
    </div>
    <jsp:include page="footer.jsp"/>
</main>
</body>
</html>
