package com.dj.personnel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.personnel.pojo.User;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {

    List<User> findLevelShow(User user) throws DataAccessException;

    User findUserByNameAndPwd(User user) throws DataAccessException;
}
