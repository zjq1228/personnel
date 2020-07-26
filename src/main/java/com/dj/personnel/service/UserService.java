package com.dj.personnel.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.personnel.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService extends IService<User> {

    List<User> findLevelShow(User user, User user1, Integer[] ids) throws Exception;

    User findUserByNameAndPwd(User user) throws Exception;


}
