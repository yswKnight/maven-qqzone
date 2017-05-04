package org.t1.qqzone.domain;

import java.util.Date;

/**
 * 
 * 
 * @author Ashy
 * 
 * 照片实体类
 *
 */
public class Photo {
		
		private String photoid;         //照片ID
		private Dic dic;				 //权限
		private Album album;			 //所属相册
		private Date pcreatetime;		 //上传时间
		private String pname;			 //照片名称
		private String pcontent;		 //大图
		private String thumbanil;		 //小图
		private String describe;				//描述
		private int rownum;	
		//set and  get 方法
		
		
		public String getPhotoid() {
			return photoid;
		}
		public String getDescribe() {
			return describe;
		}
		public void setDescribe(String describe) {
			this.describe = describe;
		}
		public void setPhotoid(String photoid) {
			this.photoid = photoid;
		}
		public Dic getDic() {
			return dic;
		}
		public void setDic(Dic dic) {
			this.dic = dic;
		}
		public Album getAlbum() {
			return album;
		}
		public void setAlbum(Album album) {
			this.album = album;
		}
		public Date getPcreatetime() {
			return pcreatetime;
		}
		public void setPcreatetime(Date pcreatetime) {
			this.pcreatetime = pcreatetime;
		}
		public String getPname() {
			return pname;
		}
		public void setPname(String pname) {
			this.pname = pname;
		}
		public String getPcontent() {
			return pcontent;
		}
		public void setPcontent(String pcontent) {
			this.pcontent = pcontent;
		}
		public String getThumbanil() {
			return thumbanil;
		}
		public void setThumbanil(String thumbanil) {
			this.thumbanil = thumbanil;
		}
		
		public int getRownum() {
			return rownum;
		}
		public void setRownum(int rownum) {
			this.rownum = rownum;
		}
		//ToString方法
		@Override
		public String toString() {
			return "Photo [photoid=" + photoid + ", dic=" + dic + ", album=" + album + ", pcreatetime=" + pcreatetime
					+ ", pname=" + pname + ", pcontent=" + pcontent + ", thumbanil=" + thumbanil + ", rownum=" + rownum
					+ "]";
		}
		
		


}
