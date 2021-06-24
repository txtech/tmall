<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<c:set var="title" value="订单管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="3"/>
<%@include file="common/adminNavigator.jsp" %>
<div class="container" >
    <ol class="breadcrumb">
        <li>订单管理</li>
    </ol>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">订单号</th>
            <th scope="col">状态</th>
            <th scope="col">订单金额</th>
            <th scope="col">商品数量</th>
            <th scope="col">买家名称</th>
            <th scope="col">创建时间</th>
            <th scope="col">支付时间</th>
            <th scope="col">发货时间</th>
            <th scope="col">确认收货时间</th>
            <th scope="col" width="120px">操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${orders}" var="o" varStatus="vs">
            <tr>
                <th scope="row">${o.orderCode}</th>
                <td>${o.statusText}</td>
                <td>${o.sum}</td>
                <td>${o.totalNumber}</td>
                <td>${o.user.name}</td>
                <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${o.deliverDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td>
                    <button class="btn btn-primary btn-xs detail-btn">查看详情</button>

                    <c:if test="${o.statusEnum == 'waitConfirmPay' && o.reverseStatus != 'REVERSE_STATUS_ALL_AFTER_SALED'}">
                        <a href="waitConfirmPay?oid=${o.id}">
                            <button class="btn btn-primary btn-xs">确认收款</button>
                        </a>
                    </c:if>

                    <c:if test="${o.statusEnum == 'waitDeliver' && o.reverseStatus != 'REVERSE_STATUS_ALL_AFTER_SALED'}">
                        <a href="deliver?oid=${o.id}">
                            <button class="btn btn-primary btn-xs">发货</button>
                        </a>
                    </c:if>


                    <c:if test="${o.reverseStatus == 'REVERSE_STATUS_AFTER_SALE_PENDING'}">
                        <a href="refund?oid=${o.id}">
                            <button class="btn btn-primary btn-xs">同意退款</button>
                            <%--&nbsp;&nbsp;--%>
                            <%--<button class="btn btn-primary btn-xs">拒绝退款</button>--%>
                        </a>
                    </c:if>

                </td>
            </tr>
            <tr  style="display: none">
                <td colspan="10" >
                    <div class="panel panel-default" style="width: 600px;margin:0 auto">
                        <div class="panel-heading">订单详情</div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <c:forEach items="${o.orderItems}" var="item" varStatus="vs">
                                <tr>
                                    <td><img width="40px" height="40px" src="${item.product.homeImage}"></td>
                                    <td>${item.product.name}</td>
                                    <td>${item.number}个</td>
                                    <td>单价${item.product.nowPrice}元</td>
                                </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="4">收货人:${o.receiver} 电话:${o.mobile} 地址:${o.address} 邮编:${o.post} </td>
                                </tr>
                                <c:if test="${!empty o.payRecord}">
                                    <tr>
                                        <td>付款码</td>
                                        <td colspan="3"><img src="${o.payRecord}" height="600px"> </td>
                                    </tr>
                                </c:if>

                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="common/adminPage.jsp" %>

<%@include file="common/adminFooter.jsp" %>

