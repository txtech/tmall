package tmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author bernie
 * @date 2021/1/16
 */
@Data
public class OrderOperationDto  implements Serializable {

    private String orderStatus;

    private  Boolean canApplyReturn;

    private  Boolean canCancelReturn;



}
