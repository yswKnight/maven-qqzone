package org.t1.qqzone.service.test;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.t1.qqzone.domain.Comment;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.CommentService;

public class CommentServiceTest {
	@Test
	public void save() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		CommentService commentService = (CommentService) ctx.getBean("CommentServiceImpl");
		Comment comment = new Comment();
		commentService.save(comment);
	}
	
	@Test
	public void getCommentCorder() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		CommentService commentService = (CommentService) ctx.getBean("commentServiceImpl");
		System.err.println(commentService.getCommentCorder());
	}
	
	public static void main(String[] args) {
//		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
//		CommentService commentService = (CommentService) ctx.getBean("commentServiceImpl");
//		System.err.println(commentService.getCommentCorder());

		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		CommentService commentService = (CommentService) ctx.getBean("commentServiceImpl");
		int corder =commentService.getCommentCorder()+1;
		int newcorder = corder;
		Comment comment = new Comment();
		
		User giveuser = new User();
		giveuser.setUserid("8edb68926f094017b569f1ca99648747");
		comment.setGiveuser(giveuser);
		
		Dic dic = new Dic();
		dic.setDicid(21+"");
		comment.setDic(dic);
		
		comment.setComcommid("0e4431355f964fbc9aa046889c3c7a6c");
		
		comment.setActid("0e4431355f964fbc9aa046889c3c7a6c");
		User user = new User();
		
		user.setUserid("8edb68926f094017b569f1ca99648747");
		comment.setAdoptuser(user);
		
		comment.setCommcontent("test");
		
		comment.setNewcorder(newcorder);
		
		commentService.save(comment);
		
//		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
//		CommentService commentService = (CommentService) ctx.getBean("commentServiceImpl");
//		commentService.deleteComment("test3132");
		
	}
	
	@Test
	public void deleteComment() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		CommentService commentService = (CommentService) ctx.getBean("commentServiceImpl");
		System.err.println();
	}
}
