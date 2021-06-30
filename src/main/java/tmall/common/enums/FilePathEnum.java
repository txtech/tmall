package tmall.common.enums;

/**
 * @author bernie
 * @date 2021/2/4
 */
public enum FilePathEnum {

    PRODUCT("pictures/product/","产品图片"),
    SHOP("pictures/shop/","店铺图片"),
    BANNER("pictures/banner/","Banner图片"),
    LOGO("pictures/logo/","Logo图片"),
    CATEGORY("pictures/category/","类目图片");

    private String code;
    private String desc;

    FilePathEnum(String code, String desc){
        this.desc=desc;
        this.code=code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
