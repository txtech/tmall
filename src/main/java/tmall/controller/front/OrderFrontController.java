package tmall.controller.front;

import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.core.util.UuidUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import tmall.annotation.Auth;
import tmall.common.convert.ProductConvert;
import tmall.common.enums.OrderReverseStatusEnum;
import tmall.exception.AuthException;
import tmall.exception.ParameterException;
import tmall.pojo.*;
import tmall.service.OrderRender;
import tmall.util.StringUtil;
import tmall.util.UploadFileInfo;
import tmall.util.UploadedImageFile;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.regex.Pattern;

@Auth(User.Group.user)
@Controller
@RequestMapping("/")
public class OrderFrontController extends FrontBaseController {

    /**
     * 添加购物车
     */
    @RequestMapping("addCart")
    public String addCart(Integer pid, Integer num, Model model, HttpSession session) throws Exception {
        Product product = (Product)productService.get(pid);
        User user = (User)session.getAttribute("user");
        String msg;
        //获取原来就在购物车的数据
        CartItem cartItem = (CartItem)cartItemService.getOne("uid", user.getId(), "pid", product.getId());
        Boolean isInDB = cartItem != null;
        //判断是否超出库存
        if (isInDB) {
            num += cartItem.getNumber();
        } else {
            cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setUser(user);
        }
        if (num > product.getStock()) {
            msg = "OutOfStock";
            model.addAttribute("msg", msg);
            return "403";
        }
        cartItem.setNumber(num);
        cartItem.setSum(product.getNowPrice().subtract(new BigDecimal(num)));
        if (isInDB) {
            cartItemService.update(cartItem);
        } else {
            cartItemService.add(cartItem);
        }
        msg = "success";
        model.addAttribute("msg", msg);
        return "403";
    }

    /**
     * 购物车
     */
    @RequestMapping("cart")
    public String cart(Model model, HttpSession session) throws Exception {
        User user = (User)session.getAttribute("user");
        List<CartItem> cartItems = cartItemService.list("uid", user.getId());
        model.addAttribute("cartItems", cartItems);
        return "order/cart";
    }

    /**
     * 添加购物车数量
     */
    @RequestMapping("changeCartNum")
    public String changeCartNum(Integer id, Integer num, Model model, HttpSession session) throws Exception {
        User user = (User)session.getAttribute("user");
        CartItem cartItemFromDB = (CartItem)cartItemService.get(id);
        String msg = "fail";
        checkUser(user, cartItemFromDB.getUser());
        if (cartItemFromDB.getProduct().getStock() >= num) {
            cartItemFromDB.setNumber(num);
            cartItemFromDB.setSum(cartItemFromDB.getProduct()
                .getNowPrice().subtract(new BigDecimal(num)));
            cartItemService.update(cartItemFromDB);
            msg = "success";
        }
        model.addAttribute("msg", msg);
        return "403";
    }

    /**
     * 删除购物车商品
     */
    @RequestMapping("deleteCartItem")
    public String deleteCartItem(Integer id, Model model, HttpSession session) throws Exception {
        User user = (User)session.getAttribute("user");
        CartItem cartItemFromDB = (CartItem)cartItemService.get(id);
        checkUser(user, cartItemFromDB.getUser());
        cartItemService.delete(cartItemFromDB);
        model.addAttribute("msg", "success");
        return "403";
    }

    /**
     * 添加购物车
     */
    @RequestMapping("cartNumber")
    public String cartNumber(Model model, HttpSession session) throws Exception {
        User user = (User)session.getAttribute("user");
        int number = cartItemService.list("uid", user.getId()).size();
        String msg = String.valueOf(number);
        model.addAttribute("msg", msg);
        return "403";
    }

    /**
     * 购买一个
     */
    @RequestMapping("buyOne")
    public String buyOne(Integer pid, Integer num, Model model, HttpSession session) throws Exception {
        Product product = (Product)productService.get(pid);
        User user = (User)session.getAttribute("user");
        CartItem cartItem = new CartItem();
        cartItem.setUser(user);
        cartItem.setProduct(product);
        cartItem.setNumber(num);
        cartItem.setSum(product.getNowPrice().multiply(new BigDecimal(num)));
        cartItem.setId(-1);
        session.setAttribute("tempCartItem", cartItem);
        return "redirect:buy?ciid=-1";
    }

    /**
     * 购买
     */
    @RequestMapping("buy")
    public String buy(Integer[] ciid, Model model, HttpSession session) throws Exception {
        List<CartItem> cartItems = new ArrayList<>();
        User user = (User)session.getAttribute("user");
        int totalNum = 0;
        BigDecimal sum = new BigDecimal(0);
        for (Integer id : ciid) {
            CartItem cartItem = null;
            if (id == -1) {
                //由buyOne跳转而来
                cartItem = (CartItem)session.getAttribute("tempCartItem");
            } else {
                //由购物车跳转而来
                cartItem = (CartItem)cartItemService.get(id);
            }
            // 检查
            checkUser(user, cartItem.getUser());
            ProductConvert.productConvert(Lists.newArrayList(cartItem.getProduct()));
            totalNum += cartItem.getNumber();
            sum = sum.add(cartItem.getSum());
            cartItems.add(cartItem);
        }

        Order order = (Order)orderService.getOne("uid", user.getId());
        session.setAttribute("order", order);
        session.setAttribute("cartItems", cartItems);
        model.addAttribute("totalNum", totalNum);
        model.addAttribute("sum", sum);
        return "order/buy";
    }

