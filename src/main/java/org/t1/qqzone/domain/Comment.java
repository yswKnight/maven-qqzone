package org.t1.qqzone.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/***********
 * 
 * @author suixin
 * 
 * 	   COMMID varchar(32) primary key,     #评论ID
       userId varchar(32),               			 #用户ID
       dicId varchar(32),                  #评论类型
       Com_commid int,                     #回复评论
       actId varchar(32),                  #动态ID    
       toUser varchar(40),                 #接受评论的用户
       commcreateTime date,                #发布评论时间
       commContent varchar(4000),          #评论内容
       corder int                          #评论排序
 *
 */
public class Comment {

	//评论id
	private String commid;
	//发出评论的用户
	private User giveuser;
	//评论类型(字典)
	private Dic dic;
	//回复评论
	private String comcommid;
	//动态id
	private String actid;
	//接受评论的用户
	private User adoptuser;
	//发布评论的时间
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date commcreatetime;
	//评论内容
	private String commcontent;
	//评论排序
	private Integer corder;
	
	private Integer newcorder;//为新增增加的特殊字段
	
	public Integer getNewcorder() {
		return newcorder;
	}
	public void setNewcorder(Integer newcorder) {
		this.newcorder = newcorder;
	}
	public String getCommid() {
		return commid;
	}
	public void setCommid(String commid) {
		this.commid = commid;
	}
	public User getGiveuser() {
		return giveuser;
	}
	public void setGiveuser(User giveuser) {
		this.giveuser = giveuser;
	}
	public Dic getDic() {
		return dic;
	}
	public void setDic(Dic dic) {
		this.dic = dic;
	}
	public String getComcommid() {
		return comcommid;
	}
	public void setComcommid(String comcommid) {
		this.comcommid = comcommid;
	}
	public String getActid() {
		return actid;
	}
	public void setActid(String actid) {
		this.actid = actid;
	}
	public User getAdoptuser() {
		return adoptuser;
	}
	public void setAdoptuser(User adoptuser) {
		this.adoptuser = adoptuser;
	}
	public Date getCommcreatetime() {
		return commcreatetime;
	}
	public void setCommcreatetime(Date commcreatetime) {
		this.commcreatetime = commcreatetime;
	}
	public String getCommcontent() {
		return commcontent;
	}
	public void setCommcontent(String commcontent) {
		this.commcontent = commcontent;
	}
	public Integer getCorder() {
		return corder;
	}
	public void setCorder(Integer corder) {
		this.corder = corder;
	}
	@Override
	public String toString() {
		return "Comment [giveuser=" + giveuser +
			", adoptuser=" + adoptuser + "]";
	}
	
	
}
