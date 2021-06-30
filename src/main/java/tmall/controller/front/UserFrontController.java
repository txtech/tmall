package tmall.controller.front;

import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.core.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;
import tmall.annotation.Auth;
import tmall.annotation.Nullable;
import tmall.common.enums.FilePathEnum;
import tmall.controller.request.ShopRequestDto;
import tmall.pojo.*;
import tmall.service.ConfigService;
import tmall.util.UploadFileInfo;
import tmall.util.UploadedImageFile;

import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
@RequestMapping("/")
@Slf4j
public class UserFrontController extends FrontBaseController {
    @Autowired
    private ConfigService configService;

    /**
     * 用户注册
     */
    @RequestMapping("register")
    public String register() {
        return "user/memberRegister";
    }

    /**
     * 商户注册
     */
    @RequestMapping("merchantRegister")
    public String merchantRegister() {
        return "user/merchantRegister";
    }

    /**
     * 用户注册添加
     */
    @RequestMapping("merchantRegisterAdd")
    public String merchantRegisterAdd(ShopRequestDto requestDto, Model model) throws Exception {
        String name = requestDto.getName();
        String msg = null;
        if (!HtmlUtils.htmlEscape(name).equals(name)) {
            msg = "用户名含有特殊字符，无法注册，请重新输入";
        }
        if (userService.isExist(name)) {
            msg = "用户名已存在，无法注册，请重新输入";
        }
        if (msg != null) {
            model.addAttribute("msg", msg);
            return "user/memberRegister";
        }
        Shop shop = buildShopInfo(requestDto);
        User user = new User();
        user.setName(name);
        user.setPassword(requestDto.getPassword());
        user.setGroup(User.Group.admin);
        userService.addMechart(user,shop);
        return "user/registerSuccess";
    }

    /**
     * 商家用户注册
     */
    private Shop buildShopInfo(ShopRequestDto requestDto) {
        Shop shop = new Shop();
        shop.setShopName(requestDto.getShopName());
        shop.setStatus("init");
        String type = "shop";
        try {
            String relativeFolderPath = configService.map().get("path_" + type + "_img");
            MultipartFile payCodeFile = requestDto.getPayCode();
            if (Objects.nonNull(payCodeFile)) {
                String payCodeFileName = UuidUtil.getTimeBasedUuid().toString();
                String fileName = payCodeFile.getOriginalFilename();
                String ext = fileName.substring(fileName.lastIndexOf("."));
                String newImagName = payCodeFileName + ext;

                UploadedImageFile uploadedImageFile = new UploadedImageFile();
                uploadedImageFile.setImage(payCodeFile);
                //fileUtil.saveImg(uploadedImageFile, type, newImagName);
                //shop.setPayCode("/" + relativeFolderPath + newImagName);
                if(uploadedImageFile !=null){
                    UploadFileInfo uploadFileInfo= fileUtil.uploadFile(uploadedImageFile, FilePathEnum.LOGO.getCode());
                    if(uploadFileInfo !=null){
                        shop.setPayCode(uploadFileInfo.getFullPath());
                    }
                }
            }
            MultipartFile shopLogFile = requestDto.getShopLog();
            if (Objects.nonNull(shopLogFile)) {
                String ShopLogFileName = UuidUtil.getTimeBasedUuid().toString();
                String fileName = shopLogFile.getOriginalFilename();
                String ext = fileName.substring(fileName.lastIndexOf("."));
                String newImagName = ShopLogFileName + ext;
                UploadedImageFile uploadedImageFile = new UploadedImageFile();
                uploadedImageFile.setImage(shopLogFile);
                //fileUtil.saveImg(uploadedImageFile, type, newImagName);
                //shop.setShopLog("/" + relativeFolderPath + newImagName);
                if(uploadedImageFile !=null){
                    UploadFileInfo uploadFileInfo= fileUtil.uploadFile(uploadedImageFile, FilePathEnum.LOGO.getCode());
                    if(uploadFileInfo !=null){
                        shop.setShopLog(uploadFileInfo.getFullPath());
                    }
                }
            }
        } catch (Exception e) {
            log.info("upload.file.error={}", e);
        }
        return shop;
    }

    /**
     * 用户注册添加
     */
    @RequestMapping("registerAdd")
    public String registerAdd(String name, String password, Model model) throws Exception {
        String msg = null;
        if (!HtmlUtils.htmlEscape(name).equals(name)) {
            msg = "用户名含有特殊字符，无法注册，请重新输入";
        }
        if (userService.isExist(name)) {
            msg = "用户名已存在，无法注册，请重新输入";
        }
        if (msg != null) {
            model.addAttribute("msg", msg);
            return "user/memberRegister";
        }
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        user.setGroup(User.Group.user);
        userService.add(user);
        return "user/registerSuccess";
    }

    /**
     * 用户登陆
     */
    @RequestMapping("login")
    public String login(@Nullable String refer, Model model, HttpSession session) {
        if (refer != null) {
            model.addAttribute("refer", refer);
        }
        if (session.getAttribute("user") != null) {
            return "redirect:/";
        }
        return "user/login";
    }

    /**
     * 用户登陆
     */
    @RequestMapping("loginIn")
    public String loginIn(String name, String password, Model model, HttpSession session, String refer) {
        User userFromDB = userService.get(name, password);
        if (userFromDB == null) {
            String msg = "用户名密码错误，请重试";
            model.addAttribute("msg", msg);
            return "user/login";
        }
        session.setAttribute("user", userFromDB);
        return "redirect:" + refer;
    }

    /**
     * 用户退出
     */
    @RequestMapping("logout")
    public String logout(@Nullable String refer, HttpSession session) {
        session.removeAttribute("user");
        return "redirect:" + refer;
    }

    /**
     * 用户登陆验证
     */
    @RequestMapping("checkLogin")
    public String checkLogin(Model model, HttpSession session) {
        String msg = session.getAttribute("user") != null ? "success" : "fail";
        model.addAttribute("msg", msg);
        return "403";
    }

    @Auth(User.Group.unLogin)
    @RequestMapping("noAuth")
    public String noAuth(Model model) {
        String msg = "没有权限访问此页面";
        model.addAttribute("msg", msg);
        return "403";
    }
}
