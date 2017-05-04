package org.t1.qqzone.service;

import java.util.List;
import java.util.Map;

import org.t1.qqzone.domain.Photo;
import org.t1.qqzone.util.PagenateArgs;

public interface PhotoService {

	// 查询相册内照片
	public List<Photo> findPhotoByAlbumID(Map<String, Object> map);
	
	//查询所有
	public List<Photo> findPhoto(String albumid);

	// 添加照片
	public void insertPhoto(Photo photo);

	// 删除照片
	public void deletePhoto(String photoid);
	public void deletePhotoByAlbumId(String albumid);

	// 编辑照片
	public void updatePhoto(Photo photo);

	// 查询单个
	public Photo findPhotoById(String photoid);
	
	//上一张
	public Photo findPhotoPreviousPage(String albumid,String photoid);
	//下一张
	public Photo findPhotoNextPage(String albumid,String photoid);
	
	
}
