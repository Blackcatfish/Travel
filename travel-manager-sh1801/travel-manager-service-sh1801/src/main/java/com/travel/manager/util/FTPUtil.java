package com.travel.manager.util;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import java.io.*;

public class FTPUtil {
    private static FTPClient ftpClient=new FTPClient();
    private static String encoding="UTF-8";
    public static boolean uploadFile(String url, int port, String username, String password, String path, String filename,
                                     InputStream input){
        boolean result=false;
        int reply;
        try {
            ftpClient.connect(url,port);
            ftpClient.login(username,password);
            ftpClient.setControlEncoding(encoding);
            reply=ftpClient.getReplyCode();
            if(!FTPReply.isPositiveCompletion(reply)){
                System.out.println("连接失败");

                ftpClient.disconnect();
                return result;

            }
            boolean change =ftpClient.changeWorkingDirectory(path);
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            if(change){
                result=ftpClient.storeFile(new String(filename.getBytes(encoding),"iso-8859-1"),input);
                if (result){
                    System.out.println("上传成功");
                }
            }
            input.close();
            ftpClient.logout();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (ftpClient.isConnected()){
                try {
                    ftpClient.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    /*public static void main(String[] args) throws FileNotFoundException {
        FileInputStream fileInputStream = new FileInputStream(new File("F:\\相册\\Picture_01_Imagination.jpg"));
        uploadFile("10.11.54.143",21,"ftpuser","ftpuser","/home/ftpuser","Picture_01_Imagination.jpg",fileInputStream);

    }*/
}
