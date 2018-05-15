package com.jk.service;

import com.jk.model.User;

import java.util.List;

public interface UserService {
    List<User> selectUserList();


    void deleteuser(Integer userid);

    void addxinwen(User user);


    void updateNews(User user);

    User queryByIdNews(Integer userid);
}
