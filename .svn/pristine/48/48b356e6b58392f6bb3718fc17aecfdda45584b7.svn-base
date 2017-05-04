package org.t1.qqzone.service.test;



import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.LogAct;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.ActivityService;
import org.t1.qqzone.service.LogActService;

@ContextConfiguration(locations={"classpath:spring-bean.xml",
		"classpath:spring-mybatis.xml",
		})
@RunWith(SpringJUnit4ClassRunner.class)
public class LogActServiceTest {

	@Resource
	ApplicationContext ctx;
	@Resource
	SqlSessionFactory sqlSessionFactory;
	@Resource
	LogActService logActService;
	@Test
	public void MybatisList() {
		System.out.println(sqlSessionFactory);
	}
	
	public static void main(String[] args) {
		ApplicationContext	ac=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		LogActService logActService=(LogActService) ac.getBean("logActServiceImpl");
		//查看日志明细
				//System.err.println(logActService.getLogActById("0560AD434635451C8B2EF487F0FF19C9"));
		//查询所有日志
		//System.err.println(logActService.findLogActAll().toString());
		/*//添加日志
		LogAct logAct=new LogAct();
		logAct.setLogTitle("标题");
		logAct.setLogContent("内容");
		User user=new User();
		user.setUserid("2");
		logAct.setUser(user);		
		//添加日志动态
		Activity activity=new Activity();
		activity.setUser(user);
		logActService.addLogAct(logAct, activity);
		System.err.println(logActService.findLogActAll().toString());*/
		//删除日志
		//logActService.deleteLogAct("1");
		//System.err.println(logActService.findLogActAll().toString());
		
		//修改日志
		LogAct logAct=new LogAct();	
		logAct.setLogId("059FE16FA58D4380A175C38B6BCDD58F");
		logAct.setLogTitle("狗子");
		logAct.setLogContent("死了没");
		java.sql.Date swTime = new java.sql.Date(System.currentTimeMillis());
		logAct.setLogcreateTime(swTime);
		logActService.updateLogAct(logAct);
	}
}
