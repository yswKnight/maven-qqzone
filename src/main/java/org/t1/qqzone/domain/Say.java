package org.t1.qqzone.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Say {

	/***********
	 * 
	 * @author wysheng
	 * @param  ˵˵��
	 */
      private String sayid ;   			//˵˵ID
	  private User userid ;  			//�û�ID
	  private String   saycontent;    //˵˵����   
	  //Dateת��ΪJson���ݵĴ������
	  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone ="GMT+08:00")
	  private Date  saycreatetime;  //˵˵����ʱ��   
	  private String photosrc;
	  

	public String getSayid() {
		return sayid;
	}
	public void setSayid(String sayid) {
		this.sayid = sayid;
	}
	public User getUserid() {
		return userid;
	}
	public void setUserid(User userid) {
		this.userid = userid;
	}
	public String getSaycontent() {
		return saycontent;
	}
	public void setSaycontent(String saycontent) {
		this.saycontent = saycontent;
	}
	public Date getSaycreatetime() {
		return saycreatetime;
	}
	public void setSaycreatetime(Date saycreatetime) {
		this.saycreatetime = saycreatetime;
	}
	
	
	public String getPhotosrc() {
		return photosrc;
	}
	public void setPhotosrc(String photosrc) {
		this.photosrc = photosrc;
	}
	@Override
	public String toString() {
		return "Say [sayid=" + sayid + ", userid=" + userid + ", saycontent=" + saycontent + ", saycreatetime="
				+ saycreatetime + "]";
	}
	
	
	  
	
	  
	  
	                                                        
	                                                        
}                                                           
                                                            