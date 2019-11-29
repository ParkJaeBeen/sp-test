package com.sp.bdi.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.bdi.user.dao.UserDAO;
import com.sp.bdi.user.service.UserService;
import com.sp.bdi.user.vo.UserVO;

@Service("us")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO ud;
	@Override
	public List<Map<String, String>> getUserList() {
		return ud.SelectUserList();
	}
	@Override
	public List<UserVO> getUserVOList(UserVO param) {
		return ud.SelectUserVOList(param);
	}
	@Override
	public Map<String, String> insertUserInfo(UserVO user) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "회원가입 실패");
		rMap.put("url", "/views/user/list");
		if(ud.insertUserInfo(user) == 1) {
			rMap.put("cnt", ud.insertUserInfo(user)+"");
			rMap.put("msg", "회원가입 성공");
			rMap.put("url", "/views/user/list");
		}
		return rMap;
	}
	@Override
	public Map<String, String> deleteUserInfo(UserVO user) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "회원탈퇴 실패");
		rMap.put("url", "/views/user/list");
		if(ud.deleteUserInfo(user) == 1) {
			rMap.put("cnt", ud.deleteUserInfo(user)+"");
			rMap.put("msg", "회원탈퇴 성공");
			rMap.put("url", "/views/user/list");
		}
		return rMap;
	}
	@Override
	public Map<String, String> updateUserInfo(UserVO user) {
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("msg", "회원정보 수정 실패");
		rMap.put("url", "/views/user/list");
		if(ud.updateUserInfo(user) == 1) {
			rMap.put("cnt", ud.updateUserInfo(user)+"");
			rMap.put("msg", "회원정보 수정 성공");
			rMap.put("url", "/views/user/list");
		}
		return rMap;
	}
	@Override
	public UserVO login(UserVO user) {
		return ud.selectUserInfo(user);
	}

}