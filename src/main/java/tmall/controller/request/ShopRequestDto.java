package tmall.controller.request;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

/**
 * @author bernie
 * @date 2021/1/10
 */
@Data
public class ShopRequestDto implements Serializable {

    private String name;
    private String password;
    private String rePassword;
    private String shopName;
    private MultipartFile shopLog;
    private MultipartFile payCode;
}
