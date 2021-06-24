package io.mall.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author bernie
 * @date 2021/2/19
 */
public class DbbackUp {


    String serverUrl = "localhost";//数据库的url
    String username = "root";
    String password = "root";
    String dbName = "tmall";//数据库的名字

    /**
     * 数据备份
     * @throws IOException
     */
    public void dbBackUp(String backupPath) throws IOException {
        //路径+名字
        String backupFile = backupPath + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".sql";
        //调用cmd命令的方法将数据库备份
        String mysql = backupPath + "\\" + "mysqldump" + " -h" + serverUrl + " -u" + username + " -p"+ password + " " + dbName + " > " + backupFile ;
        System.out.println("备份"+mysql);
        java.lang.Runtime.getRuntime().exec("cmd /c " + mysql);

        //Runtime.getRuntime().exec("/Users/bernie/o2o/mysql_backup.sh").waitFor();
        System.out.println("备份成功!");
    }


    public static void main(String[] args) {

        try {
            //DbbackUp dbbackUp=new DbbackUp();
            Runtime.getRuntime().exec("/Users/bernie/o2o/mysql_backup.sh").waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
