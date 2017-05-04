package org.t1.qqzone.service.test;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.t1.qqzone.domain.Album;
import org.t1.qqzone.service.AlbumService;
import org.t1.qqzone.util.SortDirectionEnum;

/**
 * 
 * 
 * 
 * @author ashy
 * 
 * ���Թ���
 *
 */
public class AlbumTest {
	@Resource
	ApplicationContext ctx;
	@Resource
	SqlSessionFactory sqlSessionFactory;
	@Resource
	AlbumService albumService;
	@Test
	public void MybatisList() {
		System.out.println(sqlSessionFactory);
	}
	
	public static void main(String[] args) {
		ApplicationContext	ac=new ClassPathXmlApplicationContext("spring-bean.xml","spring-mybatis.xml");
		AlbumService albumService=(AlbumService) ac.getBean("albumServiceImpl");
		/*
		//��ȡID
		String albumId=AlbumID.getUUID();
		//System.err.println(AlbumID.getUUID());
		
		//��ѯ����
		System.err.println(albumService.findAllAlumb().toString());
		System.err.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++��һ����ѯ");
		
		//���
		Album album=new Album();
		Dic dic=new Dic();
		User user=new User();
		
		album.setAlbumId(albumId);
		album.setAlbumName("�������1");
		dic.setDicid("111");
		album.setDic(dic);
		user.setUserid("111");
		album.setUser(user);
		albumService.insertAlbum(album);
		
		System.err.println(albumService.findAllAlumb().toString());
		System.err.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++��Ӻ��ѯ");
		
		//�޸�
		album.setAlbumId(albumId);
		album.setAlbumName("�����޸����1");
		dic.setDicid("222");
		album.setDic(dic);
		user.setUserid("222");
		album.setUser(user);
		albumService.updateAlbum(album);
		
		System.err.println(albumService.findAllAlumb().toString());
		System.err.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++�޸ĺ��ѯ");
		
		
		//ɾ��
		albumService.deleteAlbum(albumId);
		
		System.err.println(albumService.findAllAlumb().toString());
		System.err.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ɾ�����ѯ");
		
		*/
		
		//��ҳ��ѯ
		List<Album> list=albumService.queryAlbumListWithPagenate(0, 3, "rownum", SortDirectionEnum.DESC.toString());
		for (Album album : list) {
	        System.err.println(album);
	    }
		
	}
	

}
