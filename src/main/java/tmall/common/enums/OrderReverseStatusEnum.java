package tmall.common.enums;

import lombok.Getter;

/**
 * @author bernie
 * @date 2021/1/14
 */
public enum OrderReverseStatusEnum {
    /**
     * 初始化状态
     */
    REVERSE_STATUS_INIT(100, "init", "售后初始化"),
    /**
     * 关闭订单状态
     */
    REVERSE_STATUS_CLOSED(500, "closed", "已关闭"),

    /**
     * 取消订单
     */
    REVERSE_STATUS_CANCELLED(502,"cancelled", "已取消"),



    /**
     *售后逆向申请中
     */
    REVERSE_STATUS_AFTER_SALE_PENDING(400, "aftersale_pending", "售后申请中"),
    /**
     *售后逆向完结
     */
    REVERSE_STATUS_ALL_AFTER_SALED(400, "aftersaled", "售后完结");

    @Getter
    private int code;
    private String desc;

    @Getter
    private String zhDesc;

    OrderReverseStatusEnum(int code, String desc, String zhDesc) {
        this.code = code;
        this.desc = desc;
        this.zhDesc = zhDesc;
    }


}
