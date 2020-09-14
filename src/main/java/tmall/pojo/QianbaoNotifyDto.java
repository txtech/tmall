package tmall.pojo;

/**
 * @author Pepsi
 * @create 2020-02-24 14:52
 * @desc
 * @copyright vcgroup.cn
 */
public class QianbaoNotifyDto extends QianbaoCommonRespDto {

    private String productId;//产品ID
    private String orderNo;//订单号
    private String orderAmount;//订单金额
    private String orderDate;//订单日期
    private String balance;//商户余额
    private String instOrderNo;//钱宝订单号
    private String realAmount;//实收金额(为NULL时，实收金额取订单金额即可)

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(String orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public String getInstOrderNo() {
        return instOrderNo;
    }

    public void setInstOrderNo(String instOrderNo) {
        this.instOrderNo = instOrderNo;
    }

    public String getRealAmount() {
        return realAmount;
    }

    public void setRealAmount(String realAmount) {
        this.realAmount = realAmount;
    }
}
