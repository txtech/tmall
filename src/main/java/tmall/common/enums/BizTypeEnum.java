package tmall.common.enums;

/**
 * @author bernie
 * @date 2021/2/4
 */
public enum BizTypeEnum {

    PRODUCT("product","产品"),
    SHOP("shop","产品"),
    CATEGORY("category","类目");

    private String code;
    private String desc;
    BizTypeEnum(String code,String desc){
        this.desc=desc;
        this.code=code;
    }

}
