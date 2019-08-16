<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="p" type="viewmodel.CategoryViewModel" scope="request"/>
<!doctype html>
<html>
<head>
    <title>MasatsuguBookstore</title>
    <meta charset="utf-8">
    <meta name="description" content="The category page for Futurist Press">

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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/category.css"/>">

</head>

<body>
<main>
    <jsp:include page="header.jsp"/>
    <section id="upperCategory">
        <ul id="categoriesList">
            <c:forEach var="category" items="${p.categories}">
                <div class="categoryDetails">
                    <c:choose>
                        <c:when test="${category.name == p.selectedCategory.name}">
                            <li><a id="selectedCategoryName" href="category?category=${category.name}" style="color:black;
                                font-family:'Harlow Solid Italic'; text-transform: capitalize">
                                <my:capitalize stringArg="${category.name}"/></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="unselectedCategoryName" href="category?category=${category.name}" style="color:black;
                                font-family:'Harlow Solid Italic'; text-transform: capitalize">
                                <my:capitalize stringArg="${category.name}"/></a></li>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </ul>
    </section>

    <section id="lowerCategory">
        <ul id="booksItems">
            <c:forEach var="book" items="${p.selectedCategoryBooks}">
                <div class="bookDetails">
                    <a href="#">
                        <img src="<my:imageName stringArg="${p.bookImagePath}${book.title}"/>"
                             alt="${book.title} picture"/>
                    </a>
                    <br>
                    <p style="font-size: 18px">${book.title}</p>
                    <p style="font-size: 15px">${book.author}</p>
                    <p style="color: darkslategrey"><fmt:formatNumber type="currency" currencySymbol="&dollar;"
                                                                      value="${book.price/100.0}"/></p>
                    <br>
                    <div class="addCartAndReadNow">
                        <%--<form action="cart" method="post">
                            <input type="hidden" name="bookId" value="${book.bookId}"/>
                            <input type="hidden" name="action" value="add"/>
                            <input type="hidden" name="category" value="${p.selectedCategory.name}"/>
                            <input class="addToCart" type="submit" name="submit"
                                   value="Add To Cart" style="color:black; font-family:'Harlow Solid Italic'"/>
                        </form>--%>
                        <button class="addToCartButton"
                                data-book-id="${book.bookId}"
                                data-action="add" style="color:black; font-family:'Harlow Solid Italic'">
                            Add To Cart
                        </button>
                        <c:if test="${book.isPublic}">
                            <a class="readMeNow" style="color:black; font-family:'Harlow Solid Italic'">Read Me
                                Now!</a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </ul>
    </section>
    <jsp:include page="footer.jsp"/>
</main>
<script src="<c:url value="/js/ajax-functions.js"/>" type="text/javascript"></script>
<script>
    var addToCartButtons = document.getElementsByClassName("addToCartButton");
    for (var i = 0; i < addToCartButtons.length; i++) {
        addToCartButtons[i].addEventListener("click", function (event) {
            addToCartEvent(event.target)
        });
    }

    function addToCartEvent(button) {
        var data = {
            "bookId": button.dataset.bookId,
            "action": button.dataset.action
        };
        ajaxPost('cart', data, function (text, xhr) {
            addToCartCallback(text, xhr)
        });
    }

    function addToCartCallback(responseText, xhr) {
        var cartCount = JSON.parse(responseText).cartCount;
        document.getElementById('cartCount').textContent = '' + cartCount;
    }
</script>
</body>
</html>