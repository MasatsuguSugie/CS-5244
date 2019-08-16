<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="p" type="viewmodel.BaseViewModel" scope="request"/>
<header>
    <section id="leftHeader">
        <div id="logo">
            <a href="home">
                <img src="${p.siteImagePath}logoNew.gif" alt="Futurist Press logo"/>
            </a>
        </div>
    </section>

    <section id="midHeader">
        <div id="logoText">
            <a href="home">
                <img src="${p.siteImagePath}logoText.gif" alt="Futurist Press"/>
            </a>
        </div>
        <div id="slogan">
            <a href="category" style="color:hotpink; font-family:'Harlow Solid Italic'">Welcome to the future, one page
                at a time.</a>
        </div>
        <div id="dropdownLabel">
            <div class="dropdown">
                <button class="dropbtn" style="color:black; font-family:'Harlow Solid Italic'">Browse by category
                </button>
                <div class="dropdown-content" style="font-family:'Harlow Solid Italic'; text-transform: capitalize">
                    <c:forEach var="category" items="${p.categories}">
                        <a href="category?category=${category.name}"/>
                        <my:capitalize stringArg="${category.name}"/></a>
                    </c:forEach>
                </div>
            </div>
        </div>

    </section>

    <section id="rightHeader">
        <form id="searchForm" action="category">
            <input id="searchBox" type="text" name="category" placeholder=" Search">
            <input id="searchIcon" type="image" src="${p.siteImagePath}searchIcon1.gif" alt="Search Icon/">
        </form>
        <div id="cartIconAndCountAndLogin">
            <div id="cartIcon">
                <a href="cart">
                    <img src="${p.siteImagePath}cart.gif" alt="Cart Icon"/>
                </a>
                <a id="cartCount" href="cart" style="color:black;">${p.cart.numberOfItems}</a>
            </div>
            <div><a id="loginButton" style="color:black; font-family:'Harlow Solid Italic'" href="#" target="_self">Login</a>
            </div>
        </div>
    </section>

</header>