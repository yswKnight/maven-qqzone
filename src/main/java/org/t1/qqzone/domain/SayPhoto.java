package org.t1.qqzone.domain;

/***********
 * 
 * @author wysheng
 * @param  ˵˵����
 */
public class SayPhoto {
	
	
	         private String sayphotoid;	//˵˵��Ƭid
	         private Say sayid;				//˵˵id�������
             private String photosrc;		//��Ƭ��ַ
             
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
