package org.t1.qqzone.domain;

/**********************
 * 
 * @author suixin
 * 
 *         praId varchar(32) primary key, #赞ID 
 *         actId varchar(32), #动态ID 
 *         userId varchar(32) #点赞者ID
 *
 */

public class Praise {

	// 赞id
	private String praid;
	//动态id
	private String actid;
	//点赞者
	private User user;
	
	public String getPraid() {
		return praid;
	}
	public void setPraid(String praid) {
		this.praid = praid;
	}
	public String getActid() {
		return actid;
	}
	public void setActid(String actid) {
		this.actid = actid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "Praise [praid=" + praid + ", actid=" + actid + ", user=" + user.toString() + "]";
	}
	
}
