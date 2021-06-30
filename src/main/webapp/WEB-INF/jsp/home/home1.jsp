<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@include file="../include/header.jsp"%>
<script src="js/index.js"></script>
<c:set var="home" value="home"/>
<c:set var="title" value="首页 - ${website_name}"/>
<%@include file="../include/top.jsp"%>

<header class="index-top">
    <a href="./" class="logo"><img src="${logo1}" /></a>
    <div class="search">
        <form action="search">
            <input type="text" value="请输入想要的商品名称" name="keyword">
            <button class="search-button" type="submit">搜索</button>
        </form>
        <ul class="search-below">
            <c:forEach items="${categories}" var="c" varStatus="vs">
                <c:if test="${vs.count>=1 and vs.count<=8}">
                    <li><a href="category?id=${c.id}">${c.name}</a></li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</header>

<section class="head-bar">
    <div class="c-menu">
        <span class="glyphicon glyphicon-th-list icon"></span>
        <span>商品分类</span>
    </div>
    <div class="r-menu">
        <c:forEach items="${categories}" var="c" varStatus="vs">
            <c:if test="${vs.count>=1 and vs.count<=4}">
                <a href="category?id=${c.id}">${c.name}</a>
            </c:if>
        </c:forEach>
    </div>
    <c:if test="${phone != ''}">
        <a style="float: right!important;line-height: 35px;font-size: 16px;color: black;" class="glyphicon glyphicon glyphicon-earphone">  ${phone}</a>
    </c:if>
</section>

<section class="carousel">
    <div data-ride="carousel" class="carousel-of-product carousel slide" id="carousel-of-product" >
        <ol class="carousel-indicators">
            <li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
            <li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
        </ol>
        <div role="listbox" class="carousel-inner">
            <c:if test="${banner1 != ''}">
                <div class="item active"><a  target="_blank"><img src="${banner1}" class="carousel-image"></a></div>
            </c:if>
            <c:if test="${banner2 != ''}">
                <div class="item"><a  target="_blank"><img src="${banner2}" class="carousel-image"></a></div>
            </c:if>
            <c:if test="${banner3 != ''}">
                <div class="item"><a  target="_blank"><img src="${banner3}" class="carousel-image"></a></div>
            </c:if>
            <c:if test="${banner4 != ''}">
                <div class="item"><a  target="_blank"><img src="${banner4}" class="carousel-image"></a></div>
            </c:if>
            <c:if test="${banner5 != ''}">
                <div class="item"><a  target="_blank"><img src="${banner5}" class="carousel-image"></a></div>
            </c:if>
        </div>

        <div class="m-menu">
            <ul>
                <c:forEach items="${categories}" var="c" varStatus="vs">
                    <c:if test="${vs.count>=1 and vs.count<=13}">
                        <li cid="${c.id}"><span class="glyphicon glyphicon-link"></span><a href="category?id=${c.id}">${c.name}</a></li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <c:forEach items="${categories}" var="c" varStatus="vs">
            <div class="d-menu" cid="${c.id}" style="display: none">
                <c:forEach items="${c.products}" var="p" varStatus="vs">
                    <a href="product?id=${p.id}">${p.subTitle}</a>
                </c:forEach>
            </div>
        </c:forEach>
    </div>
</section>

<main class="index">
    <c:forEach items="${categories}" var="c" varStatus="vs">
        <c:if test="${c.recommend > 0}">
            <div class="products">
                <div class="title-bar">
                    <i class="color-mark"></i>
                    <span class="category-title">${c.name}</span>
                </div>

                <div class="product-items">
                    <c:forEach items="${c.products}" var="p" varStatus="vs">
                        <a href="product?id=${p.id}">
                            <div class="item">
                                <img src="${p.homeImage}">
                                <div class="item-title">${p.name}${p}</div>
                                <div class="item-price">￥${p.nowPrice}</div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </c:forEach>
    <img src="img/end.png" class="end-png" id="endpng">
</main>

<%@include file="../include/footer.jsp"%>
