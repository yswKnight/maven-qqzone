package org.t1.qqzone.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.Say;
import org.t1.qqzone.domain.SayPhoto;
import org.t1.qqzone.persistence.ActivityMapper;
import org.t1.qqzone.persistence.SayMapper;
import org.t1.qqzone.persistence.SayPhotoMapper;
import org.t1.qqzone.service.SayService;

/*************************
 * @author wysheng
 */
@Service
public class SayServiceImpl implements SayService {
	
	@Resource
	private SayMapper saymapper;
	@Resource
	private ActivityMapper activityMapper;
	@Resource
	private SayPhotoMapper sayphotomapper;
	
	
	/*******************************************************************************
	 *  @author wysheng
	 * @param  根据userid查看对应说说
	 */
	@Override
	public List<Say> listSayallForUserid(String userid) {
		return saymapper.findSayallForUserid(userid);
	}
	/******************************************************************************
	 * @author wysheng
	 * @param  根据ID查看用户说说
	 */
	@Override
	public Say listSayForSayid(String sayid) {

		return saymapper.findSayForSayid(sayid);
	}
	/***********************
	 * @author wysheng
	 * @param  根据sayid查看对应说说照片
	 */
	@Override
	public List<SayPhoto> listSayImg(String sayid) {
		
		return sayphotomapper.findSayImg(sayid);
	}
	/******************************************************************************
	 * @param  添加说说,并且同步到好友动态里
	 */
	@Override
	public void addSay(Say say,Activity activity,SayPhoto  sayphoto) {
		/**********************************说说id*********************/
		// 生成一个随机字符串ID
		UUID uuid = UUID.randomUUID();
		// 把id转换为一个字符串
		String id = uuid.toString();
		// 将生成的ID所有字母转换为大写
		id = id.toLowerCase();
		// 将生成的ID中的“-”去掉
		id = id.replaceAll("-", "");
		//数据插入
		say.setSayid(id);
		//在动态里添加说说id
		Say say2=new Say();
		say2.setSayid(id);
		activity.setSay(say2);
		/**********************************相册id*********************/
				// 生成一个随机字符串ID
				UUID uuid3 = UUID.randomUUID();
				// 把id转换为一个字符串
				String id3= uuid3.toString();
				// 将生成的ID所有字母转换为大写
				id3= id3.toLowerCase();
				// 将生成的ID中的“-”去掉
				id3= id3.replaceAll("-", "");
				//数据插入
				sayphoto.setSayphotoid(id3);
				//在相册里添加相册id
				Say say3=new Say();
				say3.setSayid(id);
				sayphoto.setSayid(say3);
				System.err.println("说说："+id);
				System.err.println("相册："+id3);
		/******************************动态id*************************/
		//添加说说动态ID
				// 生成一个随机字符串ID
				UUID uuid1 = UUID.randomUUID();
				// 把id转换为一个字符串
				String id1 = uuid1.toString();
				// 将生成的ID所有字母转换为大写
				id1 = id1.toLowerCase();
				// 将生成的ID中的“-”去掉
				id1= id1.replaceAll("-", "");
				///////将生成的此id添加到动态ID
				activity.setActid(id1);
				//因为说说动态是在字典里 的编号是31.因此将他添加进去
				Dic dic=new Dic();
				dic.setDicid("21");
				activity.setDic(dic);
				
				//说说时间插入
				
				//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				say.setSaycreatetime(new Date());
				//动态时间插入
				activity.setActcreatetime(new Date());
				//在动态表里把数据加进去
				activityMapper.addActivity(activity);
				//在说说表里把数据加进去
				saymapper.insertSay(say);
				//在说说照片表里把数据添加进去
				sayphotomapper.insertSayPhoto(sayphoto);
	}
	/************************************************************************************
	 * @param 删除说说
	 */
	@Override
	public void deleteSay(String sayid) {
		try {
			if(sayid!=null){
				saymapper.deleteSay(sayid);
			}
		} catch (Exception e) {
			System.out.println("没有此条说说");
		}
		
	}



}
