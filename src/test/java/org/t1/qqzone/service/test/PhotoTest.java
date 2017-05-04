package org.t1.qqzone.service.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.t1.qqzone.domain.Album;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.Photo;
import org.t1.qqzone.service.PhotoService;
import org.t1.qqzone.util.AlbumID;
import org.t1.qqzone.util.PagenateArgs;
import org.t1.qqzone.util.SortDirectionEnum;

/**
 * 
 * 
 * 
 * @author ashy
 * 
 *         测试功能
 *
 */
public class PhotoTest {
	@Resource
	ApplicationContext ctx;
	@Resource
	SqlSessionFactory sqlSessionFactory;
	@Resource
	PhotoService photoService;

	@Test
	public void MybatisList() {
		System.out.println(sqlSessionFactory);
	}

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring-bean.xml", "spring-mybatis.xml");
		PhotoService photoService = (PhotoService) ac.getBean("photoServiceImpl");

		// 分页查询--相册内
		Map<String, Object> map = new HashMap<String, Object>();
		String albumid = "ceshi00001";
		PagenateArgs page = new PagenateArgs(0, 3, "rownum", SortDirectionEnum.DESC.toString());
		map.put("albumid", albumid);
		map.put("page", page);
		List<Photo> list = photoService.findPhotoByAlbumID(map);
		for (Photo photo : list) {
			System.err.println(photo);
		}
		System.err.println(
				"---------------------------------------------------------------------------------------------------------------------");

		// 获取ID
		String id = AlbumID.getUUID();

		
		//原图文件储存位置 pcontent/用户id/相册id/图片
		//压缩文件储存位置 thumbanil/用户id/相册id/图片
		// 添加
		Photo p = new Photo();
		Album album = new Album();
		Dic dic = new Dic();

		p.setPhotoid(id);
		p.setPname("添加照片测试");
		album.setAlbumId("ceshi00001");
		p.setAlbum(album);
		dic.setDicid("ceshi00001");
		p.setDic(dic);
		p.setPcreatetime(new Date());
		p.setPcontent("原图路径");
		p.setThumbanil("压缩图路径");

		photoService.insertPhoto(p);
		
		//修改
		

	}

}
