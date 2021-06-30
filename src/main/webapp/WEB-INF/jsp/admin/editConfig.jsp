<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="网站设置"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="4"/>
<%@include file="common/adminNavigator.jsp" %>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">修改设置</div>
        <div class="panel-body">
            <form class="form-horizontal" method="get" id="add-form" action="update">
                <div class="form-group">
                    <c:forEach items="${configs}" var="c" varStatus="vs">
                        <c:if test="${c.name == 'website_mode'}">
                            <input type="hidden" name="id" value="${c.id}">
                            <label for="name${vs.count}" class="col-sm-2 control-label" style="margin-bottom: 10px;">${c.cname}</label>
                            <div class="col-sm-10">
                                <select id="name${vs.count}" name="value" style="margin-top: 5px;width:200px;">
                                    <option <c:if test="${c.value == '1'}">selected="selected"</c:if> value="1">模仿天猫1</option>
                                    <option <c:if test="${c.value == '2'}">selected="selected"</c:if> value="2">模仿超市2</option>
                                    <option <c:if test="${c.value == '3'}">selected="selected"</c:if> value="3">模仿京东3</option>
                                    <option <c:if test="${c.value == '4'}">selected="selected"</c:if> value="4">模仿苏宁3</option>
                                    <option <c:if test="${c.value == '5'}">selected="selected"</c:if> value="5">模板B2C商城5</option>
                                </select>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="form-group">
                    <c:forEach items="${configs}" var="c" varStatus="vs">
                        <c:if test="${c.name != 'website_mode'}">
                            <input type="hidden" name="id" value="${c.id}">
                            <label for="name${vs.count}" class="col-sm-2 control-label" style="margin-bottom: 10px;">${c.cname}</label>
                            <div class="col-sm-10" style="margin-bottom: 10px;">
                                <input type="text" class="form-control" id="name${vs.count}" name="value" placeholder="请输入${c.cname}" value="${c.value}">
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="form-group">
                    <div style="text-align: center">
                        <button type="submit" class="btn btn-success"> 保存设置 </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="common/adminFooter.jsp" %>
