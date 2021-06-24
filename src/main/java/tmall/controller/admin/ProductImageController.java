package tmall.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.common.enums.BizTypeEnum;
import tmall.pojo.Product;
import tmall.pojo.ProductImage;
import tmall.pojo.User;
import tmall.util.UploadFileInfo;
import tmall.util.UploadedImageFile;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/product/image")
@Slf4j
public class ProductImageController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Integer pid, Model model) throws Exception {

        List<ProductImage> topList=null;
        List<ProductImage> detailList=null;
        ProductImage cover=null;
        List<ProductImage> coverList=null;
        //查询商品的图片
        List<ProductImage> productImageList=productImageService.list("pid",pid,"bizType",BizTypeEnum.PRODUCT.name());

        if(!CollectionUtils.isEmpty(productImageList)){
            Map<String,List<ProductImage>> group= productImageList.stream().collect(Collectors.groupingBy(e->e.getType()));
            topList= group.get("top");
            detailList=group.get("detail");
            coverList=group.get("cover");
            if(!CollectionUtils.isEmpty(coverList)){
                cover=coverList.get(0);
            }
        }

        //分组查询
        //List<ProductImage> productTopImages = productImageService
        //        .list("pid", pid, "type", ProductImage.Type.top.toString(),"order","id asc");
        //List<ProductImage> productDetailImages = productImageService
        //        .list("pid", pid, "type", ProductImage.Type.detail.toString(),"order","id asc");
        Product product = (Product) productService.get(pid);

        model.addAttribute("product", product);


        model.addAttribute("productCoverImage", cover);
        model.addAttribute("productTopImages",topList);
        model.addAttribute("productDetailImages", detailList);

        return "admin/listProductImage";
    }

    @RequestMapping("add")
    @Auth(User.Group.admin)
    public String add(Integer pid, String type, UploadedImageFile uploadedImageFile) throws Exception {

        log.info("add img");
        UploadFileInfo uploadFileInfo= fileUtil.uploadFile(uploadedImageFile,"product");
        ProductImage productImage = new ProductImage();
        productImage.setPid(pid);
        productImage.setType(type);
        productImage.setBizType(BizTypeEnum.PRODUCT.name());
        productImage.setPathUrl(uploadFileInfo.getFullPath());
        productImageService.add(productImage);
        //fileUtil.saveImg(uploadedImageFile, "product", productImage.getId() + ".jpg");
        if (productImage.getType().equals(ProductImage.Type.cover.toString())) {
            Product product = (Product) productService.get(pid);
            product.setImage(productImage);
            productService.update(product);
        }
        log.info("add img end");
        return "redirect:list?pid=" + pid;
    }

    @RequestMapping("delete")
    @Auth(User.Group.admin)
    public String delete(Integer id) throws Exception {
        ProductImage productImage = (ProductImage) productImageService.get(id);
        productImageService.delete(productImage);
        return "redirect:list?pid=" + productImage.getProduct().getId();
    }
}