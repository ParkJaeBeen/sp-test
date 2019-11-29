package com.sp.bdi.user.dao;

import java.util.List;
import java.util.Map;

import com.sp.bdi.user.vo.UserVO;

public interface UserDAO {
	public List<Map<String,String>> SelectUserList();
	public List<UserVO> SelectUserVOList(UserVO user);
	public int insertUserInfo(UserVO user);
	public int deleteUserInfo(UserVO user);
	public int updateUserInfo(UserVO user);
	public UserVO selectUserInfo(UserVO user);
}
