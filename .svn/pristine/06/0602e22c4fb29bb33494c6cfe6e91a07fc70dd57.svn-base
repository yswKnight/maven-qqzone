package org.t1.qqzone.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.LoginUserService;
import org.t1.qqzone.util.UserUtil;


/**@author wangchao 阿坑
 * 个人问题 修改
 * 
 * 
 */
@Controller
@RequestMapping("/personalData")
public class PersonalDataController {
	@Autowired
	private LoginUserService loginUserService;
	
	
	@RequestMapping(value="/toPersonalData")
	public String toPersonalData(HttpSession httpSession,ModelMap modelMap){
		User user = (User) httpSession.getAttribute("loginUser");
		if(null != user){
			User users = this.loginUserService.findByUserName(user.getUsername());
			System.err.println(users.toString()+"===========================");
			modelMap.put("user", users);
		}
		return "updateMymess";
	}
	
	@RequestMapping(value="/toPersonalPass")
	public String toPersonalPass(){
		return "updatePssword";
	}
	
	
	/**@author wangchao 阿坑
	 * @see getAddress	省
	 * @see getImg 市
	 * @see getSalt 区
	 */
	@RequestMapping(value="/updatePersonalData")
	public String updatePersonalData(User user){
		if(null != user){
			Date newdate = this.getDate(user.getDate());
			user.setBirthday(newdate);
			String address = user.getAddress()+user.getImg()+user.getSalt();
			user.setAddress(address);
			this.loginUserService.updateUserData(user);
			return "listMyMes";
		}
		return "errormymess";
	}
	
	public Date getDate(String date){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date newdate = null;
		try {
			newdate = df.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return newdate;
	};
	
	@RequestMapping(value="/updatePersonalPass")
	@ResponseBody
	public Map<String, Object> updatePersonalPass(UserUtil userUtil,HttpSession httpSession){
		this.status = "error";
		User user = (User) httpSession.getAttribute("loginUser");
		if(null != userUtil && null != user){
			if(null !=  user.getUsername()){
				userUtil.setUsername(user.getUsername());
				if("success".equals(this.loginUserService.updateUserForPass(userUtil))){
					status = "success";
				};
			}
		}
		this.jsonResult.put("status", status);
		return jsonResult;
	}
	
	private Map<String, Object> jsonResult = new HashMap<String, Object>();
	private String status;
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}
}
