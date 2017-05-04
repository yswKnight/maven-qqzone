package org.t1.qqzone.service.test;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Say;
import org.t1.qqzone.domain.SayPhoto;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.ActivityService;
import org.t1.qqzone.service.SayService;

/*********************
 * 
 * @author wysheng
 * @param 测试类
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean.xml", "classpath:spring-mybatis.xml", })
public class SayTest {
	@Resource
	ApplicationContext ctx;
	@Resource
	SqlSessionFactory sqlSessionFactory;
	@Resource
	SayService sayService;
	@Resource
	 ActivityService activityService;

	@Test
	public void MybatisList() {
		System.out.println(sqlSessionFactory);
	}

	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring-bean.xml", "spring-mybatis.xml");
		SayService sayService = (SayService) ac.getBean("sayServiceImpl");
		Say say = new Say();
		User user = new User();
		Activity activity=new Activity();
		SayPhoto sayphoto=new SayPhoto();
		/*********************************************************************************************
		 * @param 发布说说测试
		 * 	insert into Activitys(actId,commId,sayId,logId,userId,photoId,dicId,actcreateTime) values(#{actid},#{comment.commid},#{say.sayid},#{log.logId},#{user.userid},#{photo.photoid},#{dic.dicid},#{actcreatetime})
		 */
		// 这是java.sql.date 所需要的添加时间的功能
		/*
		 * say.setSaycreatetime(new java.sql.Date(new
		 * java.util.Date().getTime()));
		 */
		
		
		/*user.setUserid("98e46cede8d84417b2167b511093eb84");
		say.setUserid(user);
		//插入说说内容
		say.setSaycontent("是的，终极版笨鸟先飞，蛋蛋，搞定");
		//添加照片地址
		sayphoto.setPhotosrc("imgs/qq.png");
		//添加说说动态
		activity.setUser(user);
		
		//将数据加进去
		sayService.addSay(say, activity,sayphoto);
		System.err.println(say.toString());
		System.err.println(activity.toString());
		System.err.println(sayphoto.toString());*/
		/*******************************************************************************
		 * @param根据用户ID查询测试
		 */
		
	//	System.err.println(sayService.listSayallForUserid("c82ef8d913bb428c911bbf444baa5de1"));

	/*	 System.err.println(sayService.listSayAll().toString()); */
		/******************
		 * @param根据sayID删除说说测试
		 */
		// sayService.deleteSay("cabad19c4376412ba8fbab11c3683bc6");
	}

}
