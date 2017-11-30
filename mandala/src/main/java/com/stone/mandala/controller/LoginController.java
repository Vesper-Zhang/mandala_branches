package com.stone.mandala.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.stone.mandala.pojo.User;
import com.stone.mandala.service.IUserService;

@Controller
@RequestMapping(value= "/login")
public class LoginController {

	@Resource
	private IUserService userService;
	
	@RequestMapping("/judge")
	public String judge(HttpServletRequest request, Model model) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		//判断用户名密码是否正确
		System.out.println("-------------judge user: ---------------" + userName +"");
		System.out.println("---------------judge password: -----------" + password +" ");
		User user = this.userService.getUserByName(userName);
		if(user != null) {
			String pwd = user.getPassword();
			if(pwd.equals(password)) {
				model.addAttribute("user", user);
				return "user/showUser";
			}else{
				return "error/error";
			}
		}else{
			return "error/error";
		}
	}
	
	@RequestMapping("/ajaxJudge")
	@ResponseBody
	public String ajaxJudge(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		//判断用户名密码是否正确
		System.out.println("-------------ajax judge user: ---------------" + userName +"");
		System.out.println("---------------ajax judge password: -----------" + password +" ");
		User user = this.userService.getUserByName(userName);
		//User user = this.userService.getUserById(1);
		if(user != null) {
			String pwd = user.getPassword();
			if(pwd.equals(password)) {
				map.put("judge", "1");
				String json = JSONObject.toJSONString(map);
				return json;
			}else{
				map.put("judge", "0");
				String json = JSONObject.toJSONString(map);
				return json;
			}
		}else{
			map.put("judge", "0");
			String json = JSONObject.toJSONString(map);
			return json;
		}
		
	}
	
	@RequestMapping("/loginSuccess")
	public String login(HttpServletRequest request) {
		return "user/userList";
	}
}
