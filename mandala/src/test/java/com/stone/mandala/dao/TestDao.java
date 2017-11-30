package com.stone.mandala.dao;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.stone.mandala.pojo.User;
  
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
  
public class TestDao {  
    private static Logger logger = Logger.getLogger(TestDao.class);  
 
    @Resource  
    private IUserDao userDao = null;  
  
    @Test  
    public void test1() {  
        User user = userDao.selectById(1);  
        logger.info(JSON.toJSONString(user));  
    }
    
    @Test
    public void getByName() {
    	String userName = "zhangxg";
    	userDao.getUserByName(userName);
    }
    
    @Test
    public void getList() {
    	userDao.getList();
    }
    
    @Test
    public void save() {
    	String userName = "wulitaotao";
    	String password = "123";
    	Integer age = 18;
    	User user = new User();
    	user.setUserName(userName);
    	user.setPassword(password);
    	user.setAge(age);
    	int id = userDao.insert(user);
//    	int id = userDao.insertSelective(user);
    	System.out.println("-------------------------------id: " + id);
    }
} 