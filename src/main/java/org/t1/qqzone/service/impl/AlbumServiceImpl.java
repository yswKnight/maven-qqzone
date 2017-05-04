package org.t1.qqzone.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Album;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.persistence.AlbumMapper;
import org.t1.qqzone.persistence.DicMapper;
import org.t1.qqzone.persistence.UserMapper;
import org.t1.qqzone.service.AlbumService;
import org.t1.qqzone.util.PagenateArgs;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Resource
	AlbumMapper albumMapper;
	@Resource
	DicMapper dicMapper;
	@Resource
	UserMapper userMapper;

	@Override
	public List<Album> findAllAlumb(String userid) {
		// TODO Auto-generated method stub
		List<Album> list=albumMapper.findAllAlbum(userid);
		List<Album> list1=new ArrayList<Album>();
		for(Album a:list){
			Dic dic=new Dic();
			dic=dicMapper.getDicById(a.getDic().getDicid());
			a.setDic(dic);
			list1.add(a);
		}
		return list1;
	}

	@Override
	public Album getAlbumById(String albumId) {
		// TODO Auto-generated method stub
		return albumMapper.getAlbumById(albumId);
	}

	@Override
	public void insertAlbum(Album album) {
		// TODO Auto-generated method stub
		albumMapper.insertAlbum(album);
	}

	@Override
	public void updateAlbum(Album album) {
		// TODO Auto-generated method stub
		albumMapper.updateAlbum(album);
	}

	@Override
	public void deleteAlbum(String albumId) {
		// TODO Auto-generated method stub
		albumMapper.deleteAlbum(albumId);
	}

	@Override
	public List<Album> queryAlbumListWithPagenate(int pageIndex, int pageSize, String orderField, String orderDire) {
		PagenateArgs args = new PagenateArgs(pageIndex, pageSize, orderField, orderDire);
		List<Album> list = albumMapper.getListByPagenate(args);
		return list;
	}

	@Override
	public User findUserByAlbumid(String albumid) {
		// TODO Auto-generated method stub
		Album album=albumMapper.getAlbumById(albumid);
		User user=userMapper.getUserById(album.getUser().getUserid());
		return user;
	}

	@Override
	public void updateAlbumByCover(String albumid, String cover) {
		// TODO Auto-generated method stub
		Album album =new Album();
		album.setAlbumId(albumid);
		album.setCover(cover);
		this.albumMapper.updateAlbumByCover(album);
	}

}
