package org.t1.qqzone.web.controller;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.t1.qqzone.domain.Dic;
import org.t1.qqzone.domain.FriendMsg;
import org.t1.qqzone.domain.PwdProtect;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.DicService;
import org.t1.qqzone.service.PwdProtectService;
import org.t1.qqzone.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private DicService dicService;

	@Autowired
	private PwdProtectService pwdProtectService;

	/**
	 * 图像切割(按指定起点坐标和宽高切割)
	 * 
	 * @param srcImageFile
	 *            源图像地址
	 * @param result
	 *            切片后的图像地址
	 * @param x
	 *            目标切片起点坐标X
	 * @param y
	 *            目标切片起点坐标Y
	 * @param width
	 *            目标切片宽度
	 * @param height
	 *            目标切片高度
	 * @throws IOException
	 */

	@RequestMapping("/user/updateImg")
	public String cut(@RequestParam("image_file") CommonsMultipartFile image_file, HttpServletRequest request,
			String srcImageFile, String result, int x, int y, int w, int h, ModelMap map) throws IOException {

		// 保存的文件路径
		String filePath = request.getSession().getServletContext().getRealPath("/") + "imgs/"
				+ image_file.getOriginalFilename();

		File saveDir = new File(filePath);
		if (!saveDir.getParentFile().exists())
			saveDir.getParentFile().mkdirs();

		// 转存文件
		try {
			image_file.transferTo(saveDir);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		// 原图路径
		srcImageFile = filePath;

		File srcImg = new File(srcImageFile);
		// 获取后缀名
		String suffix = srcImg.getName().substring(srcImg.getName().lastIndexOf(".") + 1);
		// 根据不同的后缀获取图片读取器
		Iterator<?> iterator = ImageIO.getImageReadersBySuffix(suffix);
		ImageReader reader = (ImageReader) iterator.next();

		InputStream in = new FileInputStream(srcImageFile);
		ImageInputStream iis = ImageIO.createImageInputStream(in);

		reader.setInput(iis, true);
		ImageReadParam param = reader.getDefaultReadParam();

		// 设置裁剪位置
		Rectangle rect = new Rectangle(x, y, w, h);
		param.setSourceRegion(rect);

		// 生成一个随机字符串ID
		UUID uid = UUID.randomUUID();
		// 把生成的ID转为字符串
		String id = uid.toString();
		// 将生成的ID所有字母转换为大写
		id = id.toUpperCase();
		// 将生成的ID中的”-“去掉
		id = id.replaceAll("-", "");
		// 编辑切图保存路径
		String imgsrc = request.getSession().getServletContext().getRealPath("/") + "imgs/" + id + ".jpg";

		// 保存数据库的图片路径
		String dbimgsrc = "imgs/" + id + ".jpg";

		// 保存裁剪后的图片
		BufferedImage bi = null;
		try {
			bi = reader.read(0, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			ImageIO.write(bi, suffix, new File(imgsrc));
		} catch (Exception e) {
			e.printStackTrace();
		}

		User user = new User();

		// 获取登录用户
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");

		user.setUserid(loginUser.getUserid());

		// 设置头像路径
		user.setImg(dbimgsrc);

		map.put("user", user);
		
	

		this.userService.updateImg(user);
		
		
		user = this.userService.getUserByUserId(loginUser.getUserid());
		session.setAttribute("loginUser", user);

		return "success";
	}

	/***************
	 * 
	 * 去个人设置界面
	 * 
	 * @return
	 */
	@RequestMapping("/user/toMinePersonnal.htm")
	public String toPersonnalSetInfo(ModelMap map, HttpSession session) {

		// 从session中获取当前登录用户
		User loginUser = (User) session.getAttribute("loginUser");

		// 去个人设置界面直接显示个人资料
		User user = this.userService.getUserByUserId(loginUser.getUserid());

		System.err.println(user);

		map.put("user", user);

		return "listMyMes";
	}

	/***************
	 * 
	 * 修改个人资料页面
	 * 
	 * @return
	 */
	public String toSetPersonnal(ModelMap map, HttpSession session) {

		// 从session中获取当前登录用户
		User loginUser = (User) session.getAttribute("user");

		// 去个人设置界面直接显示个人资料
		User user = this.userService.getUserByUserId(loginUser.getUserid());

		map.put("user", user);

		return "setPersonnal";
	}

	/**********
	 * 
	 * @return
	 * 
	 * 		去上传头像界面
	 * 
	 */
	@RequestMapping("/user/toUpdateImg.htm")
	public String toUpdateImg() {

		return "onupload";
	}

	/******************
	 * 
	 * @return
	 * 
	 * 		去设置密保界面
	 * 
	 */
	@RequestMapping("/user/toCrypToGraph.htm")
	public String toCrypToGraph(ModelMap map, HttpSession session) {

		// 从session获取登录用户
		User loginUser = (User) session.getAttribute("loginUser");
		// 判断他是否已经有密保
		boolean isExist = this.pwdProtectService.judgePwdProtect(loginUser.getUserid());
		if (isExist) {
			// 把问题查询出来直接传给前台
			List<Dic> questions = this.dicService.findQuestionsAll();
			map.put("questions", questions);
			// 添加标识
			map.put("falg", "yes");
		} else {
			// 添加标识
			map.put("falg", "no");
		}

		return "cryptograph";
	}

	/***************
	 * 
	 * @param question1
	 * @param question2
	 * @param question3
	 * @param answer1
	 * @param answer2
	 * @param answer3
	 * @return
	 * 
	 * 		设置密保
	 * 
	 */
	@RequestMapping("/user/setPersonnal.json")
	@ResponseBody
	public Map<String, Object> setPersonnal(String question1, String question2, String question3, String answer1,
			String answer2, String answer3, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		// 从session获取登录用户
		User loginUser = (User) session.getAttribute("loginUser");

		// 创建密保对象
		PwdProtect pwdpt = new PwdProtect();
		// 设置用户
		pwdpt.setUser(loginUser);
		// 设置问题
		Dic dic = new Dic();
		dic.setDicid(question1);

		pwdpt.setDic(dic);

		// 设置答案
		pwdpt.setAnswer(answer1);

		this.pwdProtectService.setAnswers(pwdpt);

		dic.setDicid(question2);
		pwdpt.setDic(dic);
		pwdpt.setAnswer(answer2);

		this.pwdProtectService.setAnswers(pwdpt);

		dic.setDicid(question3);
		pwdpt.setDic(dic);
		pwdpt.setAnswer(answer3);

		this.pwdProtectService.setAnswers(pwdpt);

		map.put("result", "success");

		return map;
	}
	/******************
	 * 
	 * @param msgId
	 * @return
	 * 
	 * 		根据ID查询详细信息
	 * 
	 */
	@RequestMapping("/user/find")
	@ResponseBody
	public Map<String, Object> getMsgByMsgId(String userid) {
		User user=this.userService.getUserByUserId(userid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("a", user);
		return map;
	}
}
