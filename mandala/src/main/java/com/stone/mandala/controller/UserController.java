package com.stone.mandala.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.stone.common.utils.Request2ModelUtil;
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
		boolean flag = false;
		Map<String, Object> map = new HashMap<String, Object>();
//		Map<String, Object> paramsMap = WebUtils.getParametersStartingWith(request, null);
		User u = Request2ModelUtil.covert(User.class, request);
		if(u.getUserName() != null && !"".equals(u.getUserName())) {
			if(u.getAge() == null || "".equals(u.getAge())) {
				u.setAge(0);
			}
			this.userService.save(u);
			flag = true;
		}
		map.put("flag", flag);
		return JSONObject.toJSONString(map);
	}
	
	@RequestMapping("/toUserList")
	public String toUserList(HttpServletRequest request, Model model) {
		List<User> userList = this.userService.getList();
		model.addAttribute("userList", userList);
		return "user/userList";
	}
}
