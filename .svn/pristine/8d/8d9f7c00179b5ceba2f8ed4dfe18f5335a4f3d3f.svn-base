package org.t1.qqzone.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/*****************
 * 
 * @author suixin
 *
 *
 *    msgId varchar(32) primary key,      #验证信息ID
       userId varchar(32),                 #用户ID
       Use_userId varchar(32),             #好友ID
       msg varchar(255),                   #验证信息内容
       msgCreateTime date,                 #发送验证信息时间
       status varchar(40)                  #状态 0为已处理
 *
 */
public class FriendMsg {

	//验证信息id
	private String msgid;
	//用户
	private User user;
	//好友
	private User useuser;
	//验证内容
	private String msg;
	//发出时间
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date msgcreatetime;
	//状态
	private String status;
	
	public String getMsgid() {
		return msgid;
	}
	public void setMsgid(String msgid) {
		this.msgid = msgid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getUseuser() {
		return useuser;
	}
	public void setUseuser(User useuser) {
		this.useuser = useuser;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getMsgcreatetime() {
		return msgcreatetime;
	}
	public void setMsgcreatetime(Date msgcreatetime) {
		this.msgcreatetime = msgcreatetime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
