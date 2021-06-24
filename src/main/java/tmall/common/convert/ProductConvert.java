package tmall.common.convert;

import org.springframework.util.CollectionUtils;
import tmall.controller.request.AdminProductRequest;
import tmall.pojo.Product;
import tmall.pojo.ProductImage;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author bernie
 * @date 2021/1/30
 */

public class ProductConvert {

    public static Product requestToProduct(AdminProductRequest request){
        Product p = new Product();
        p.setCid(request.getCid());
        p.setName(request.getName());
        p.setSubTitle(request.getSubTitle());
        p.setOriginalPrice(request.getOriginalPrice());
        p.setNowPrice(request.getNowPrice());
        p.setStock(request.getStock());
        p.setCommentCount(0);
        p.setCreateDate(new Date());
        p.setSaleCount(0);
        return p;

    }

    public  static void  productConvert(List<Product> productList){
        if(CollectionUtils.isEmpty(productList)){
            return;
        }
        //设置首页主图
        productList.stream().forEach(product -> {
            List<ProductImage> productImageList=  product.getProductImages();
            if(!CollectionUtils.isEmpty(productImageList)){
                Map<String,List<ProductImage>> productImageMap= productImageList.stream().collect(
                    Collectors.groupingBy(e->e.getType()));
                List<ProductImage> coverList= productImageMap.get("cover");
                if(!CollectionUtils.isEmpty(coverList)){
                    product.setHomeImage(coverList.get(0).getPathUrl());
                }
            }
        });

    }

}