    /**
     * 创建订单
     */
    @RequestMapping("createOrder")
    public String createOrder(String address, String post, String receiver, String mobile, String userMessage,HttpSession session) throws Exception {
        List<CartItem> cartItems = (List<CartItem>)session.getAttribute("cartItems");
        User user = (User)session.getAttribute("user");
        Pattern pattern = Pattern.compile("1[0-9]{10}");
        if (!pattern.matcher(mobile).matches()) {
            throw new ParameterException("手机号填写错误");
        }
        Integer pid = cartItems.get(0).getProduct().getId();
        Product product = (Product)productService.get(pid);
        Integer shopId = product.getShopId();
        Order order = new Order();
        order.setAddress(address);
        order.setPost(post);
        order.setShopId(shopId);
        order.setReceiver(receiver);
        order.setMobile(mobile);
        order.setUserMessage(userMessage);
        order.setUser(user);
        orderService.createOrder(order, cartItems);
        return "redirect:pay?oid=" + order.getId();
    }

    /**
     * 支付订单
     */
    @RequestMapping("pay")
    public String pay(Integer oid, HttpSession session, Model model) throws Exception {
        User user = (User)session.getAttribute("user");
        Order order = (Order)orderService.get(oid);
        Integer shopId = order.getShopId();
        Shop shop = (Shop)shopService.get(shopId);
        checkUser(user, order.getUser());
        Product product = (Product)productService.get(order.getOrderItems().get(0).getPid());
        model.addAttribute("order", order);
        if (!StringUtils.isEmpty(product.getPayCode())) {
            model.addAttribute("payCode", product.getExtras().get("path"));
        } else if (!StringUtil.isEmpty(shop.getPayCode())) {
            model.addAttribute("payCode", shop.getPayCode());
        } else {
            model.addAttribute("payCode", "payCode.jpg");
        }
        model.addAttribute("shop", shop);
        model.addAttribute("product", product);
        //获取商品的付款编码
        return "payOrder";
    }

    /**
     * 付款
     */
    @RequestMapping("payed")
    public String payed(Integer oid, MultipartFile payRecord, HttpSession session, Model model) throws Exception {
        if (Objects.isNull(payRecord) || StringUtil.isEmpty(payRecord.getOriginalFilename())) {
            throw new ParameterException("请上传付款记录");
        }
        String payRecordfile = UuidUtil.getTimeBasedUuid().toString();
        String type = "product";
        UploadedImageFile uploadedImageFile = new UploadedImageFile();
        uploadedImageFile.setImage(payRecord);
        //fileUtil.saveImg(uploadedImageFile, type, payRecordfile);
        UploadFileInfo uploadFileInfo= fileUtil.uploadFile(uploadedImageFile,type);
        User user = (User)session.getAttribute("user");
        Order order = (Order)orderService.get(oid);
        checkUser(user, order.getUser());
        order.setStatus(Order.Status.waitConfirmPay);
        order.setPayDate(new Date());
        order.setPayRecord(uploadFileInfo.getFullPath());
        orderService.update(order);
        model.addAttribute("order", order);
        //支付成功后为代理增加商品,购买的商品必须是总代的商品；
        if(Objects.nonNull(user.getShopId())&& !Objects.equals(user.getShopId(),order.getShopId())&&order.getShopId()==1){
            orderService.addThirdShopItem(order,user.getShopId());
        }
        return "order/payed";
    }

    /**
     * 我的订单
     */
    @RequestMapping("myOrder")
    public String myOrder(HttpSession session, String status, Model model) throws Exception {
        User user = (User)session.getAttribute("user");
        if (StringUtil.isEmpty(status)) {
            status = "all";
        }
        model.addAttribute("status", status);
        if (Objects.nonNull(status) && Objects.equals(status, "all")) {
            status = null;
        }
        List<Order> orders = orderService.list("uid", user.getId(), "status", status, "depth", 3);
        orders.forEach(order -> {
            try {
                Shop shop=(Shop) shopService.get(order.getShopId());
                order.setShopName(shop.getShopName());
            } catch (Exception e) {
                e.printStackTrace();
            }
            order.getOrderItems().stream().forEach(orderItem -> {
                ProductConvert.productConvert(Lists.newArrayList(orderItem.getProduct()));
            });
            OrderRender.render(order);
        });
        model.addAttribute("orders", orders);
        return "order/myOrder";
    }

