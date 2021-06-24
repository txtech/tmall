package tmall.pojo;

import tmall.mapper.ProductImageMapper;
import tmall.pojo.extension.ProductImageExtension;

import java.util.Date;

public class ProductImage extends ProductImageExtension implements tmall.pojo.ORM.POJOMapper<ProductImageMapper> {

    private Integer pid;

    private String type;

    private String pathUrl;

    private String bizType;

    private Date createdAt;


    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getPathUrl() {
        return pathUrl;
    }

    public void setPathUrl(String pathUrl) {
        this.pathUrl = pathUrl;
    }

    public String getBizType() {
        return bizType;
    }

    public void setBizType(String bizType) {
        this.bizType = bizType;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}