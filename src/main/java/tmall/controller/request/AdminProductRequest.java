package tmall.controller.request;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author bernie
 * @date 2021/1/30
 */
@Data
public class AdminProductRequest implements Serializable {

    private Integer id;
    private Integer cid;
    private String name;
    private String subTitle;
    private BigDecimal originalPrice;
    private BigDecimal nowPrice;
    private Integer stock;
    private MultipartFile payCode;
}
