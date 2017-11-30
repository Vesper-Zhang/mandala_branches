package com.stone.mandala.dao;

import java.util.List;

import com.stone.mandala.pojo.User;


public interface IUserDao {
	int deleteById(Integer id);

	int insert(User record);

	int insertSelective(User record);

	User selectById(Integer id);

	int updateByIdSelective(User record);

	int updateById(User record);

	User getUserByName(String userName);

	List<User> getList();
}