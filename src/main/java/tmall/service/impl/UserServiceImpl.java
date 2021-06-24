package tmall.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tmall.mapper.UserMapper;
import tmall.pojo.Shop;
import tmall.pojo.User;
import tmall.pojo.UserExample;
import tmall.service.ShopService;
import tmall.service.UserService;
import tmall.util.PasswordUtil;

@Service
@Slf4j
public class UserServiceImpl extends BaseServiceImpl<UserMapper, UserExample> implements UserService {

    @Autowired
    private ShopService shopService;

    @Override
    @Transactional(rollbackFor= Exception.class)
    public Boolean addMechart(User user, Shop shop)throws Exception {
            shopService.add(shop);
            user.setShopId(shop.getId());
            this.add(user);
            return Boolean.TRUE;


    }

    @Override
    public boolean isExist(String username) throws Exception {
        return !list("name", username).isEmpty();
    }

    @Override
    public Integer add(User user) throws Exception {
        String rawPassword = user.getPassword();
        user.setPassword(PasswordUtil.encryptPassword(rawPassword));
        return super.add(user);
    }

    @Override
    public User get(String name, String password) {
        return (User)getOne("name", name, "password", PasswordUtil.encryptPassword(password), "order", "id asc");
    }


}