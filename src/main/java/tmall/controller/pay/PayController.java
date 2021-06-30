package tmall.controller.pay;

import com.github.pagehelper.util.StringUtil;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import tmall.controller.front.FrontBaseController;
import tmall.pojo.CartItem;
import tmall.pojo.Order;
import tmall.pojo.User;
import tmall.service.ConfigService;
import tmall.util.RsaUtils;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lucas
 * @Title:
 * @Package
 * @Description:
 * @date 2020-08-1116:18
 */
@Controller
public class PayController  extends FrontBaseController {

    @Autowired
    ConfigService configService;

    private final static String QB_URL = "https://ipay.fortunebill.com/mas/cashier.do";

    /**
     * 跳转钱宝充值界面
     */
    @RequestMapping("bank-qb")
    @ResponseBody
    public Object bankQb(String address, String post, String receiver,
                         String mobile,String userMessage,String orderNo, String money, String goodsName, String returnUrl,
                         RedirectAttributes attributes, HttpSession session) throws Exception {
        //String privateKey = PathUtil.QB_PAY_KEY.get(hpMerCode);
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        User user = (User) session.getAttribute("user");
        Order order = new Order();
        order.setAddress(address);
        order.setPost(post);
        order.setReceiver(receiver);
        order.setMobile(mobile);
        order.setUserMessage(userMessage);
        order.setUser(user);
        orderService.createOrder(order, cartItems);

        String hpMerCode ="";
        String privateKey = "";
        if (privateKey == null) {
            return "FAILED";
        }
        if (StringUtil.isEmpty(goodsName)) {
            goodsName = "商品";
        }
        String notifyUrl = null;
        if (!StringUtil.isEmpty(returnUrl)) {
            returnUrl = returnUrl + "/callback/return";
            notifyUrl = returnUrl + "/callback/notify";
        }
        Map<String, String> map = cashier(orderNo, money, goodsName, hpMerCode, returnUrl, notifyUrl, privateKey);
        attributes.addAllAttributes(map);
        return new RedirectView(QB_URL);
    }

    /**
     * 钱宝收银台
     * @param orderNo
     * @param money
     * @throws Exception
     */
    private Map<String, String> cashier(String orderNo, String money, String goodsName,String svMerchNo, String returnUrl,String notifyUrl,String privateKey) throws Exception{
        Map<String, String> map = new HashMap<>();
        map.put("Name", "B2CPayment");
        map.put("Version", "V1.0");
        map.put("Charset", "UTF-8");
        map.put("MsgSender", svMerchNo);
        map.put("SendTime", DateFormatUtils.format(new Date(), "yyyyMMddHHmmss"));
        map.put("OrderNo", orderNo);
        map.put("OrderAmount", new BigDecimal(money).multiply(new BigDecimal(100)).intValue()+"");//钱宝单位为分
        map.put("OrderTime", DateFormatUtils.format(new Date(), "yyyyMMddHHmmss"));
        map.put("PayType", "PT001");
        map.put("PageUrl", returnUrl);
        map.put("NotifyUrl", notifyUrl);
        map.put("ProductName", goodsName);
        map.put("SignType", "RSA2");
        map.put("SignMsg", RsaUtils.sign(map, privateKey, "RSA2"));
        map.put("PayerMobileNo", "13111111111");
        return map;
    }
}
