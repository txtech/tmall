<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    request.setAttribute("contextPath", contextPath);
%>

<nav class="navbar navbar-default clearfix">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">商城后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="${light==1?'active':''}"><a  href="/admin/category/list">分类管理</a></li>
                <li class="${light==3?'active':''}"><a href="${contextPath}/admin/order/list">订单管理</a></li>
               <c:if test="${user.group=='superAdmin'}">
                <li class="${light==2?'active':''}"><a  href="/admin/user/list">用户管理</a></li>
                <li class="${light==4?'active':''}"><a href="/admin/config/edit">网站设置</a></li>
               </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class=""><a href="/" target="_blank" >网站前台</a></li>
            </ul>
        </div>
    </div>
</nav>
