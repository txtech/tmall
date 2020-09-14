package tmall.controller.pay;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tmall.exception.QianbaoCallbackException;
import tmall.pojo.Order;
import tmall.pojo.QianbaoNotifyDto;
import tmall.service.OrderService;
import tmall.util.RsaUtils;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

/**
 * @author Pepsi
 * @create 2020-08-11 18:00
 * @desc
 * @copyright vcgroup.cn
 */
@RestController
@RequestMapping("callback")
public class CallbackController {

    private final static Logger logger = LoggerFactory.getLogger(CallbackController.class);

    @Autowired
    private OrderService orderService;

    private final static String svPublicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApnEowQA23P2s0x1I6pj+" +
            "TOY1GjlrUsjDEPbgFrljmqW/QfMNkY9+DE7FeF+/Fu1ZFl+/Rht5HatTDxh03IPK" +
            "muIK8JWaNw985KkVmufi/YN1q1KcQwSUvtaJt7auZvesf8WCDma1DiuMPZSkciDp" +
            "OgzpQnkVERmvyhD8PLOqPVfV3XXI1WrVip/4Yd1KqA6Vr9IIYqs6J++eQnd4b38s" +
            "Xi00V0djw7fyx3mMDPXV6n1L1h9hQHcsMEEP/LuLX3xKXM5Ty09G7PPB6cE1qGFS" +
            "/dHs12s7agdV4ymeM1nwG0oAHVu2Dx+qxKLmxML+V0y+LZ3njI7Od4A9rBZuyYRO" +
            "LQIDAQAB";

    /**
     * 钱宝充值回调
     *
     * @param notifyDto
     * @param request
     * @return
     */
    @RequestMapping("notify")
    public Object notify(QianbaoNotifyDto notifyDto, HttpServletRequest request) throws Exception {
        logger.info("钱宝充值回调, 参数:{}", JSONObject.toJSONString(notifyDto));
        if (StringUtils.isEmpty(notifyDto.getOrderNo())) {
            logger.error("钱宝充值回调异常, 订单号:{}, 原因:无订单号字段", notifyDto.getOrderNo());
            return "FAILED";
        }
        Order select = new Order();
        select.setOrderCode(notifyDto.getOrderNo());
        Order order = (Order) orderService.getOne(select);
        if (order == null) {
            logger.error("钱宝充值回调异常, 订单号:{}, 原因:订单不存在", notifyDto.getOrderNo());
            throw new QianbaoCallbackException();
        }
        if (order.getPayDate() != null) {
//            logger.info("钱宝充值回调,订单号:{}, 原因:支付时间已存在", notifyDto.getOrderNo());
//            throw new QianbaoCallbackException();
            return "OK";
        }
        Map reqMap = BeanUtil.beanToMap(notifyDto);
        if (RsaUtils.verify(reqMap, svPublicKey, notifyDto.getSignType(), notifyDto.getDigest())) {
            //验签成功
            if (notifyDto.getResultCode().equals("0000")) {
                //交易成功
                if (order.getSum().multiply(new BigDecimal(100)).compareTo(new BigDecimal(notifyDto.getOrderAmount())) != 0) {
                    logger.error("钱宝充值回调异常, 订单号:{}, 原因:订单金额不匹配", order.getOrderCode());
                    throw new QianbaoCallbackException();
                }
                order.setPayDate(new Date());
                order.setStatus(Order.Status.waitDeliver);
                orderService.update(order);
                return "OK";
            }
        }
        return "FAILED";
    }

    /**
     * 钱宝充值回调
     *
     * @param notifyDto
     * @param request
     * @return
     */
    @RequestMapping("return")
    public Object returnMethod(QianbaoNotifyDto notifyDto, HttpServletRequest request) throws Exception {
        logger.info("钱宝充值同步响应回调, 参数:{}", JSONObject.toJSONString(notifyDto));
        if (StringUtils.isEmpty(notifyDto.getOrderNo())) {
            logger.error("钱宝充值回调异常, 订单号:{}, 原因:无订单号字段", notifyDto.getOrderNo());
            return "FAILED";
        }
        Order select = new Order();
        select.setOrderCode(notifyDto.getOrderNo());
        Order order = (Order) orderService.getOne(select);
        if (order == null) {
            logger.error("钱宝充值回调异常, 订单号:{}, 原因:订单不存在", notifyDto.getOrderNo());
            throw new QianbaoCallbackException();
        }
        if (order.getPayDate() != null) {
            return "OK";
//            logger.info("钱宝充值回调,订单号:{}, 原因:支付时间已存在", notifyDto.getOrderNo());
//            throw new QianbaoCallbackException();
        }
        Map reqMap = BeanUtil.beanToMap(notifyDto);
        if (RsaUtils.verify(reqMap, svPublicKey, notifyDto.getSignType(), notifyDto.getDigest())) {
            //验签成功
            if (notifyDto.getResultCode().equals("0000")) {
                //交易成功
                //TODO: 更新订单
                if (order.getSum().multiply(new BigDecimal(100)).compareTo(new BigDecimal(notifyDto.getOrderAmount())) != 0) {
                    logger.error("钱宝充值回调异常, 订单号:{}, 原因:订单金额不匹配", order.getOrderCode());
                    throw new QianbaoCallbackException();
                }
                order.setPayDate(new Date());
                order.setStatus(Order.Status.waitDeliver);
                orderService.update(order);
                return "OK";
            }
        }
        return "FAILED";
    }
}
