package tmall.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.annotations.JsonAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.ProductMapper;
import tmall.pojo.Product;
import tmall.pojo.ProductExample;
import tmall.pojo.base.BasePOJO;
import tmall.service.CommentService;
import tmall.service.OrderItemService;
import tmall.service.OrderService;
import tmall.service.ProductService;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl extends BaseServiceImpl<ProductMapper, ProductExample> implements ProductService {

    @Override
    public void update(BasePOJO object) throws Exception {
        Product product = (Product)object;
        Map map = product.getExtras();
        product.setExtraJson(JSONObject.toJSONString(map));
        super.update(object);
    }

    @Override
    public Integer add(BasePOJO object) throws Exception {
        Product product = (Product)object;
        Map map = product.getExtras();
        product.setExtraJson(JSONObject.toJSONString(map));
        return super.add(object);
    }
}