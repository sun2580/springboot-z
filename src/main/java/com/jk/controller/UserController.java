package com.jk.controller;

import com.jk.model.User;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("userController")
public class UserController {
    private Integer userid;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Autowired
    private UserService userService;
    @Autowired
    private RedisTemplate redisTemplate;
    //查询
    @RequestMapping("selectUserList")
    @ResponseBody
    public List selectUserList(){
        List list = userService.selectUserList();
        redisTemplate.opsForValue().set("data",list);
        List list1 = (List) redisTemplate.opsForValue().get("data");
        return list;
    }
     //删除  deletedd
    @RequestMapping(value="/deleteuser")
    @ResponseBody
    public void  deleteuser(Integer userid){
        userService.deleteuser(userid);
    }
//添加  addxinwen
@RequestMapping(value="/addxinwen")
@ResponseBody
public void addxinwen( User user){
    userService.addxinwen(user);
}
//回显   queryByIdNews

    @RequestMapping(value = "queryByIdNews")
    @ResponseBody
    public User ueryByIdNews(Integer userid){
        return userService.queryByIdNews(userid);
    }


    @RequestMapping(value = "updateNews")
    @ResponseBody
    public void updateNews(User  user){
        userService.updateNews(user);
    }

}
