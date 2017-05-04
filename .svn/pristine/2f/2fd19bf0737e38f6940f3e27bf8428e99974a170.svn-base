package org.t1.qqzone.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author wangchao 用户表
 */
public class User {
	private String userid;
	private Dic dic; // 字典
	private String username;// 用户名
	private String realname;// 真实姓名
	private String password;// 密码
	private String email;// 邮箱
	private Integer sex;// 性别
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date birthday;// 生日
	private String address;// 地址
	private String img;// 图片路径
	private String salt;//盐值
	private String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Dic getDic() {
		return dic;
	}

	public void setDic(Dic dic) {
		this.dic = dic;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", dic=" + dic + ", username=" + username + ", realname=" + realname
				+ ", password=" + password + ", email=" + email + ", sex=" + sex + ", birthday=" + birthday
				+ ", address=" + address + ", img=" + img + ", salt=" + salt + "]";
	}
}