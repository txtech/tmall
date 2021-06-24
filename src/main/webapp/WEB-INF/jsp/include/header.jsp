<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<!DOCTYPE html>
<htmL>
<head>
    <meta charset="UTF-8">
    <title>${(empty SEOTitle)?title:SEOTitle}</title>
    <meta name="keywords" content="${keywords}" />
    <meta name="description" content="${description}"/>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/style.css">
    <script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${contextPath}/js/bootstrap.min.js"></script>
</head>
<body>