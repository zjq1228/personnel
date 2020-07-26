package com.dj.personnel.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.personnel.mapper.DepartmentMapper;
import com.dj.personnel.pojo.Department;
import com.dj.personnel.service.DepartmentService;
import org.springframework.stereotype.Service;

@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements DepartmentService {

}
