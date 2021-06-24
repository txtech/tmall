package tmall.test;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tmall.pojo.Shop;
import tmall.service.ProductService;
import tmall.service.ShopService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
@Slf4j
public class ShopTest extends AbstractJUnit4SpringContextTests {

    @Autowired
    ShopService shopService;

    @Test
    public void saveShop()throws  Exception{
        Shop shop=new Shop();
        shop.setShopName("test2wer34");
        shop.setStatus("init");
        shopService.add(shop);
    }
    @Test
    public void list()throws  Exception{
       List<Shop> shopList=shopService.list();
       System.out.println(JSONObject.toJSON(shopList));
       log.info("size={}",shopList.size());
    }
}
