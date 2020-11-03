package tmall.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import tmall.service.ConfigService;
import tmall.util.StringUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
/**
 *  加载设置参数
 */
public class ConfigInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    ConfigService configService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o) throws Exception {
        if (!(o instanceof HandlerMethod)) {
            return true;
        }
        Map<String, String> config = configService.map();
        String indexCode = config.get("index_code");
        if(!StringUtil.isEmpty(indexCode) && indexCode.endsWith("-1")){
            indexCode = indexCode.substring(0,indexCode.lastIndexOf("-1"));
        }
        request.getServletContext().setAttribute("phone", config.get("index_phone"));
        request.getServletContext().setAttribute("websiteMode",config.get("website_mode"));
        request.getServletContext().setAttribute("SEOCode", indexCode);
        request.getServletContext().setAttribute("SEOTitle", config.get("index_title"));
        request.getServletContext().setAttribute("keywords", config.get("index_keyword"));
        request.getServletContext().setAttribute("description", config.get("index_description"));
        request.getServletContext().setAttribute("website_name", config.get("website_name"));
        request.getServletContext().setAttribute("websiteAddress", config.get("website_address"));
        request.getServletContext().setAttribute("productImgDir", config.get("path_product_img"));
        request.getServletContext().setAttribute("categoryImgDir", config.get("path_category_img"));
        return true;
    }
}
