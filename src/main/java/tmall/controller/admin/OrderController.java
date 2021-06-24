package tmall.controller.admin;

import com.google.common.collect.Lists;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import tmall.annotation.Auth;
import tmall.common.convert.ProductConvert;
import tmall.common.enums.OrderReverseStatusEnum;
import tmall.pojo.Order;
import tmall.pojo.Product;
import tmall.pojo.ProductImage;
import tmall.pojo.User;
import tmall.util.Pagination;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/order")
public class OrderController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination, HttpSession session) throws Exception {

        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.
                list("shopId",user.getShopId(),"pagination", pagination, "depth", 3);

        if(!CollectionUtils.isEmpty(orders)){
            orders.stream().forEach(order -> {
                order.getOrderItems().stream().forEach(orderItem -> {
                    ProductConvert.productConvert(Lists.newArrayList(orderItem.getProduct()));
                });
            });
        }
        model.addAttribute("orders", orders);
        return "admin/listOrder";
    }

    @Auth(User.Group.admin)
    @RequestMapping("deliver")
    public String list(Integer oid) throws Exception {
        Order order = (Order) orderService.get(oid);
        order.setStatus(Order.Status.waitConfirm);
        order.setDeliverDate(new Date());
        orderService.update(order);
        return "redirect:list";
    }

    @Auth(User.Group.admin)
    @RequestMapping("waitConfirmPay")
    public String waitConfirmPay(Integer oid, MultipartFile payRecord, HttpSession session, Model model) throws Exception{

        Order order = (Order)orderService.get(oid);
        //检验状态订单的状态
        //Order order=new Order();
        //order.setId(oid);
        order.setStatus(Order.Status.waitDeliver);
        orderService.update(order);
        return "redirect:list";
    }

    @Auth(User.Group.admin)
    @RequestMapping("refund")
    public String refund(Integer oid) throws Exception {
        Order order = (Order) orderService.get(oid);
        order.setReverseStatus(OrderReverseStatusEnum.REVERSE_STATUS_ALL_AFTER_SALED.name());
        order.setDeliverDate(new Date());
        orderService.update(order);
        return "redirect:list";
    }


}