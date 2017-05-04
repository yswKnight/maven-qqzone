package org.t1.qqzone.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/***********
 * 
 * @author suixin
 * 
 * 	   COMMID varchar(32) primary key,     #����ID
       userId varchar(32),               			 #�û�ID
       dicId varchar(32),                  #��������
       Com_commid int,                     #�ظ�����
       actId varchar(32),                  #��̬ID    
       toUser varchar(40),                 #�������۵��û�
       commcreateTime date,                #��������ʱ��
       commContent varchar(4000),          #��������
       corder int                          #��������
 *
 */
public class Comment {

	//����id
	private String commid;
	//�������۵��û�
	private User giveuser;
	//��������(�ֵ�)
	private Dic dic;
	//�ظ�����
	private String comcommid;
	//��̬id
	private String actid;
	//�������۵��û�
	private User adoptuser;
	//�������۵�ʱ��
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date commcreatetime;
	//��������
	private String commcontent;
	//��������
	private Integer corder;
	
	private Integer newcorder;//Ϊ�������ӵ������ֶ�
	
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
