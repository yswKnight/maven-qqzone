package org.t1.qqzone.service;

import java.util.List;

import org.t1.qqzone.domain.Album;
import org.t1.qqzone.domain.User;

public interface AlbumService {
	
	//��ѯAlbum�б�
	public List<Album> findAllAlumb(String userid);
	
	//��ѯ����
	public Album getAlbumById(String albumId);
	
	//���Album
	public void insertAlbum(Album album);
	
	//�༭Album
	public void updateAlbum(Album album);
	
	//ɾ��
	public void deleteAlbum(String albumId);
	
	//���÷���
	public void updateAlbumByCover(String albumid,String cover);
	
	//��ҳ��ѯ
	/*
	 * ��ҳ����
	 */
	public List<Album> queryAlbumListWithPagenate(int pageIndex, int pageSize, String orderField, String orderDire);

	//��������ѯuser
	public User findUserByAlbumid(String albumid);
	
}
