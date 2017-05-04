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

     * ���� :��������������ͼƬ�����Ƚϸ�

     * ����150X150����960X960

     * @param srcImgPath ԭͼƬ·�� 

     * @param distImgPath  ת����С��ͼƬ·�� 

     * @param width   ת����ͼƬ��� 

     * @param height  ת����ͼƬ�߶� 

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

            System.out.println("�������");

 

        } catch (IOException e) {  

            System.out.println("ͼƬת�������쳣��");  

        }  

 

    }
     
}
