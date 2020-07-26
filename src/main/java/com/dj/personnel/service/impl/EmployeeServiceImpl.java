package com.dj.personnel.service.impl;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.personnel.mapper.EmployeeMapper;
import com.dj.personnel.pojo.Employee;
import com.dj.personnel.pojo.UserQuery;
import com.dj.personnel.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;


    @Override
    public IPage<Employee> findAll(IPage<Employee> page, UserQuery query) {
        return employeeMapper.findAll(page, query);
    }
}
