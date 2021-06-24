package tmall.util;
/**
 * 处理 Controller 中文件保存的问题
 */

import org.apache.logging.log4j.core.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import tmall.service.ConfigService;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.Map;

@Component
public class FileUtil implements ServletContextAware {
    @Autowired
    public ConfigService configService;

    private ServletContext servletContext;

    @Value("${oss.upload.domain:http://localhost}")
    private String domain;
    @Value("${oss.upload.port:80}")
    private String port;

    @Value("${upload.img.path}")
    private String uploadPath;

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public void saveImg(UploadedImageFile uploadedImageFile, String type, String imgName) throws Exception {
        Map<String, String> config = configService.map();
        String relativeFolderPath = config.get("path_" + type + "_img");
        File imageFolder = new File(uploadPath + relativeFolderPath);
        if (!imageFolder.exists()) {
            imageFolder.mkdirs();
        }
        File imageFile = new File(imageFolder, imgName);
        imageFile.setReadable(true);
        imageFile.setWritable(true);
        uploadedImageFile.getImage().transferTo(imageFile);
    }


    public UploadFileInfo uploadFile(UploadedImageFile uploadedFile, String type) throws Exception {
        String relativeFolderPath = configService.map().get("path_" + type + "_img");
        File imageFolder = new File(uploadPath + relativeFolderPath);
        if (!imageFolder.exists()) {
            imageFolder.mkdirs();
        }
        //生成上传文件名称
        String upFileName = UuidUtil.getTimeBasedUuid().toString().replaceAll("-","");
        String fileName = uploadedFile.getImage().getOriginalFilename();
        String ext = fileName.substring(fileName.lastIndexOf("."));
        String newImagName = upFileName + ext;
        //上传文件
        File imageFile = new File(imageFolder, newImagName);
        imageFile.setReadable(true);
        imageFile.setWritable(true);
        uploadedFile.getImage().transferTo(imageFile);
        UploadFileInfo uploadFileInfo = new UploadFileInfo();
        uploadFileInfo.setFullPath(domain + relativeFolderPath + newImagName);
        return uploadFileInfo;
    }
}

