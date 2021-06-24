package tmall.service;

import tmall.common.enums.OrderReverseStatusEnum;
import tmall.pojo.Order;
import tmall.pojo.OrderOperationDto;
import tmall.util.StringUtil;

import java.util.Objects;

/**
 * @author bernie
 * @date 2021/1/16
 */
public class OrderRender {

    public static void render(Order order) {
        OrderOperationDto orderOperationDto = new OrderOperationDto();
        order.setOperationDto(orderOperationDto);
        renderStatusDesc(order);
        renderOperator(order);
    }

    /**
     * 允许的操作
     * @param order
     */
    private static void renderOperator(Order order) {
        String orderStatus = order.getStatus();
        String reverseStatus = order.getReverseStatus();


        if (!StringUtil.isEmpty(orderStatus)) {
            if (!Objects.equals(orderStatus, Order.Status.waitPay.name()) && !Objects.equals(orderStatus,
                Order.Status.deleted.name())) {
                if (!StringUtil.isEmpty(reverseStatus) && Objects.equals(reverseStatus,
                    OrderReverseStatusEnum.REVERSE_STATUS_INIT.name())) {
                    order.getOperationDto().setCanApplyReturn(Boolean.TRUE);
                }
                if (!StringUtil.isEmpty(reverseStatus) && Objects.equals(reverseStatus,
                    OrderReverseStatusEnum.REVERSE_STATUS_AFTER_SALE_PENDING.name())) {
                    order.getOperationDto().setCanCancelReturn(Boolean.TRUE);
                }
            }
        }
    }

    /**
     * 订单描述
     * @param order
     */
    private static void renderStatusDesc(Order order) {
        String reverseStatus = order.getReverseStatus();
        if (
            StringUtil.isEmpty(reverseStatus) ||
            Objects.equals(reverseStatus, OrderReverseStatusEnum.REVERSE_STATUS_INIT.name()) ||
            Objects.equals(reverseStatus, OrderReverseStatusEnum.REVERSE_STATUS_CLOSED.name()) ||
            Objects.equals(reverseStatus, OrderReverseStatusEnum.REVERSE_STATUS_CANCELLED.name())
        ) {
            order.getOperationDto().setOrderStatus(order.getStatusEnum().getName());
            return;
        }

        for (OrderReverseStatusEnum reverseStatusEnum : OrderReverseStatusEnum.values()) {
            if (Objects.equals(reverseStatusEnum.name(), reverseStatus)) {
                order.getOperationDto().setOrderStatus(reverseStatusEnum.getZhDesc());
                return;
            }

        }
    }
}
