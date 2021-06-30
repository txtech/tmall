<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/header.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>出错了</title>
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/style.css">
</head>

<%@include file="include/top.jsp"%>
<main class="search" style="margin-bottom: 10%;margin-top: 5%;">
<div class="alert alert-warning" role="alert">
    <%if(exception != null){exception.toString();}%>
</div>
</main>