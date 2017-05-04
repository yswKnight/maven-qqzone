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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.LoginUserService;

@Controller
@RequestMapping("/loginuser")
public class LoginUserController {
	@Autowired
	private LoginUserService loginUserService;
	
	@RequestMapping(value="/tologin")
	@ResponseBody
	public Map<String, Object> login(User user,HttpSession httpSession){
		this.status = "error";
		if(null != user){
			User loginuser = loginUserService.userLogin(user);
			if(null != loginuser){
				if(httpSession.getAttribute("userid")== null){
					this.status = "success";
					httpSession.setAttribute("loginUser", loginuser);
				}
			}
		}
		this.jsonResult.put("status", status);
		return this.jsonResult;
	}
	
	@RequestMapping(value="/save")
	@ResponseBody
	public Map<String, Object> save(User user,HttpSession httpSession){
		
		System.err.println(user.toString());
		this.status = "error";
		if(null != user){
			String date = user.getDate();
			Date newdate = getDate(date);
			if(null == newdate){
				newdate = new Date();
			}
			user.setBirthday(newdate);
			String loginuser = loginUserService.insertUser(user);
			if(null != loginuser){
				this.jsonResult.put("username", loginuser);
				status= "success";
			}
		}
		this.jsonResult.put("status", status);
		return jsonResult;
	}
	
	public Date getDate(String date){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm");
		Date newdate = null;
		try {
			newdate = df.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return newdate;
	};
	
	@RequestMapping(value="/exitLogin")
	public String exitLogin(HttpSession httpSession){
		httpSession.removeAttribute("loginUser");
		return "index";
	}
	@RequestMapping(value="/toindex")
	public String toindex(){
		return "index";
	}
	
	@RequestMapping(value="/toOK/{num}",method = RequestMethod.GET)
	public String toOK(@PathVariable("num")Integer num ,ModelMap modelMap){
		modelMap.put("username", num);
		return "ok";
	}
	
	@RequestMapping(value="/tohome")
	public String tohome(){
		return "home";
	}
	
	@RequestMapping(value="/toregist")
	public String toregist(){
		return "register";
	}
	@RequestMapping(value="/toforget")
	public String toforget(){
		return "forget";
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