    /**
     * 发货
     */
    @RequestMapping("deliver")
    public String deliver(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid);
        User user = (User)session.getAttribute("user");
        checkUser(user, order.getUser());
        order.setStatus(Order.Status.waitConfirm);
        order.setDeliverDate(new Date());
        orderService.update(order);
        return "order/myOrder";
    }

    /**
     * 确认支付
     */
    @RequestMapping("confirmPay")
    public String confirmPay(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid, 3);
        User user = (User)session.getAttribute("user");
        checkUser(user, order.getUser());
        model.addAttribute("order", order);
        return "order/confirmPay";
    }

    /**
     * 确认付款
     */
    @RequestMapping("confirmed")
    public String confirmed(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid);
        User user = (User)session.getAttribute("user");
        checkUser(user, order.getUser());
        order.setStatus(Order.Status.waitComment);
        order.setConfirmDate(new Date());
        orderService.update(order);
        model.addAttribute("order", order);
        return "order/confirmed";
    }

    /**
     * 取消
     */
    @RequestMapping("cancel")
    public String cancel(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid);
        User user = (User)session.getAttribute("user");
        checkUser(user, order.getUser());
        order.setReverseStatus(OrderReverseStatusEnum.REVERSE_STATUS_CANCELLED.name());
        order.setConfirmDate(new Date());
        orderService.update(order);
        model.addAttribute("order", order);
        return "order/myOrder";
    }

    /**
     * 退货
     */
    @RequestMapping("applyAfter")
    public String applyReturn(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid, 3);
        User user = (User)session.getAttribute("user");
        checkUser(user, order.getUser());
        model.addAttribute("order", order);
        return "order/applyReturn";
    }

    /**
     * 发货
     */
    @RequestMapping("afterInit")
    public String returnInit(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid);
        User user = (User)session.getAttribute("user");
        checkUser(user, order.getUser());
        order.setReverseStatus(OrderReverseStatusEnum.REVERSE_STATUS_AFTER_SALE_PENDING.name());
        order.setConfirmDate(new Date());
        orderService.update(order);
        model.addAttribute("order", order);
        return "order/myOrder";
    }

    /**
     * 关闭
     */
    @RequestMapping("afterClose")
    public String afterClose(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid);
        User user = (User)session.getAttribute("user");
        checkUser(user, order.getUser());
        order.setReverseStatus(OrderReverseStatusEnum.REVERSE_STATUS_CLOSED.name());
        order.setConfirmDate(new Date());
        orderService.update(order);
        model.addAttribute("order", order);
        return "order/myOrder";
    }

    /**
     * 完成
     */
    @RequestMapping("afterFinish")
    public String afterFinish(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid);
        User user = (User)session.getAttribute("user");
        checkUser(user, order.getUser());
        order.setReverseStatus(OrderReverseStatusEnum.REVERSE_STATUS_ALL_AFTER_SALED.name());
        order.setConfirmDate(new Date());
        orderService.update(order);
        model.addAttribute("order", order);
        return "order/myOrder";
    }

    /**
     * 删除
     */
    @RequestMapping("deleteOrder")
    @ResponseBody
    public String deleteOrder(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order)orderService.get(oid);
        User user = (User)session.getAttribute("user");
        String msg = "fail";
        checkUser(user, order.getUser());
        order.setStatus(Order.Status.deleted);
        order.setDeliverDate(new Date());
        orderService.update(order);
        msg = "success";
        return msg;

    }

    /**
     * 评论
     */
    @RequestMapping("comment")
    public String comment(Integer oiid, HttpSession session, Model model) throws Exception {
        OrderItem orderItem = (OrderItem)orderItemService.get(oiid);
        User user = (User)session.getAttribute("user");
        checkUser(user, orderItem.getOrder().getUser());
        model.addAttribute("orderItem", orderItem);
        return "product/comment";
    }

    /**
     * 添加评论
     */
    @RequestMapping("addComment")
    public String addComment(Integer oiid, Comment comment, HttpSession session, Model model) throws Exception {
        OrderItem orderItem = (OrderItem)orderItemService.get(oiid);
        User user = (User)session.getAttribute("user");
        checkUser(user, orderItem.getOrder().getUser());
        comment.setProduct(orderItem.getProduct());
        comment.setUser(user);
        comment.setCreateDate(new Date());
        commentService.add(comment);
        orderItem.setComment(comment);
        orderItemService.update(orderItem);
        Product product = orderItem.getProduct();
        product.setCommentCount(product.getCommentCount() + 1);
        productService.update(product);
        Order orderNew = (Order)orderService.get(orderItem.getOrder().getId());
        if (commentService.checkFinishComment(orderNew)) {
            orderNew.setStatus(Order.Status.finish);
            orderService.update(orderNew);
        }
        return "order/myOrder";
    }

    /**
     * 验证
     */
    private void checkUser(User user1, User user2) throws AuthException {
        if (!user1.getId().equals(user2.getId())) {
            throw new AuthException("非法访问，没有权限");
        }
    }
}
