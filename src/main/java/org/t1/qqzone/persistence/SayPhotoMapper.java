package org.t1.qqzone.persistence;

import java.util.List;

import org.t1.qqzone.domain.SayPhoto;

/*************
 * 
 * @author wysheng
 *
 */
public interface SayPhotoMapper {
		
		//����sayid�鿴��Ӧ˵˵��Ƭ
		public List<SayPhoto> findSayImg(String sayid);
		//���˵˵��Ƭ
		public void insertSayPhoto(SayPhoto sayphoto);
		
		
}
