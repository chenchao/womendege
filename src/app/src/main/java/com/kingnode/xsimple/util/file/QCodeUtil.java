package com.kingnode.xsimple.util.file;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;

import com.swetake.util.Qrcode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import sun.misc.BASE64Encoder;
/**
 * 生成二维码工具类
 *
 * @author cici
 */
public class QCodeUtil{
    private final Logger logger=LoggerFactory.getLogger(QCodeUtil.class);
    private static QCodeUtil util=null;
    private QCodeUtil(){
    }
    public static QCodeUtil getInstall(){
        if(util==null){
            synchronized(QCodeUtil.class){
                if(util==null){
                    util=new QCodeUtil();
                }
            }
        }
        return util;
    }
    /**
     * 根据传输的字符串,和logo图生成二维码,将二维码转换成base64字符串进行返回
     *
     * @param data     字符串信息
     * @param iconPath 中间logo的地址
     * @param width    logo的宽
     * @param heigth   logo的高
     *
     * @return base64编码后的二维码信息
     */
    public String ReadQCodeBase64(String data,String iconPath,int width,int heigth){
        String base64Image="";
        try{
            Qrcode qrcodeHandler=new Qrcode();
            qrcodeHandler.setQrcodeErrorCorrect('M');
            qrcodeHandler.setQrcodeEncodeMode('B');
            qrcodeHandler.setQrcodeVersion(7);
            byte[] contentBytes=data.getBytes("gb2312");
            //构造一个BufferedImage对象 设置宽、高
            BufferedImage bufImg=new BufferedImage(140,140,BufferedImage.TYPE_INT_RGB);
            Graphics2D gs=bufImg.createGraphics();
            gs.setBackground(Color.WHITE);
            gs.clearRect(0,0,140,140);
            // 设定图像颜色 > BLACK
            gs.setColor(Color.BLACK);
            // 设置偏移量 不设置可能导致解析出错
            int pixoff=2;
            // 输出内容 > 二维码
            if(contentBytes.length>0&&contentBytes.length<120){
                boolean[][] codeOut=qrcodeHandler.calQrcode(contentBytes);
                for(int i=0;i<codeOut.length;i++){
                    for(int j=0;j<codeOut.length;j++){
                        if(codeOut[j][i]){
                            gs.fillRect(j*3+pixoff,i*3+pixoff,3,3);
                        }
                    }
                }
            }else{
                logger.error("QRCode content bytes length ={}not in [ 0,120 ].",contentBytes.length);
            }
            Image img=ImageIO.read(new File(iconPath));//实例化一个Image对象。
            //            gs.drawImage(img, 44, 55, 49, 30, null);
            //            gs.drawImage(img, 44, 50, 49, 45, null);
            gs.drawImage(img,48,50,width,heigth,null);
            gs.dispose();
            bufImg.flush();
            // 生成二维码QRCode图片
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            ImageIO.write(bufImg,"png",baos);
            byte[] bytes=baos.toByteArray();
            BASE64Encoder encoder=new BASE64Encoder();
            base64Image=encoder.encodeBuffer(bytes).trim();//返回Base64编码过的字节数组字符串
        }catch(Exception e){
            base64Image="";
            logger.error("二维码生成异常{}",e);
        }
        return base64Image;
    }
    /**
     * 根据传输的字符串,生成二维码,将二维码转换成base64字符串进行返回
     *
     * @param data 字符串信息
     *
     * @return base64编码后的二维码信息
     */
    public String ReadQCodeBase64(String data){
        String base64Image="";
        try{
            Qrcode qrcodeHandler=new Qrcode();
            qrcodeHandler.setQrcodeErrorCorrect('M');
            qrcodeHandler.setQrcodeEncodeMode('B');
            qrcodeHandler.setQrcodeVersion(7);
            byte[] contentBytes=data.getBytes("gb2312");
            BufferedImage bufImg=new BufferedImage(140,140,BufferedImage.TYPE_INT_RGB);
            Graphics2D gs=bufImg.createGraphics();
            gs.setBackground(Color.WHITE);
            gs.clearRect(0,0,140,140);
            gs.setColor(Color.BLACK);// 设定图像颜色 > BLACK
            int pixoff=2;// 设置偏移量 不设置可能导致解析出错
            if(contentBytes.length>0&&contentBytes.length<120){//输出内容二维码
                boolean[][] codeOut=qrcodeHandler.calQrcode(contentBytes);
                for(int i=0;i<codeOut.length;i++){
                    for(int j=0;j<codeOut.length;j++){
                        if(codeOut[j][i]){
                            gs.fillRect(j*3+pixoff,i*3+pixoff,3,3);
                        }
                    }
                }
            }
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(bufImg, "jpg", baos);
            byte[] bytes = baos.toByteArray();
            BASE64Encoder encoder=new BASE64Encoder();
            base64Image=encoder.encodeBuffer(bytes).trim();//返回Base64编码过的字节数组字符串
        }catch(Exception e){
            base64Image = "";
            logger.error("二维码生成异常{}",e);
        }
        return base64Image;
    }
    /**
     * 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
     *
     * @param imgFile 待处理的图片
     *
     * @return 返回base64处理后的字符串
     */
    private String GetImageOfBase64(String imgFile){
        byte[] data=null;
        String base64Image="";
        try{
            InputStream in=new FileInputStream(imgFile);
            data=new byte[in.available()];
            in.read(data);
            in.close();
        }catch(IOException e){
        }
        //对字节数组Base64编码
        if(null!=data){
            BASE64Encoder encoder=new BASE64Encoder();
            base64Image=encoder.encode(data);//返回Base64编码过的字节数组字符串
        }
        return base64Image;
    }
    /**
     * 生成二维码(QRCode)图片
     *
     * @param content 二维码图片的内容
     * @param imgPath 生成二维码图片完整的路径
     */
    public int CreateQRCode(String content,String imgPath){
        try{
            Qrcode qrcodeHandler=new Qrcode();
            qrcodeHandler.setQrcodeErrorCorrect('M');
            qrcodeHandler.setQrcodeEncodeMode('B');
            qrcodeHandler.setQrcodeVersion(7);
            byte[] contentBytes=content.getBytes("gb2312");
            BufferedImage bufImg=new BufferedImage(140,140,BufferedImage.TYPE_INT_RGB);
            Graphics2D gs=bufImg.createGraphics();
            gs.setBackground(Color.WHITE);
            gs.clearRect(0,0,140,140);
            gs.setColor(Color.BLACK);// 设定图像颜色 > BLACK
            int pixoff=2;// 设置偏移量 不设置可能导致解析出错
            if(contentBytes.length>0&&contentBytes.length<120){//输出内容二维码
                boolean[][] codeOut=qrcodeHandler.calQrcode(contentBytes);
                for(int i=0;i<codeOut.length;i++){
                    for(int j=0;j<codeOut.length;j++){
                        if(codeOut[j][i]){
                            gs.fillRect(j*3+pixoff,i*3+pixoff,3,3);
                        }
                    }
                }
            }else{
                return -1;
            }

			/*Image img = ImageIO.read(new File(ccbPath));
            gs.drawImage(img, 44, 55, 49, 30, null);
			gs.dispose();
			bufImg.flush();*/
            File imgFile=new File(imgPath);
            ImageIO.write(bufImg,"png",imgFile);// 生成二维码QRCode图片
        }catch(Exception e){
            return -100;
        }
        return 0;
    }
}
