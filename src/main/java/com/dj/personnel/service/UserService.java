package com.dj.personnel.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.personnel.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService extends IService<User> {

    List<User> findLevelShow(@Param("user") User user, @Param("user1")User user1) throws Exception;

    User findUserByNameAndPwd(User user) throws Exception;


}
