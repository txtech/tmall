<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script>
    var deleteOid = -1;
    $(function () {
        $(".order-type a").click(function () {
            var orderStatus = $(this).attr("order-status");
            if('all'===orderStatus){
                $("table[order-status]").show();
            }else{
                $("table[order-status]").hide();
                $("table[order-status="+orderStatus+"]").show();
            }
            $(".order-type div").removeClass("selected");
            $(this).parent("div").addClass("selected");

        });
        $(".delete-button").click(function () {
            deleteOid = $(this).attr("oid");
            $("#confirmModal").modal('show');
        });
        $("#confirmDelete").click(function () {
            $("#confirmModal").modal("hide");
            var page = "deleteOrder";
            $.get(page,{"oid":deleteOid},function (result) {
                alert(result);
                if(result == "success"){
                    location.reload();
                }else{
                    alert("服务器错误，取消失败");
                }
            });
        });
        $("#cancelDelete").click(function () {
            $("#confirmModal").modal("hide");
        });
    });
</script>

<section class="order-type">
    <div <c:if test="${status=='all'}">class="selected"</c:if> ><a href="/myOrder" order-status="all">所有订单</a></div>
    <div <c:if test="${status=='waitPay'}">class="selected"</c:if>><a href="/myOrder?status=waitPay" order-status="waitPay">待付款</a></div>
    <div <c:if test="${status=='waitDeliver' || status=='waitConfirmPay'}">class="selected"</c:if>><a href="/myOrder?status=waitDeliver" order-status="waitDelivery">待发货</a></div>
    <div <c:if test="${status=='waitConfirm'}">class="selected"</c:if>><a href="/myOrder?status=waitConfirm" order-status="waitConfirm">待确认</a></div>
    <div <c:if test="${status=='waitComment'}">class="selected"</c:if>><a href="/myOrder?status=waitComment" order-status="waitComment">待评价</a></div>
    <div <c:if test="${status=='finish'}">class="selected"</c:if>><a href="/myOrder?status=finish" order-status="waitComment">已完成</a></div>
</section>

<main class="order-list">
    <table class="head-table">
        <thead>
        <th >宝贝</th>
        <th width="100px">商家名称</th>
        <th width="100px">单价</th>
        <th width="100px">数量</th>
        <th width="100px">状态</th>
        <th width="150px">实付款</th>
        <th width="120px">操作</th>
        </thead>
    </table>

    <c:forEach items="${orders}" var="o" varStatus="vs">
    <table class="line-table" order-status="${o.status}" oid="${o.id}">
        <tr class="item-head">
            <td colspan="7" class="time-and-order">
                <b><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></b>
                <span>订单号: ${o.orderCode}</span>
            </td>
        </tr>
        <c:forEach items="${o.orderItems}" var="oi" varStatus="vs2">
        <tr class="item-body">
            <td width="100px">
                <img src="${oi.product.homeImage}" class="cart-item-jpg">
            </td>
            <td class="item-name">
                <a class="cart-item-title" href="product?id=${oi.product.id}">${oi.product.name}</a>
                <div class="cart-item-title-bottom">
                    <img title="保障卡" src="img/baozhang.png">
                </div>
            </td>
            <td width="100px" class="num-center border-left">
                <span class="order-item-num">${o.shopName}</span>
            </td>
            <td width="100px" class="num-center border-left">
                <span class="cart-item-old-price">￥${oi.product.originalPrice}</span>
                <span class="cart-item-now-price">￥${oi.product.nowPrice}</span>
            </td>
            <td width="100px" class="num-center border-left">
                <span class="order-item-num">${oi.number}</span>
            </td>

            <c:if test="${vs2.count==1}">
                <td class="pnum-center border-left" width="100px" rowspan="${o.totalNumber}">
                    <span class="order-item-sum">${o.operationDto.orderStatus}</span>
                </td>
            </c:if>

            <c:if test="${vs2.count==1}">
            <td class="num-center border-left" width="150px" rowspan="${o.totalNumber}">
                <span class="order-item-sum">￥${o.sum}</span>
                <span class="freight">(含运费：￥0.00)</span>
            </td>
            </c:if>


            <c:if test="${vs2.count==1 && o.status!='waitComment' }">
            <td class="num-center border-left" width="120px" rowspan="${o.totalNumber}">

                <c:if test="${o.status=='waitConfirmPay' && o.reverseStatus=='REVERSE_STATUS_INIT' }">

                    <c:if test="${o.operationDto.canApplyReturn}">
                        <a href="applyAfter?oid=${o.id}" class="order-button blue">申请退款</a>
                    </c:if>

                </c:if>


                <c:if test="${o.status=='waitConfirm' && o.reverseStatus=='REVERSE_STATUS_INIT' }">
                    <a href="confirmPay?oid=${o.id}" class="order-button blue">确认收货</a>
                    &nbsp;&nbsp; &nbsp;
                    <c:if test="${o.operationDto.canApplyReturn}">
                        <a href="applyAfter?oid=${o.id}" class="order-button blue">申请退款</a>
                    </c:if>

                </c:if>
                <c:if test="${o.status=='waitPay' }">
                    <a href="pay?oid=${o.id}" class="order-button blue">付款</a>
                    <a href="#nowhere" class="delete-button gray" oid="${o.id}">取消</a>
                </c:if>

                <c:if test="${o.status=='waitDeliver' }">
                    <%--<a href="#nowhere" class="order-button white">待发货</a>--%>
                    <%--&nbsp;&nbsp; &nbsp;--%>
                    <c:if test="${o.operationDto.canApplyReturn}">
                        <a href="applyAfter?oid=${o.id}" class="order-button blue">申请退款</a>
                    </c:if>
                </c:if>
                <c:if test="${o.status=='finish' }">
                    <%--<a href="#nowhere" class="order-button white">完成订单</a>--%>
                    <%--&nbsp;&nbsp; &nbsp;--%>
                    <c:if test="${o.operationDto.canApplyReturn}">
                        <a href="applyAfter?oid=${o.id}" class="order-button blue">申请退款</a>
                    </c:if>
                </c:if>

                <c:if test="${o.operationDto.canCancelReturn}">
                    <a href="cancel?oid=${o.id}" class="order-button blue">取消退款</a>
                </c:if>
            </td>
            </c:if>


            <c:if test="${o.status=='waitComment' && (empty oi.comment)}">
                <td width="120px" >
                    <a href="comment?oiid=${oi.id}" class="order-button white">评价</a>
                    &nbsp;&nbsp; &nbsp;
                    <c:if test="${o.operationDto.canApplyReturn}">
                        <a href="applyAfter?oid=${o.id}" class="order-button blue">申请退款</a>
                    </c:if>
                </td>
            </c:if>
        </tr>
        </c:forEach>
    </table>
    </c:forEach>
    <div class="modal" tabindex="-1" role="dialog" id="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-title">取消订单</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                <div class="confirm-content">确认要取消该订单吗？</div>
                <div class="button-group">
                    <button class="yes" id="confirmDelete">确定</button>
                    <button class="no" id="cancelDelete">取消</button>
                </div>
            </div>
        </div>
    </div>
</main>
