package org.t1.qqzone.domain;

import java.sql.Date;

/**
 * @author zhengkang
 *#��־��
 */
public class LogAct {
	
	private String logId;//��־ID
	private User user;//�û�ID
	private String logTitle;//��־����
	private String logContent;//��־����
	private Date logcreateTime;//��־����ʱ��  
	
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}


	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getLogTitle() {
		return logTitle;
	}
	public void setLogTitle(String logTitle) {
		this.logTitle = logTitle;
	}
	public String getLogContent() {
		return logContent;
	}
	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}

	public Date getLogcreateTime() {
		return logcreateTime;
	}
	public void setLogcreateTime(Date logcreateTime) {
		this.logcreateTime = logcreateTime;
	} 
	@Override
	public String toString() {
		return "LogAct [logId=" + logId + ", user=" + user + ", logTitle=" + logTitle + ", logContent=" + logContent
				+ ", logcreateTime=" + logcreateTime + "]";
	}
	
}