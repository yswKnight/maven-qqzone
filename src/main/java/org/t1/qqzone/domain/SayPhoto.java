package org.t1.qqzone.domain;

/***********
 * 
 * @author wysheng
 * @param  说说相册表
 */
public class SayPhoto {
	
	
	         private String sayphotoid;	//说说照片id
	         private Say sayid;				//说说id（外键）
             private String photosrc;		//照片地址
             
			public String getSayphotoid() {
				return sayphotoid;
			}
			public void setSayphotoid(String sayphotoid) {
				this.sayphotoid = sayphotoid;
			}
			public Say getSayid() {
				return sayid;
			}
			public void setSayid(Say sayid) {
				this.sayid = sayid;
			}
			public String getPhotosrc() {
				return photosrc;
			}
			public void setPhotosrc(String photosrc) {
				this.photosrc = photosrc;
			}
			@Override
			public String toString() {
				return "SayPhoto [sayphotoid=" + sayphotoid + ", sayid=" + sayid + ", photosrc=" + photosrc + "]";
			}
             
             
}
