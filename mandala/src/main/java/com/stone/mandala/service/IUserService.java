package com.stone.mandala.service;

import java.util.List;

import com.stone.mandala.pojo.User;

public interface IUserService {
	public User getUserById(int userId);

	public User getUserByName(String userName);

	public List<User> getList();

	public void save(User user);
}