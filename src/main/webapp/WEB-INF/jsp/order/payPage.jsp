<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main class="pay-page">
    <div class="pay-tip">扫一扫付款</div>
    <div class="pay-num">￥${order.sum}</div>
    <img src="${shop.payCode}" class="alipay-img" width="350px" height="600px">
    <form action="payed" method="post" id="payForm" enctype="multipart/form-data">
        <table class="register-table">
            <tbody>
            <tr>
                <td class="left-col" style="width: 190px;height: 40px;line-height: 40px;display: block; text-align: right;">请上传转账记录：</td>
                <td class="right-col td1">
                    <input type="hidden" name="oid" value="${order.id}">
                    <input id="payRecord" type="file" name="payRecord" class="file">
                </td>
            </tr>
            <tr>
                <td colspan="2" class="button-td">
                    <input type="hidden" name="refer" id="refer">
                    <button type="submit">提 交</button>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</main>
