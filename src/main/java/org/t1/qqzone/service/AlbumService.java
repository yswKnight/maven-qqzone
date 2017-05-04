package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Album;
import org.t1.qqzone.domain.User;

public interface AlbumService {
	
	//查询Album列表
	public List<Album> findAllAlumb(String userid);
	
	//查询单个
	public Album getAlbumById(String albumId);
	
	//添加Album
	public void insertAlbum(Album album);
	
	//编辑Album
	public void updateAlbum(Album album);
	
	//删除
	public void deleteAlbum(String albumId);
	
	//设置封面
	public void updateAlbumByCover(String albumid,String cover);
	
	//分页查询
	/*
	 * 分页参数
	 */
	public List<Album> queryAlbumListWithPagenate(int pageIndex, int pageSize, String orderField, String orderDire);

	//根据相册查询user
	public User findUserByAlbumid(String albumid);
	
}
