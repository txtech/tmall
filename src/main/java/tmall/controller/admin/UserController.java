package tmall.controller.admin;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.pojo.Shop;
import tmall.pojo.User;
import tmall.service.ShopService;
import tmall.util.Pagination;
import tmall.util.StringUtil;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/admin/user")
public class UserController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination) throws Exception {
        List<User> users = userService.list("pagination", pagination);
        users.forEach(user -> {
            String group=user.getGroup_();
            if(StringUtils.equals("user",group)){
                user.setGroupName("买家");

            }else if(StringUtils.equals("admin",group)){
                user.setGroupName("代理商");
            }else if(StringUtils.equals("superAdmin",group)){
                user.setGroupName("总公司");
            }else {
                user.setGroupName("游客");
            }
            try {
                 //获取店铺名称
               Integer shopId= user.getShopId();
               if(Objects.nonNull(shopId)){
                   Shop shop= (Shop) shopService.get(user.getShopId());
                   if(Objects.nonNull(shop)){
                       user.setShopName(shop.getShopName());
                   }
               }

            } catch (Exception e) {
                e.printStackTrace();
            }

        });
        model.addAttribute("users", users);
        return "/admin/listUser";
    }


}
