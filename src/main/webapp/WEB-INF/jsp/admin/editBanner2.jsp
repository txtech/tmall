<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="banner设置"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="5"/>
<%@include file="common/adminNavigator.jsp" %>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">修改首页banner</div>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="add-form" action="update" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${config.id}">
                <div class="form-group">
                    <label for="cname" class="col-sm-2 control-label">名称</label>
                    <div class="col-sm-10">
                        <input type="text" readonly="readonly" class="form-control" id="cname" name="cname" placeholder="请输入分类名字" value="${config.cname}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="file" class="col-sm-2 control-label">图片文件</label>
                    <div class="col-sm-10">
                        <input id="file" name="image" type="file" class="file" accept="image/*">
                    </div>
                </div>

                <div class="form-group">
                    <div style="text-align: center">
                        <button type="submit" class="btn btn-success">保存banner</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="common/adminFooter.jsp" %>
