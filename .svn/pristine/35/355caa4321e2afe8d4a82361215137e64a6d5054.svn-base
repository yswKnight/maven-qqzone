package org.t1.qqzone.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Photo;
import org.t1.qqzone.persistence.PhotoMapper;
import org.t1.qqzone.service.PhotoService;
import org.t1.qqzone.util.PagenateArgs;

@Service
public class PhotoServiceImpl implements PhotoService {
	
	@Resource
	PhotoMapper photoMapper;

	@Override
	public List<Photo> findPhotoByAlbumID(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return photoMapper.findPhotoByAlbumID(map);
	}

	@Override
	public void insertPhoto(Photo photo) {
		// TODO Auto-generated method stub
		photoMapper.insertPhoto(photo);
	}

	@Override
	public void deletePhoto(String photoid) {
		// TODO Auto-generated method stub
		photoMapper.deletePhoto(photoid);
	}

	@Override
	public void updatePhoto(Photo photo) {
		// TODO Auto-generated method stub
		photoMapper.updatePhoto(photo);
	}

	@Override
	public Photo findPhotoById(String photoid) {
		// TODO Auto-generated method stub
		return photoMapper.findPhotoById(photoid);
	}

	@Override
	public List<Photo> findPhoto(String albumid) {
		// TODO Auto-generated method stub
		List<Photo> list=null;
		try {
			list=photoMapper.findPhoto(albumid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deletePhotoByAlbumId(String albumid) {
		// TODO Auto-generated method stub
		photoMapper.deletePhotoByAlbumId(albumid);
	}

	@Override
	public Photo findPhotoPreviousPage(String albumid,String photoid) {
		// TODO Auto-generated method stub
		int rownum=0;
		Photo photo = photoMapper.findPhotoById(photoid);
		List<Photo> list=photoMapper.findPhoto(albumid);
		for(Photo p:list){
			if(photo.getPhotoid().equals(p.getPhotoid())){
				rownum=p.getRownum();
				if(rownum==1){
					rownum=2;
				}
			}
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("albumid", albumid);
		map.put("rownum", rownum);
		return photoMapper.findPhotoPreviousPage(map);
	}

	@Override
	public Photo findPhotoNextPage(String albumid, String photoid) {
		// TODO Auto-generated method stub
		int rownum=0;
		Photo photo = photoMapper.findPhotoById(photoid);
		List<Photo> list=photoMapper.findPhoto(albumid);
		int size=list.size();
		for(Photo p:list){
			if(photo.getPhotoid().equals(p.getPhotoid())){
				rownum=p.getRownum();
				if(rownum==size){
					rownum=size-1;
				}
			}
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("albumid", albumid);
		map.put("rownum", rownum);
		return photoMapper.findPhotoNextPage(map);
	}

}
