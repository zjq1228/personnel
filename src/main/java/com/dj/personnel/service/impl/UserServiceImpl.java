package com.dj.personnel.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.personnel.mapper.UserMapper;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    //登陆
    @Override
    public User getOneUser(QueryWrapper<User> queryWrapper) {
        User user = this.getOne(queryWrapper);
        return user;
    }


}
