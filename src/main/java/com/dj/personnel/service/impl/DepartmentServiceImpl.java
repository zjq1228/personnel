package com.dj.personnel.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.personnel.mapper.DepartmentMapper;
import com.dj.personnel.pojo.Department;
import com.dj.personnel.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 部门service实现类
 */
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public void updateIsDel(Integer[] ids, Integer isDel) throws DataAccessException {
        departmentMapper.updateIsDel(ids, isDel);
    }

    @Override
    public List<Department> findDepartmentAll(Integer isDel) throws DataAccessException {
        return departmentMapper.findDepartmentAll(isDel);
    }
}
