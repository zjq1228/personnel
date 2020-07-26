package com.dj.personnel.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.personnel.pojo.User;

public interface UserService extends IService<User> {

    //登陆
    User getOneUser(QueryWrapper<User> queryWrapper) throws Exception;


}
