package tmall.pojo.base;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import tmall.util.StringUtil;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;
import java.util.Objects;

/**
 * 让 mybatis-generator 自动生成的 pojo 自动继承本类
 */

public class BasePOJO implements Serializable {
    private Integer id;
    private Date deleteAt;
    private Map<String, Object> extras;
    /**
     * 拓展字段
     */
    private String extraJson;

    public Map<String, Object> getExtras() {
        if(Objects.nonNull(extras)){
            return extras;
        }
        if (!StringUtil.isEmpty(extraJson)) {
            return JSONObject.parseObject(extraJson, Map.class);
        }
        return Maps.newHashMap();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Date deleteAt) {
        this.deleteAt = deleteAt;
    }

    public void setExtras(Map<String, Object> extras) {
        this.extras = extras;
    }

    public String getExtraJson() {
        return extraJson;
    }

    public void setExtraJson(String extraJson) {
        this.extraJson = extraJson;
    }
}
