package com.dj.personnel.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.personnel.pojo.Employee;
import com.dj.personnel.pojo.UserQuery;
import org.apache.ibatis.annotations.Param;

public interface EmployeeService extends IService<Employee> {

    IPage<Employee> findAll(IPage<Employee> page, @Param("query") UserQuery query);
}
