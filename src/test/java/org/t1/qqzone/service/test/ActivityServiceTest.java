package org.t1.qqzone.service.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.service.ActivityService;
import org.t1.qqzone.util.Page;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean.xml", "classpath:spring-mybatis.xml", })
public class ActivityServiceTest {

	@Resource
	ApplicationContext ctx;
	@Resource
	SqlSessionFactory sqlSessionFactory;
	@Resource
	ActivityService activityService;

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring-bean.xml", "spring-mybatis.xml");
		ActivityService activityService = (ActivityService) ac.getBean("activityServiceImpl");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", 1);
		map.put("userId", "8A181D205DB64525A558ACCE83B58D32");
		
		Page<Activity> page = activityService.findAllActivitys(map);
		
		List<Activity> list = page.getResult();
		for(Activity act:list){
			System.err.println("===="+act.getComments().toString());
		}
	}
}
