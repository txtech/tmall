package tmall.test;

import com.google.common.collect.Lists;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Random;

/**
 * @author bernie
 * @date 2021/1/20
 */
public class DownloadUrl {

    public void download(String urlString, String filename) throws Exception {
        String savePath = "";
        URL url = new URL(urlString);
        // 打开连接
        URLConnection con = url.openConnection();
        //设置请求超时为5s
        con.setConnectTimeout(5 * 1000);
        // 输入流
        InputStream is = con.getInputStream();
        // 1K的数据缓冲
        byte[] bs = new byte[1024];
        // 读取到的数据长度
        int len;
        // 输出的文件流
        File sf = new File(savePath);
        if (!sf.exists()) {
            sf.mkdirs();
        }
        OutputStream os = new FileOutputStream(filename);
        // 开始读取
        while ((len = is.read(bs)) != -1) {
            os.write(bs, 0, len);
        }
        // 完毕，关闭所有链接
        os.close();
        is.close();
    }

    public List<String> parseContent() {
        List<String> itemlist = Lists.newArrayList();
        String url = "";
        String imags[] = url.split("src=\"");
        for (int i = 0; i < imags.length; i++) {
            if (!imags[i].contains("http")) {
                continue;
            }
            String img = imags[i].substring(0, imags[i].indexOf(".jpg") + 4);
            itemlist.add(img);
        }
        return itemlist;
    }

    public static void main(String[] args) {
        List<String> itemlist = Lists.newArrayList();
        DownloadUrl downloadUrl = new DownloadUrl();
        itemlist = downloadUrl.parseContent();
        int i = 0;
        for (String url : itemlist) {
            i++;
            try {
                Random rd = new Random(1000);
                String ext = url.substring(url.lastIndexOf("."));
                downloadUrl.download(url, "/Users/bernie/Public/tupian/" + i + ext);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
