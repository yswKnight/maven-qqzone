package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.Album;
import org.t1.qqzone.util.PagenateArgs;


/**
 * 
 * 
 * 
 * @author Ashy
 *
 */
public interface AlbumMapper {
	
	//查询相册
	public List<Album> findAllAlbum(String userid);
	
	//查询单个
	public Album getAlbumById(String albumId);
	
	//删除相册
	public void deleteAlbum(String albumId);
	
	//设置封面
	public void updateAlbumByCover(Album album);
	
	//编辑相册
	public void updateAlbum(Album album);
	
	//添加相册
	public void insertAlbum(Album album);
	
	//分页查询
	public List<Album> getListByPagenate(PagenateArgs args);
	
	//查询记录数
	public Integer getListCount();
	
}
