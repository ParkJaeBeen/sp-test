package com.sp.bdi.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.bdi.user.service.UserService;
import com.sp.bdi.user.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	@Autowired
	@Qualifier("us")
	private UserService us;

	@RequestMapping(value="/user/list/ajax",method=RequestMethod.GET)
	public @ResponseBody List<UserVO> getUserList(@ModelAttribute UserVO param) {
		log.debug("param : {}",param);
		return us.getUserVOList(param);
	}
	
	@RequestMapping(value="/user/list/ajax",method=RequestMethod.POST)
	public @ResponseBody Map<String,String> insertUser(@RequestBody UserVO user) {
		log.debug("user : {}",user);
		return us.insertUserInfo(user);
	}
	
	@RequestMapping(value="/user/list/ajax",method=RequestMethod.PUT)
	public @ResponseBody Map<String,String> updateUser(@RequestBody UserVO user) {
		log.debug("user : {}",user);
		return us.updateUserInfo(user);
	}
	
	@RequestMapping(value="/user/list/ajax",method=RequestMethod.DELETE)
	public @ResponseBody Map<String,String> deleteUser(@RequestBody UserVO user) {
		log.debug("user : {}",user);
		return us.deleteUserInfo(user);
	}
	
	@RequestMapping(value="/user/login",method=RequestMethod.POST)
	public @ResponseBody UserVO login(@RequestBody UserVO user, HttpSession hs) {
		log.debug("user : {}",user);
		user = us.login(user);
		log.debug("select user : {}", user);
		if(user != null) {
			hs.setAttribute("user", user);
		}
		return user;
	}
}
