package tmall.util;
/**
 * 处理 Controller 中文件保存的问题
 */

import org.apache.logging.log4j.core.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import tmall.common.enums.FilePathEnum;
import tmall.service.ConfigService;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Component
public class FileUtil implements ServletContextAware {
    @Autowired
    public ConfigService configService;

    private ServletContext servletContext;

    @Value("${oss.upload.domain:}")
    private String domain;
    @Value("${upload.img.path:}")
    private String uploadPath;
    @Value("${oss.upload.project:}")
    private String uploadProject;

    private static  final String categoryPath = "pictures/category/";
    private static  final String productPath = "pictures/product/";

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public void saveImg(UploadedImageFile uploadedImageFile, String type, String imgName) throws Exception {
        Map<String, String> config = configService.map();
        String relativeFolderPath = config.get("path_" + type + "_img");
        File imageFolder = new File(getUploadPath() + relativeFolderPath);
        if (!imageFolder.exists()) {
            imageFolder.mkdirs();
        }
        File imageFile = new File(imageFolder, imgName);
        imageFile.setReadable(true);
        imageFile.setWritable(true);
        uploadedImageFile.getImage().transferTo(imageFile);
    }


    public UploadFileInfo uploadFile(UploadedImageFile uploadedFile,String filePath) throws Exception {
        try {
            String relativeFolderPath = getUploadPath() + uploadProject + filePath;
            File imageFolder = new File(relativeFolderPath);
            if (!imageFolder.exists()) {
                imageFolder.mkdirs();
            }
            //生成上传文件名称
            String fileName = uploadedFile.getImage().getOriginalFilename();
            if(StringUtil.isEmpty(fileName)){
                return null;
            }
            String upFileName = UuidUtil.getTimeBasedUuid().toString().replaceAll("-","");
            String ext = fileName.substring(fileName.lastIndexOf("."));
            String newImagName = upFileName + ext;
            //上传文件
            File imageFile = new File(imageFolder,newImagName);
            imageFile.setReadable(true);
            imageFile.setWritable(true);
            uploadedFile.getImage().transferTo(imageFile);
            UploadFileInfo uploadFileInfo = new UploadFileInfo();
            uploadFileInfo.setFullPath(getDomain() + uploadProject + filePath + newImagName);
            return uploadFileInfo;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String getDomain() {
        if(StringUtil.isEmpty(domain)){
            return domain;
        }
        if(domain.endsWith("/")){
            return domain;
        }else{
            return domain + "/";
        }
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getUploadPath() {
        if(StringUtil.isEmpty(uploadPath)){
            return uploadPath;
        }
        if(uploadPath.endsWith("/")){
            return uploadPath;
        }else{
            return uploadPath + "/";
        }
    }

    public void setUploadPath(String uploadPath) {
        this.uploadPath = uploadPath;
    }
}

