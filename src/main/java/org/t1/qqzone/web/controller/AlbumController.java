package org.t1.qqzone.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Album;
import org.t1.qqzone.domain.Photo;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.ActivityService;
import org.t1.qqzone.service.AlbumService;
import org.t1.qqzone.service.DicService;
import org.t1.qqzone.service.PhotoService;
import org.t1.qqzone.util.AlbumID;

@Controller
@RequestMapping("album")
public class AlbumController {
	
	@Resource
	private AlbumService albumService;
	@Resource
	private PhotoService photoService;
	@Resource
	private DicService dicService;
	@Resource
	private ActivityService activityService;
	
	@RequestMapping("/newalbum")
	public String newalbum() {
		return "newAlbum";
	}
	
	//去修改
	@RequestMapping("/goupdateAlbum")
	public String goupdateAlbum(String id,ModelMap model){
		Album album=this.albumService.getAlbumById(id);
		model.addAttribute("album", album);
		return "newAlbum";
	}
	
	//根据相册ID查相册
	@RequestMapping("/getAlbumById")
	@ResponseBody
	public Album getAlbumById(String albumid){
		Album album=albumService.getAlbumById(albumid);
		return album;
	}
	
	//查询相册
	@RequestMapping("/showAlbum")
	@ResponseBody
	public List<Album> showAlbum(String userid){
		List<Album> list=albumService.findAllAlumb(userid);
		return list;
	}
	//删除前
	@RequestMapping("/predeleteAlbum")
	@ResponseBody
	public Map<String,Object> predeleteAlbum(String albumid){
		
		Map<String,Object> str=new HashMap<String,Object>();
		try {
			List<Photo> list=photoService.findPhoto(albumid);
			if(list.size()>0){
				str.put("status", "success1");
			}else{
				str.put("status", "success2");
			}
		} catch (Exception e) {
			str.put("status", "error");
		}
		return str;
	}
	//删除
	@RequestMapping("/deleteAlbum")
	@ResponseBody
	public Map<String,Object> deleteAlbum(String albumid){
		Map<String,Object> str=new HashMap<String,Object>();
		try {
		photoService.deletePhotoByAlbumId(albumid);
		albumService.deleteAlbum(albumid);
			str.put("status", "success");
		} catch (Exception e) {
			str.put("status", "error");
		}
		return str;
	}
	
	//相册封面
	@RequestMapping("/showphoto")
	@ResponseBody
	public Photo showphoto(String albumid){
		Photo photo=new Photo();
		List<Photo> p=photoService.findPhoto(albumid);
		if(p.size()>0){
			return p.get(0);
		}
		return photo;
	}
	
	//跳转设置相册封面
	@RequestMapping("/gocover")
	public String gocover(String albumid,ModelMap model){
		model.addAttribute("albumid", albumid);
		List<Photo> list=photoService.findPhoto(albumid);
		model.addAttribute("photos", list);
		return "/updateCover";
	}
	
	//设置封面
	@RequestMapping("/updateCover")
	@ResponseBody
	public Map<String,Object> updateCover(String albumid,String cover){
		Map<String,Object> str=new HashMap<String,Object>();
		try {
			this.albumService.updateAlbumByCover(albumid, cover);
			str.put("status", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			str.put("status", "error");
		}
		return str;
	}

	
	//添加相册--修改
	@RequestMapping("/addalbum")
	@ResponseBody
	public Map<String,Object> addalbum(Album album){
		Map<String,Object> str=new HashMap<String,Object>();
		try {
			// 获取ID
			String id = AlbumID.getUUID();
			if(album.getAlbumId()==""){
				album.setAlbumId(id);
				this.albumService.insertAlbum(album);
				str.put("status", "success");
			}else{
				this.albumService.updateAlbum(album);
				List<Photo> list=null;
				list=photoService.findPhoto(album.getAlbumId());
				for(Photo p:list){
					p.setDic(album.getDic());
					this.photoService.updatePhoto(p);
					//Activity activity=activityService.findActivityByPhoroId(p.getPhotoid());
				}
				str.put("status", "success");
			}
			
		} catch (Exception e) {
			str.put("status", "error");
		}
		return str;
	}
	
	@RequestMapping("/myalbum")
	public String myalbum() {
		return "myphoto";
	}
	
	//跳转相册内照片
	@RequestMapping("/gophoto")
	public String gophoto(String albumid,ModelMap model){
		System.err.println(albumid);
		//attr.addAttribute("albumid", albumid);
		model.addAttribute("albumid", albumid);
		List<Photo> list=photoService.findPhoto(albumid);
		model.addAttribute("photos", list);
		return "/showPhoto";
	}
	
	//根据相册查询出用户信息
	@RequestMapping("/findUserByAlbumid")
	@ResponseBody
	public User findUserByAlbumid(String albumid){
		User user=null;
		try {
			user=albumService.findUserByAlbumid(albumid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	

}
