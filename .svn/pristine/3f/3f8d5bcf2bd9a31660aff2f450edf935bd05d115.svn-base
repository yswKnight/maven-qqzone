package org.t1.qqzone.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/** 
* @author Ashy 
*/ 
public class ImgCompressUtil { 
 
	/*** 

     * 功能 :按照正方形缩放图片，精度较高

     * 处理150X150或者960X960

     * @param srcImgPath 原图片路径 

     * @param distImgPath  转换大小后图片路径 

     * @param width   转换后图片宽度 

     * @param height  转换后图片高度 

     */  

    public static void resizeImage(String srcImgPath, String distImgPath,int width, int height) throws IOException {  

        String subfix = "jpg";

        subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());

         

        File srcFile = new File(srcImgPath);  

        Image srcImg = ImageIO.read(srcFile);  

         

        BufferedImage buffImg = null; 

        if(subfix.equals("png")){

            buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);

        }else{

            buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        }

     

        Graphics2D graphics = buffImg.createGraphics();

        graphics.setBackground(Color.WHITE);

        graphics.setColor(Color.WHITE);

        graphics.fillRect(0, 0, width, height);

        graphics.drawImage(srcImg.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);  

 

        ImageIO.write(buffImg, subfix, new File(distImgPath));  

    }  

 

public static void main(String[] args) {

        try {  

            resizeImage("D:\\temp\\yuantu.jpg","D:\\temp\\yasuo.jpg",150,150); 

            System.out.println("处理好了");

 

        } catch (IOException e) {  

            System.out.println("图片转换出现异常！");  

        }  

 

    }
     
}
