package org.t1.qqzone.domain;

/**
 * 
 * 
 * @author Ashy
 *
 *         albumId varchar(32) primary key, #相册ID 
 *         dicId varchar(32), #权限ID
 *         userId varchar(32), #相册创建者ID 
 *         albumName varchar(40) #相册名称
 *			
 *
 */
public class Album {
	private String albumId;            // 相册ID
	private Dic dic;                   // 相册权限	关联DIC字典
	private User user;                 // 相册创建者     关联用户
	private String albumName;          // 相册名称
	private int rownum;					//列
	private String cover;				//封面
	private String describe;				//描述
	//SET AND GET方法
	
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
	//toString方法
	@Override
	public String toString() {
		return "Album [albumId=" + albumId + ", dic=" + dic + ", user=" + user + ", albumName=" + albumName
				+ ", rownum=" + rownum + "]";
	}
	
	
	

}