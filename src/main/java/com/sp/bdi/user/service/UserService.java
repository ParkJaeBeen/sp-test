package com.sp.bdi.user.service;

import java.util.List;
import java.util.Map;

import com.sp.bdi.user.vo.UserVO;

public interface UserService {
	public List<Map<String,String>> getUserList();
	public List<UserVO> getUserVOList(UserVO param);
	public Map<String,String> insertUserInfo(UserVO user);
	public Map<String,String> deleteUserInfo(UserVO user);
	public Map<String,String> updateUserInfo(UserVO user);
	public UserVO login(UserVO user);
}
