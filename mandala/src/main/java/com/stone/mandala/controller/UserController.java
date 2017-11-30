package com.stone.mandala.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.stone.mandala.pojo.User;
import com.stone.mandala.service.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private IUserService userService;
	
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request) {
		List<User> userList = this.userService.getList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("userList", userList);
		mav.setViewName("user/showUser");
		return "user/showUser";
	}
	
	@RequestMapping("/showUserList")
	@ResponseBody
	public String getUserList() {
		List<User> userList = this.userService.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userList", userList);
		String json = JSONObject.toJSONString(map);
		return json;
	}
	
	/**
	 * 跳转到添加用户页面
	 * @return
	 */
	@RequestMapping("/toAddUser")
	public String toAddUser() {
		return "user/addUser";
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public String addUser(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String name = request.getParameter("userName");
		String password = request.getParameter("password");
		String age = request.getParameter("age");
		User user = new User();
		if(name != null && !"".equals(name)) {
			user.setUserName(name);
			user.setPassword(password);
			if(age != null && !"".equals(age)) {
				user.setAge(Integer.valueOf(age));
			}else{
				user.setAge(0);
			}
			this.userService.save(user);
			map.put("success", "1");
			
		}else{
			map.put("success", "0");
		}
		return JSONObject.toJSONString(map);
	}
	
	@RequestMapping("/toUserList")
	public String toUserList(HttpServletRequest request) {
		return "user/userList";
	}
}
