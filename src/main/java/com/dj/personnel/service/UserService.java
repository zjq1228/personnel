package com.dj.personnel.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.personnel.pojo.User;

import java.util.List;

public interface UserService extends IService<User> {

    List<User> findLevelShow(User user) throws Exception;

    User findUserByNameAndPwd(User user) throws Exception;


}
