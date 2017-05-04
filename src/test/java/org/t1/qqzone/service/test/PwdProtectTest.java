package org.t1.qqzone.service.test;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.PwdProtect;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.PwdProtectService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-bean.xml",
		"classpath:spring-mybatis.xml",
		})
public class PwdProtectTest {

	@Resource
	ApplicationContext ctx;
	@Resource
	SqlSessionFactory sqlSessionFactory;
	@Resource
	PwdProtectService pwdProtectService;
	@Test
	public void MybatisList() {
		System.out.println(sqlSessionFactory);
	}
	
	public static void main(String[] args) {
		ApplicationContext	ac=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		PwdProtectService pwdProtectService=(PwdProtectService) ac.getBean("pwdProtectServiceImpl");
		
		
		
		//判断是否已有密保
		
		PwdProtect pwd = new PwdProtect();
		
		boolean isExist = pwdProtectService.judgePwdProtect("stu1");
		
		System.err.println(isExist+"==========================");
		
		
		/*//设置密保
		PwdProtect pwd1 = new PwdProtect();
		PwdProtect pwd2 = new PwdProtect();
		PwdProtect pwd3 = new PwdProtect();
		
		Dic dic1 = new Dic();
		dic1.setDicid("11");
		Dic dic2 = new Dic();
		dic2.setDicid("14");
		Dic dic3 = new Dic();
		dic3.setDicid("18");
		User user = new User();
		user.setUserid("stu1");
		
		pwd1.setUser(user);
		pwd1.setDic(dic1);
		pwd2.setUser(user);
		pwd2.setDic(dic2);
		pwd3.setUser(user);
		pwd3.setDic(dic3);
		
		pwd1.setAnswer("兰州");
		pwd2.setAnswer("啪啪啪");
		pwd3.setAnswer("金瓶梅");
		
		List<PwdProtect> list = new ArrayList<PwdProtect>();
		list.add(pwd1);
		list.add(pwd2);
		list.add(pwd3);
		
		pwdProtectService.setAnswers(list);*/
		
	}
}
