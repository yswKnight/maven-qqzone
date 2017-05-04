package org.t1.qqzone.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.t1.qqzone.domain.PwdProtect;
import org.t1.qqzone.domain.User;
import org.t1.qqzone.service.LoginUserService;
import org.t1.qqzone.util.CaptchaUtil;
import org.t1.qqzone.util.Protectpwd;


@Controller
@RequestMapping("/forget")
public class ForgetController {
	
	@Autowired
	private LoginUserService loginUserService;
	
	@RequestMapping("/toForget")
	public String toUpdateImg() {
		return "forget";
	}

	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	@ResponseBody
	public void captcha(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CaptchaUtil.outputCaptcha(request, response);
	}
	
	@RequestMapping(value = "/validate", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> validate(String yanzhen,HttpSession httpSession){
		this.status ="error";
		String val = (String) httpSession.getAttribute("randomString");
		if(null != val){
			if(val.equals(yanzhen)){
				this.status ="success";
			}
		}
		this.jsonResult.put("status", status);
		return this.jsonResult;
	}
	
	@RequestMapping(value="/tovalidate/{username}",method = RequestMethod.GET)
	public String toOK(@PathVariable("username")String username ,ModelMap modelMap,HttpSession httpSession){
		modelMap.put("username", username);
		modelMap.put("dic", this.loginUserService.findForget());
		httpSession.setAttribute("validateprotectKey", "ok");
		return "forget2";
	}
	
	@RequestMapping(value="/question",method = RequestMethod.POST)
	public String protect(Protectpwd protectpwd,ModelMap modelMap,HttpSession httpSession){
		List<PwdProtect> lists =  this.loginUserService.finduserIdGetProcte(protectpwd.getUsername());
		int i = 0;
		int j = 0;
		String key = (String) httpSession.getAttribute("validateprotectKey");
		if("ok".equals(key)){
			httpSession.removeAttribute("validateprotectKey");
			if(lists.size()>0){
				for(PwdProtect pwdProtect:lists){
					j= 0;
					if(pwdProtect.getQuestionId().equals(protectpwd.getDicId1())){
						if(j == -1){
							 continue;
						}
						j = -1;
						if(pwdProtect.getAnswer().equals(protectpwd.getArw1())){
							i=i+1;
						}
					}
					if(pwdProtect.getQuestionId().equals(protectpwd.getDicId2())){
						if(j == -1){
							 continue;
						}
						
						j = -1;
						
						if(pwdProtect.getAnswer().equals(protectpwd.getArw2())){
							i=i+1;
						}
					}
					if(pwdProtect.getQuestionId().equals(protectpwd.getDicId3())){
						if(j == -1){
							 continue;
						}
						j = -1;
						
						if(pwdProtect.getAnswer().equals(protectpwd.getArw3())){
							i=i+1;
						}
					}
				}
				if(i>=3){
					modelMap.put("username",protectpwd.getUsername());
					httpSession.setAttribute("protectKey", "ok");
					return "forget3";
				}
			}
		}else{
			httpSession.removeAttribute("validateprotectKey");
			return "forget" ;
		}
		httpSession.removeAttribute("validateprotectKey");
		return "errorforget" ;
	}
	
	
	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatepass(User user,HttpSession httpSession){
		this.status ="error";
		String key = (String) httpSession.getAttribute("protectKey");
		if("ok".equals(key)){
			if(null != user){
				String isok = this.loginUserService.updateUser(user);
				if("success".equals(isok)){
					
					this.status="success";
				}
			}
		}
		httpSession.removeAttribute("protectKey");
		this.jsonResult.put("status", status);
		return this.jsonResult;
	}
	
	@RequestMapping(value = "/tosuccess", method = RequestMethod.GET)
	public String tosuccess(User user,HttpSession httpSession){
		return "yesforget";
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
