package com.stone.mandala.service.impl;  
  
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.stone.mandala.dao.IUserDao;
import com.stone.mandala.pojo.User;
import com.stone.mandala.service.IUserService;
  
@Service("userService")  
public class UserServiceImpl implements IUserService {  
    @Resource  
    private IUserDao userDao;  
    
    @Override
    public User getUserById(int userId) {  
        return this.userDao.selectById(userId);  
    }

	@Override
	public User getUserByName(String userName) {
		return this.userDao.getUserByName(userName);
	}

	@Override
	public List<User> getList() {
		return this.userDao.getList();
	}

	@Override
	public void save(User user) {
        this.userDao.insert(user);		
	}  
  
} 