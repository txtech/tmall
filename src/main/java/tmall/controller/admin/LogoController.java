package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.annotation.Nullable;
import tmall.common.enums.FilePathEnum;
import tmall.pojo.Config;
import tmall.pojo.User;
import tmall.util.StringUtil;
import tmall.util.UploadFileInfo;
import tmall.util.UploadedImageFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/logo")
public class LogoController extends AdminBaseController {

    @Auth(User.Group.admin)
    @RequestMapping("edit")
    public String edit(Model model) throws Exception {
        List<Config> list = configService.list("order", "id asc");
        List<Config> configs = new ArrayList<>();
        for (Config config : list) {
            if(config == null){
                continue;
            }
            if (!config.getName().contains("logo_")) {
                continue;
            }
            configs.add(config);
        }
        model.addAttribute("configs", configs);
        return "admin/editLogo";
    }

    @Auth(User.Group.admin)
    @RequestMapping("edit2")
    public String edit(Integer id, Model model, HttpSession session) throws Exception {
        Config config = (Config) configService.get(id);
        model.addAttribute(config);
        return "admin/editLogo2";
    }

    @RequestMapping("update")
    public String update(Integer id,@Nullable UploadedImageFile uploadedImageFile,HttpSession session) throws Exception {
        Config config = (Config) configService.get(id);
        if(uploadedImageFile != null){
            UploadFileInfo uploadFileInfo = fileUtil.uploadFile(uploadedImageFile, FilePathEnum.LOGO.getCode());
            if(uploadFileInfo !=null){
                config.setValue(uploadFileInfo.getFullPath());
            }
        }
        configService.update(config);
        session.removeAttribute("productImgDir");
        return "redirect:edit";
    }

    @RequestMapping("clean")
    public String clean(Integer id,HttpSession session) throws Exception {
        Config config = (Config) configService.get(id);
        config.setValue("");
        configService.update(config);
        session.removeAttribute("productImgDir");
        return "redirect:edit";
    }
}
