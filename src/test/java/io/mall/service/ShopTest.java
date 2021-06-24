package java.io.mall.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tmall.pojo.Shop;
import tmall.service.ShopService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ShopTest extends AbstractJUnit4SpringContextTests {

    @Autowired
    ShopService shopService;

    @Test
    public void saveShop()throws  Exception{
        Shop shop=new Shop();
        shop.setShopName("test234");
        shop.setStatus("init");
        shopService.add(shop);
    }


}
