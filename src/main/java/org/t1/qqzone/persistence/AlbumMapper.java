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
	
	//��ѯ���
	public List<Album> findAllAlbum(String userid);
	
	//��ѯ����
	public Album getAlbumById(String albumId);
	
	//ɾ�����
	public void deleteAlbum(String albumId);
	
	//���÷���
	public void updateAlbumByCover(Album album);
	
	//�༭���
	public void updateAlbum(Album album);
	
	//�������
	public void insertAlbum(Album album);
	
	//��ҳ��ѯ
	public List<Album> getListByPagenate(PagenateArgs args);
	
	//��ѯ��¼��
	public Integer getListCount();
	
}