package com.dj.personnel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.dj.personnel.pojo.Employee;
import com.dj.personnel.pojo.UserQuery;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper extends BaseMapper<Employee> {


    IPage<Employee> findAll(IPage<Employee> page, @Param("query") UserQuery query);
}
