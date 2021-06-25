package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.pojo.Config;
import tmall.pojo.Product;
import tmall.pojo.ProductImage;
import tmall.pojo.User;
import tmall.util.StringUtil;
import tmall.util.UploadedImageFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/config")
public class ConfigController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("edit")
    public String edit(Model model) throws Exception {
        List<Config> list = configService.list();
        List<Config> configs = new ArrayList<>();
        for (Config config : list) {
            if(config == null){
                continue;
            }
            if (config.getName().contains("banner_")) {
                continue;
            }
            configs.add(config);
        }
        model.addAttribute("configs", configs);
        return "admin/editConfig";
    }

    @RequestMapping("update")
    public String update(Integer[] id, String[] value, HttpSession session) throws Exception {
        configService.update(id, value, "value");
        session.removeAttribute("productImgDir");
        return "redirect:edit";
    }

    @RequestMapping("updateImg")
    public String add(String banner,UploadedImageFile uploadedImageFile) throws Exception {
        if(StringUtil.isEmpty(banner)){
            return "redirect:edit";
        }
        if(banner.equalsIgnoreCase("banner1")){
            fileUtil.saveImg(uploadedImageFile, "banner", "1.jpg");
        }else{
            String URL = "pictures/banner/1.jpg";
            fileUtil.saveImg(uploadedImageFile, "banner", "2.jpg");
        }
        return "redirect:edit";
    }
}
