package org.t1.qqzone.domain;

/**
 * @author suixin
 */
public class PwdProtect {

	// �ܱ�id
	private String pid;
	// �û�
	private User user;
	// ����id
	private Dic dic;
	
	private String questionId; 
	// ��
	private String answer;
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Dic getDic() {
		return dic;
	}
	public void setDic(Dic dic) {
		this.dic = dic;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	@Override
	public String toString() {
		return "PwdProtect [pid=" + pid + ", user=" + user + ", dic=" + dic + ", dicId=" + questionId + ", answer=" + answer
				+ "]";
	}
}