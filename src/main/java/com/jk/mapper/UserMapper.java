package com.jk.mapper;

import com.jk.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface UserMapper {
    @Select("select * from user")
    List<User> selectUserList();

    @Delete("delete from user where userid = #{userid}")
    void deleteuser(Integer userid);
     @Insert("insert into user values(#{userid},#{username},#{userpass})")
    void addxinwen(User user);
    @Select("select * from user where userid=#{userid}")
    User queryByIdNews(Integer userid);
    @Update("update user set username=#{username},userpass=#{userpass} where userid =#{userid}")
    void updateNews(User user);

}