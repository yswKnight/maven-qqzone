package org.t1.qqzone.service.test;

import java.security.MessageDigest;
import java.util.Date;


import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.LoginUserService;

public class LoginUserServiceTest {
	@Test
	public void getUserById() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		LoginUserService loginServcie = (LoginUserService) ctx.getBean("loginUserServiceImpl");
		System.err.println(loginServcie.getUserById("123"));
	}
	
	@Test
	public void userLogin() {
		
	}
	public static void main(String[] args) {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		LoginUserService loginServcie = (LoginUserService) ctx.getBean("loginUserServiceImpl");
		User user = new User();
		user.setUsername("78334994");
		user.setPassword("0e16ffd2fbb1d47ddee85c3b0c2fd149");
		System.err.println(loginServcie.userLogin(user));
		System.exit(0);
	}
	
	@Test
	public void findLoginUserBydicId() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		LoginUserService loginServcie = (LoginUserService) ctx.getBean("loginUserServiceImpl");
		System.err.println(loginServcie.findLoginUserBydicId(1));
	}
	
	@Test
	public void insertUser() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		LoginUserService loginServcie = (LoginUserService) ctx.getBean("loginUserServiceImpl");
		User user = new User();
		user.setAddress("���Ϻ�");
		user.setBirthday(new Date());
		Dic dic = new Dic();
		dic.setDicid("1");
		user.setDic(dic);
		user.setEmail("1233@qq.com");
		user.setRealname("����");
		user.setSex(0);
		user.setImg("test.jpg");
		
		String rannum = (int)((Math.random()*9+1)*10000)+"";
		user.setPassword("123");
		user.setSalt(rannum);
		loginServcie.insertUser(user);
	}
	
	@Test
	public void findUserUSerName() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		LoginUserService loginServcie = (LoginUserService) ctx.getBean("loginUserServiceImpl");
		System.err.println(loginServcie.findUserUSerName(""));
	}
	
	public final static String MD5(String s) {
	        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
	        try {
	            byte[] btInput = s.getBytes();
	            // ���MD5ժҪ�㷨�� MessageDigest ����
	            MessageDigest mdInst = MessageDigest.getInstance("MD5");
	            // ʹ��ָ�����ֽڸ���ժҪ
	            mdInst.update(btInput);
	            // �������
	            byte[] md = mdInst.digest();
	            // ������ת����ʮ�����Ƶ��ַ�����ʽ
	            int j = md.length;
	            char str[] = new char[j * 2];
	            int k = 0;
	            for (int i = 0; i < j; i++) {
	                byte byte0 = md[i];
	                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
	                str[k++] = hexDigits[byte0 & 0xf];
	            }
	            return new String(str);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	}
	//ע���û� md5(password)	�ύ salt 
	//����qq ����
	@Test
	public void md5test() {
		System.err.println("202CB962AC59075B964B07152D234B70".equals(MD5("123")));
		System.err.println(MD5("123"));
		String rannum = (int)((Math.random()*9+1)*10000)+"";
		System.err.println(rannum);
	}
	 
	
	//����qq ����
	@Test
	public void test() {
/*	    for (int i = 0; i < 100; i++) {
	    	 int rannum = (int)((Math.random()*9+1)*10000000);
	    	 System.out.println(rannum);
		}*/
		
		int rannum = 0;
		do {
			rannum = (int)((Math.random()*9+1)*10000000);
			System.out.println(1);
		} while (false);
	}
}
