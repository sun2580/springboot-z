package com.jk.service.impl;

import com.jk.mapper.UserMapper;
import com.jk.model.User;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> selectUserList() {

        return userMapper.selectUserList();
    }

    @Override
    public void deleteuser(Integer userid) {
        userMapper.deleteuser(userid);
    }

    @Override
    public void addxinwen(User user) {
        userMapper.addxinwen(user);
    }

    @Override
    public User queryByIdNews(Integer userid) {

        return userMapper.queryByIdNews(userid);
    }

    @Override
    public void updateNews(User user) {
        System.err.println("kkkkkkkkkkkkkk"+user);
        userMapper.updateNews(user);
    }


}
