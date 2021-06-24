package tmall.pojo;

import java.util.Date;

import lombok.Data;
import tmall.mapper.ShopMapper;
import tmall.pojo.extension.ShopExtension;

@Data
public class Shop extends ShopExtension implements tmall.pojo.ORM.POJOMapper<ShopMapper> {


    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shop.shop_name
     *
     * @mbg.generated
     */
    private String shopName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shop.shop_log
     *
     * @mbg.generated
     */
    private String shopLog;

    private String payCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shop.status
     *
     * @mbg.generated
     */
    private String status;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shop.created_at
     *
     * @mbg.generated
     */
    private Date createdAt;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shop.updated_at
     *
     * @mbg.generated
     */
    private Date updatedAt;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column shop.extra
     *
     * @mbg.generated
     */
    private String extra;


}