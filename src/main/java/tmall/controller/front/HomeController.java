package tmall.controller.front;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Nullable;
import tmall.common.convert.ProductConvert;
import tmall.pojo.*;
import tmall.util.Pagination;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/")
@Slf4j
public class HomeController extends FrontBaseController {

    /**
     * 商城首页
     */
    @RequestMapping("")
    public String home(Model model, HttpServletRequest request) throws Exception {
        Pagination pagination = new Pagination();
        pagination.setCount(13);
        List<Category> categories = categoryService.list("depth", 1, "pagination",pagination,"recommend_gt", 0, "order", "recommend desc, id desc");
        categories = categories.stream().filter(category -> !CollectionUtils.isEmpty(category.getProducts())).collect(Collectors.toList());
        for (Category category : categories) {
            List<Product> products = productService.list("cid", category.getId(), "stock_gt", 0);
            ProductConvert.productConvert(products);
            category.setProducts(products);
        }
        model.addAttribute("categories", categories);
        String websiteMode = (String)request.getServletContext().getAttribute("websiteMode");
        if ("2".equals(websiteMode)) {
            return "home/home2";
        }else if("3".equals(websiteMode)) {
            return "home/home3";
        } else {
            return "home/home1";
        }
    }

    /**
     * 产品
     */
    @RequestMapping("product")
    public String product(Integer id, Model model) throws Exception {
        Product product = (Product) productService.get(id);
        Long start = System.currentTimeMillis();
        List<ProductImage> productTopImages = productImageService.list("pid", product.getId(), "type", ProductImage.Type.top.toString(), "order", "id asc");
        List<ProductImage> productDetailImages = productImageService.list("pid", product.getId(), "type", ProductImage.Type.detail.toString(), "order", "id asc");
        List<Comment> comments = commentService.list("pid", product.getId());
        List<PropertyValue> propertyValues = propertyValueService.list("pid", product.getId());
        model.addAttribute("productTopImages", productTopImages);
        model.addAttribute("productDetailImages", productDetailImages);
        model.addAttribute("comments", comments);
        model.addAttribute("propertyValues", propertyValues);
        model.addAttribute("product", product);
        Integer shopId = product.getShopId();
        if (Objects.nonNull(shopId)) {
            Shop shop = (Shop) shopService.get(product.getShopId());
            log.info(JSONObject.toJSONString(shop));
            model.addAttribute("shop", shop);
        }
        return "product/product";
    }

    /**
     * 分类
     */
    @RequestMapping("category")
    public String category(Integer id, @Nullable String sort, Model model) throws Exception {
        Category category = (Category) categoryService.get(id);
        List<Product> products = productService.list("cid", category.getId(), "order", handleSort(sort), "stock_gt", 0);
        ProductConvert.productConvert(products);
        model.addAttribute("products", products);
        model.addAttribute("category", category);
        return "product/category";
    }


    /**
     * 搜索
     */
    @RequestMapping("search")
    public String search(String keyword, @Nullable String sort, Model model) throws Exception {
        if (keyword.length() == 0) {
            return "home/search";
        }
        List<Product> products = productService.list("name_like", keyword, "order", handleSort(sort), "stock_gt", 0);
        ProductConvert.productConvert(products);
        model.addAttribute("products", products);
        model.addAttribute("keyword", keyword);
        return "home/search";
    }

    private String handleSort(String sort) {
        sort = sort == null ? "" : sort;
        String column = "";
        String order = "desc";
        switch (sort) {
            case "date":
                column = "createDate";
                break;
            case "comment":
                column = "commentCount";
                break;
            case "saleCount":
                column = "saleCount";
                break;
            case "price":
                column = "nowPrice";
                order = "asc";
                break;
            case "priceInverse":
                column = "nowPrice";
                break;
            default:
                column = "commentCount";
                break;
        }
        String res = String.format("%s %s , id desc", column, order);
        return res;
    }
}
