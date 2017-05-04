package org.t1.qqzone.service.test;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-bean.xml",
		"classpath:spring-mybatis.xml",
		})
public class UserServiceTest {

	@Resource
	ApplicationContext ctx;
	@Resource
	SqlSessionFactory sqlSessionFactory;
	@Resource
	UserService userService;
	@Test
	public void MybatisList() {
		System.out.println(sqlSessionFactory);
	}
	
	public static void main(String[] args) {
		ApplicationContext	ac=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		UserService userService=(UserService) ac.getBean("userServiceImpl");
		User u=new User();

		//查询用户资料
		
		u=userService.getUserByUserId("b4e49d5785ed4bbaa1e5b97ed4288b3f");
		System.err.println(u.toString());
		

		/*u.setUserid("stu1");
		u.setImg("img/imgg.jpg");
		userService.updateImg(u);*/
		
		/*//修改个人资料
		u.setUserid("stu1");
		u.setRealname("ry");
		u.setEmail("123@163.com");
		u.setBirthday(new Date());
		u.setAddress("sssss");
		userService.updateUser(u);
		System.err.println(u.toString());*/
		
		/*修改头像路径
		 * u.setUserid("stu1");
		u.setImg("/imgs/test.jpg");*/
		
		/*修改密码
		 * u.setUserid("stu1");
		u.setPassword("111111");
		userService.updatePwd(u);*/
		
	}
}
