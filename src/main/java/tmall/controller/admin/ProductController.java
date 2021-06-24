package tmall.controller.admin;

import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Throwables;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.core.util.UuidUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.common.convert.ProductConvert;
import tmall.controller.request.AdminProductRequest;
import tmall.pojo.Category;
import tmall.pojo.Product;
import tmall.pojo.User;
import tmall.util.Pagination;
import tmall.util.StringUtil;
import tmall.util.UploadFileInfo;
import tmall.util.UploadedImageFile;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/admin/product")
@Slf4j
public class ProductController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Integer cid, Model model, Pagination pagination, HttpSession session) throws Exception {

        User user = (User)session.getAttribute("user");
        List<Product> products = productService
            .list("cid", cid, "shopId", user.getShopId(), "pagination", pagination);
        ProductConvert.productConvert(products);
        Category category = (Category)categoryService.get(cid);
        pagination.setParam("&cid=" + category.getId());
        model.addAttribute("products", products);
        model.addAttribute("category", category);
        return "admin/listProduct";
    }

    @RequestMapping("add")
    @Auth(User.Group.admin)
    public String add(AdminProductRequest addProductRequest,
                      HttpSession session) throws Exception {

        User user = (User)session.getAttribute("user");
        Integer shopId = user.getShopId();
        Product p = ProductConvert.requestToProduct(addProductRequest);
        uploadImg(addProductRequest, p);

        p.setCommentCount(0);
        p.setCreateDate(new Date());
        p.setSaleCount(0);
        p.setShopId(shopId);
        productService.add(p);
        return "redirect:list?cid=" + addProductRequest.getCid();
    }

    private void uploadImg(AdminProductRequest productRequest, Product p) {

        try {
            if (!StringUtil.isEmpty(productRequest.getPayCode().getOriginalFilename())) {
                UploadedImageFile uploadedImageFile = new UploadedImageFile();
                uploadedImageFile.setImage(productRequest.getPayCode());
                UploadFileInfo uploadFileInfo= fileUtil.uploadFile(uploadedImageFile,"product");
                Map<String,Object> map= p.getExtras();
                map.put("path", uploadFileInfo.getFullPath());
                p.setExtras(map);
            }
        } catch (Exception e) {
           log.error("upload.image.error={}", Throwables.getStackTraceAsString(e));
        }

    }

    @Auth(User.Group.admin)
    @RequestMapping("edit")
    public String edit(Integer id, Model model) throws Exception {
        Product p = (Product)productService.get(id);
        model.addAttribute(p);
        return "admin/editProduct";
    }

    @RequestMapping("update")
    @Auth(User.Group.admin)
    public String update(AdminProductRequest updateProductRequest) throws Exception {

        Product p = (Product)productService.get(updateProductRequest.getId());
        p.setName(updateProductRequest.getName());
        p.setSubTitle(updateProductRequest.getSubTitle());
        p.setOriginalPrice(updateProductRequest.getOriginalPrice());
        p.setNowPrice(updateProductRequest.getNowPrice());
        p.setStock(updateProductRequest.getStock());
        uploadImg(updateProductRequest, p);
        productService.update(p);
        return "redirect:list?cid=" + p.getCategory().getId();
    }

    @RequestMapping("delete")
    @Auth(User.Group.admin)
    public String delete(int id) throws Exception {
        Product p = (Product)productService.get(id);
        productService.delete(p);
        return "redirect:list?cid=" + p.getCategory().getId();
    }
}