package com.dj.personnel.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.personnel.mapper.UserMapper;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> findLevelShow(User user, User user1, Integer[] ids) throws Exception {
        return userMapper.findLevelShow(user, user1, ids);
    }

    @Override
    public User findUserByNameAndPwd(User user) throws Exception {
        return userMapper.findUserByNameAndPwd(user);
    }
}
