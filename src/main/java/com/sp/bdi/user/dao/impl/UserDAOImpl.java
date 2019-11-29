package com.sp.bdi.user.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sp.bdi.user.dao.UserDAO;
import com.sp.bdi.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSessionFactory ssf;
	@Override
	public List<Map<String, String>> SelectUserList() {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.bdi.dao.UserInfoMapper.selectUserInfoList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}
	@Override
	public List<UserVO> SelectUserVOList(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectList("com.sp.bdi.dao.UserInfoMapper.selectUserInfoList",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}
	@Override
	public int insertUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.insert("com.sp.bdi.dao.UserInfoMapper.insertUserInfo",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			ss.close();
		}
		return 0;
	}
	
	@Override
	public int deleteUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.delete("com.sp.bdi.dao.UserInfoMapper.deleteUserInfo",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			ss.close();
		}
		return 0;
	}
	@Override
	public int updateUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.update("com.sp.bdi.dao.UserInfoMapper.updateUserInfo",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			ss.close();
		}
		return 0;
	}
	@Override
	public UserVO selectUserInfo(UserVO user) {
		SqlSession ss = ssf.openSession();
		try {
			return ss.selectOne("com.sp.bdi.dao.UserInfoMapper.selectUserInfo",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}
}
