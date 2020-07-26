package com.dj.personnel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.personnel.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {

    List<User> findLevelShow(@Param("user") User user, @Param("user1")User user1) throws DataAccessException;

    User findUserByNameAndPwd(User user) throws DataAccessException;
}
