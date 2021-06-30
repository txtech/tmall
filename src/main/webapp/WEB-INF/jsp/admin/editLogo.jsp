<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="logo设置"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="6"/>
<%@include file="common/adminNavigator.jsp" %>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">首页Logo</div>

        <div class="panel-body">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">名称</th>
                    <th scope="col">Logo图片</th>
                    <c:if test="${user.group=='superAdmin'}">
                        <th scope="col">编辑</th>
                        <th scope="col">清空</th>
                    </c:if>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${configs}" var="c" varStatus="vs">
                    <tr>
                        <th scope="row">${c.id}</th>
                        <td>${c.cname}</td>
                        <td><img src="${c.value}" height="60px"></td>
                        <td><a href="edit2?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                        <td><a href="clean?id=${c.id}" class="delete-button"><span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="common/adminFooter.jsp" %>
