package org.t1.qqzone.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.t1.qqzone.domain.Activity;
import org.t1.qqzone.domain.Album;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.Photo;
import org.t1.qqzone.service.ActivityService;
import org.t1.qqzone.service.AlbumService;
import org.t1.qqzone.service.PhotoService;
import org.t1.qqzone.util.AlbumID;
import org.t1.qqzone.util.ImgCompressUtil;

@Controller
@RequestMapping("photo")
public class PhotoController {

	@Resource
	private PhotoService photoService;
	@Resource
	private AlbumService albumService;
	@Resource
	private ActivityService activityService;
	
	
	
	//上传图片
	@RequestMapping("uploadAndInsertPhoto")
	public String uploadAndInsertPhoto(HttpServletRequest request, HttpServletResponse response,String albumid)
			throws IllegalStateException, IOException {
		
		try {
			// 创建一个通用的多部分解析器
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getSession().getServletContext());
			// 判断 request 是否有文件上传,即多部分请求
			if (multipartResolver.isMultipart(request)) {
				// 转换成多部分request
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				// 取出一个list的multipartfile
				List<MultipartFile> files = multiRequest.getFiles("files[]");
				for (MultipartFile multipartFile : files) {
					// 记录上传过程起始时的时间，用来计算上传时间
					// int pre = (int) System.currentTimeMillis();
					// 取得上传文件
					if (multipartFile != null) {
						// 获取图片的文件名
						String myFileName = multipartFile.getOriginalFilename();
						// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
						if (myFileName.trim() != "") {
							// 获取图片的扩展名
							String extensionName = myFileName.substring(myFileName.lastIndexOf(".") + 1);
							String extensionPName = myFileName.substring(0,myFileName.lastIndexOf("."));
							// 新的图片文件名 = 获取时间戳+"."图片扩展名
							String newFileName = String.valueOf(System.currentTimeMillis()) + "." + extensionName;
							// 定义上传路径
							String path = request.getServletContext().getRealPath("/") + "imgs/temp/demo/srcImg/"
									+ newFileName;
							File localFile = new File(path);
							if (!localFile.exists()) {
								//创建目录  
								localFile.mkdir();
							}
							//图片转存
							multipartFile.transferTo(localFile);
							//压缩图片路径
							String distImgPath = request.getSession().getServletContext().getRealPath("/")
									+ "imgs/temp/demo/distImg/" + "resize" + newFileName;
							File distFile = new File(distImgPath);
							if (!distFile.exists()) {
								//创建目录  
								distFile.mkdir();
							}
							//压缩图片
							ImgCompressUtil.resizeImage(path, distImgPath, 200, 200);
							System.err.println(path);
							System.err.println(distImgPath);

							//保存数据库
							// 获取ID
							String id = AlbumID.getUUID();
							//原图文件储存位置 pcontent/用户id/相册id/图片
							//压缩文件储存位置 thumbanil/用户id/相册id/图片
							// 添加
							Photo p = new Photo();
							Album album = albumService.getAlbumById(albumid);
							p.setPhotoid(id);
							p.setPname(extensionPName);
							//album.setAlbumId("ceshi00001");
							p.setAlbum(album);
							p.setDic(album.getDic());
							p.setPcreatetime(new Date());
							p.setPcontent("imgs/temp/demo/srcImg/" + newFileName);
							p.setThumbanil("imgs/temp/demo/distImg/" + "resize" + newFileName);
							if (album.getCover().equals("")) {
								album.setCover("imgs/temp/demo/distImg/" + "resize" + newFileName);
								albumService.updateAlbum(album);
							}
							photoService.insertPhoto(p);
							
							Activity activity=new Activity();
							activity.setActid(AlbumID.getUUID());
							activity.setPhoto(p);
							activity.setDic(album.getDic());
							activity.setUser(album.getUser());
							activity.setActcreatetime(new Date());
							activityService.insertActivityByPhoto(activity);

						}
					}
					// 记录上传该文件后的时间
					// int finaltime = (int) System.currentTimeMillis();
					// System.out.println(finaltime - pre);
				}

			} 
		} catch (Exception e) {
			// TODO: handle exception
			return "error";
		}
		return "success";
	}
	
	//查询相册内照片
	@RequestMapping("/getphotos")
	@ResponseBody
	public List<Photo> getphotos(String albumid){
		List<Photo> list=photoService.findPhoto(albumid);
		return list;
	}
	
	//去修改
	@RequestMapping("/goupdatephoto")
	public String goupdatephoto(String id,ModelMap model){
		Photo photo=photoService.findPhotoById(id);
		model.addAttribute("photo", photo);
		return "newphoto";
	}
	//修改
	@RequestMapping("/updatephoto")
	@ResponseBody
	public Map<String,Object> updatephoto(Photo photo){
		Map<String,Object> str=new HashMap<String,Object>();
		try {
			this.photoService.updatePhoto(photo);
			str.put("status", "success");
		} catch (Exception e) {
			str.put("status", "error");
		}
		return str;
	}
	//删除
	@RequestMapping("/deletephoto")
	@ResponseBody
	public Map<String,Object> deletephoto(String photoid){
		Map<String,Object> str=new HashMap<String,Object>();
		try {
			photoService.deletePhoto(photoid);
			str.put("status", "success");
		} catch (Exception e) {
			str.put("status", "error");
		}
		return str;
	}
	
	//查看单个
	@RequestMapping("/getPhotoById")
	@ResponseBody
	public Photo getPhotoById(String photoid){
		
		Photo photo;
		try {
			photo = photoService.findPhotoById(photoid);
		} catch (Exception e) {
			return null;
		}
		return photo;
	}

	//上一个
	@RequestMapping("/previousPage")
	@ResponseBody
	public Photo previousPage(String photoid,String albumid){
		
		Photo photo;
		try {
			photo = photoService.findPhotoPreviousPage(albumid, photoid);
		} catch (Exception e) {
			return null;
		}
		return photo;
	}
	//下一个NextPage
	@RequestMapping("/nextPage")
	@ResponseBody
	public Photo nextPage(String photoid,String albumid){
		
		Photo photo;
		try {
			photo = photoService.findPhotoNextPage(albumid, photoid);
		} catch (Exception e) {
			return null;
		}
		return photo;
	}
	
	
	@RequestMapping("/toUpload")
	public String toUpload() {
		//return "showPhoto";
		return "upload";
	}
	
	@RequestMapping("/toShow")
	public String toShow() {
		//return "showPhoto";
		return "showPhoto";
	}
	
	@RequestMapping("/ceshiShow")
	public String ceshiShow(String albumid,String photoid, ModelMap model) {
		//return "showPhoto";
		model.addAttribute("albumid", albumid);
		model.addAttribute("photoid", photoid);
		return "showImgs";
	}
	
	@RequestMapping("/toaddPhoto")
	public String toaddPhoto(String albumid, ModelMap model) {
		//return "showPhoto";
		model.addAttribute("albumid", albumid);
		return "albumupload";
	}
	
}
