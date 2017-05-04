package org.t1.qqzone.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

/****************
 * 
 * @author suixin actId varchar(32) primary key, #动态ID commId varchar(32), #评论ID
 *         sayId varchar(32), #说说ID logId varchar(32), #日志ID userId varchar(32),
 *         #用户ID photoId varchar(32), #图片ID dicId varchar(32), #字典ID
 *         actcreateTime date #发布时间
 *
 */
public class Activity {

	// 动态id
	private String actid;
	// 评论
	private List<Comment> comments;
	// 说说
	private Say say;
	// 日志
	private LogAct log;
	// 用户
	private User user;
	// 照片
	private Photo photo;
	// 动态类型(字典)
	private Dic dic;
	// Date转化为Json数据的处理代码
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone ="GMT+08:00")
	private Date actcreatetime;
	// 点赞数
	private long praise;
	// 点赞用户集合
	private List<User> listUser;

	public List<User> getListUser() {
		return listUser;
	}

	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}

	public String getActid() {
		return actid;
	}

	public void setActid(String actid) {
		this.actid = actid;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Say getSay() {
		return say;
	}

	public void setSay(Say say) {
		this.say = say;
	}

	public LogAct getLog() {
		return log;
	}

	public void setLog(LogAct log) {
		this.log = log;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public Dic getDic() {
		return dic;
	}

	public void setDic(Dic dic) {
		this.dic = dic;
	}

	public Date getActcreatetime() {
		return actcreatetime;
	}

	public void setActcreatetime(Date actcreatetime) {
		this.actcreatetime = actcreatetime;
	}

	public long getPraise() {
		return praise;
	}

	public void setPraise(long praise) {
		this.praise = praise;
	}

}
