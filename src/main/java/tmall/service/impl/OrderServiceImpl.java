package tmall.service.impl;

import com.google.common.base.Throwables;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tmall.common.enums.OrderReverseStatusEnum;
import tmall.mapper.OrderMapper;
import tmall.pojo.*;
import tmall.service.*;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class OrderServiceImpl extends BaseServiceImpl<OrderMapper, OrderExample>
    implements OrderService {
    @Autowired
    private CartItemService cartItemService;
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private ProductService productService;
    @Autowired
    private PropertyValueService propertyValueService;

    @Autowired
    private ProductImageService productImageService;

    @Override
    public void createOrder(Order order, List<CartItem> cartItems) throws Exception {
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date()) + RandomUtils.nextInt();
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setStatus(Order.Status.waitPay);
        order.setReverseStatus(OrderReverseStatusEnum.REVERSE_STATUS_INIT.name());
        BigDecimal sum = new BigDecimal(0);
        int totalNumber = 0;
        for (CartItem item : cartItems) {
            sum = sum.add(item.getSum());
            totalNumber++;
        }
        order.setSum(sum);
        order.setTotalNumber(totalNumber);
        add(order);
        for (CartItem item : cartItems) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setNumber(item.getNumber());
            orderItem.setProduct(item.getProduct());
            orderItem.setSum(item.getSum());
            if (item.getId() > 0) {
                cartItemService.delete(item);
            }
            Product product = orderItem.getProduct();
            product.setStock(product.getStock() - item.getNumber());
            product.setSaleCount(product.getSaleCount() + 1);
            productService.update(product);
            orderItemService.add(orderItem);
        }

    }

    @Override
    public void addThirdShopItem(Order order, Integer shopId) {

        try {
            List<OrderItem> orderItemList = order.getOrderItems();
            OrderItem orderItem=orderItemList.get(0);

            //先查询当前店铺下有没有这个商品，没有增加，有的话就更新库存

            Product product = (Product)productService.get(orderItemList.get(0).getPid());

            List<Product> productList= productService.list("shopId",shopId,"parentId",product.getId());
            if(CollectionUtils.isEmpty(productList)){
                Integer originProductId=product.getId();
                product.setId(null);
                product.setExtraJson(null);
                product.setShopId(shopId);
                product.setSaleCount(0);
                product.setStock(orderItem.getNumber());
                product.setParentId(originProductId);
                product.setCommentCount(0);
                Integer resultRow = productService.add(product);
                Integer newProductId=product.getId();

                if (resultRow > 0) {
                    List<ProductImage> productImageList = product.getProductImages();
                    if (!CollectionUtils.isEmpty(productImageList)) {
                        for (ProductImage image : productImageList) {
                            image.setProduct(null);
                            image.setId(null);
                            image.setPid(product.getId());
                            productImageService.add(image);
                        }
                    }
                    List<PropertyValue> pvList = propertyValueService.list("pid", originProductId);
                    if (!CollectionUtils.isEmpty(pvList)) {
                        for (PropertyValue pv : pvList) {
                            PropertyValue newValue=new PropertyValue();
                            newValue.setPid(newProductId);
                            newValue.setValue(pv.getValue());
                            newValue.setPtid(pv.getPtid());
                            newValue.setDeleteAt(pv.getDeleteAt());
                            propertyValueService.add(newValue);
                        }
                    }
                }
            }else{
                //更新库存
               Product updateProduct= productList.get(0);
               updateProduct.setStock(updateProduct.getStock()+orderItem.getNumber());
               productService.update(updateProduct);
            }
        } catch (Exception e) {
            log.error("addThirdItem={}", Throwables.getStackTraceAsString(e));
        }

    }
}