package org.t1.qqzone.domain;

/***************************
 * 
 * @author suixin
 * 
 * 	   friendId varchar(32) primary key,   #��ˮ��
 *     userId varchar(32),                		   #�û�ID
 *     Use_userId varchar(32)            	   #����ID
 *
 */

public class Friend {

	private String friendid;
	//�û�id
	private String userid;
	//����
	private User user;
	
	
	public String getFriendid() {
		return friendid;
	}
	public void setFriendid(String friendid) {
		this.friendid = friendid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
