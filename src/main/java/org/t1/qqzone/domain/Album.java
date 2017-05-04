package org.t1.qqzone.domain;

/**
 * 
 * 
 * @author Ashy
 *
 *         albumId varchar(32) primary key, #���ID 
 *         dicId varchar(32), #Ȩ��ID
 *         userId varchar(32), #��ᴴ����ID 
 *         albumName varchar(40) #�������
 *			
 *
 */
public class Album {
	private String albumId;            // ���ID
	private Dic dic;                   // ���Ȩ��	����DIC�ֵ�
	private User user;                 // ��ᴴ����     �����û�
	private String albumName;          // �������
	private int rownum;					//��
	private String cover;				//����
	private String describe;				//����
	//SET AND GET����
	
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getAlbumId() {
		return albumId;
	}
	public void setAlbumId(String albumId) {
		this.albumId = albumId;
	}
	public Dic getDic() {
		return dic;
	}
	public void setDic(Dic dic) {
		this.dic = dic;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	//toString����
	@Override
	public String toString() {
		return "Album [albumId=" + albumId + ", dic=" + dic + ", user=" + user + ", albumName=" + albumName
				+ ", rownum=" + rownum + "]";
	}
	
	
	

}