package org.t1.qqzone.persistence;

import java.util.List;
import java.util.Map;

import org.t1.qqzone.domain.Photo;

public interface PhotoMapper {
	
	//查询分页相册内照片
	public List<Photo> findPhotoByAlbumID(Map<String,Object> map);
	
	//查看单个照片
	public Photo findPhotoById(String photoid);
	
	//查看相册类所有
	public List<Photo> findPhoto(String albumid);
	
	//上传照片
	public void insertPhoto(Photo photo);
	
	//上一张
	public Photo findPhotoPreviousPage(Map<String, Object> page);
	//下一张
	public Photo findPhotoNextPage(Map<String, Object> page);
	
	//删除照片
	public void deletePhoto(String photoid);
	public void deletePhotoByAlbumId(String albumid);
	
	//编辑照片
	public void updatePhoto(Photo photo);
	

}
