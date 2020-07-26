package com.dj.personnel.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.personnel.pojo.Department;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * 部门Service接口
 */
public interface DepartmentService extends IService<Department> {

    void updateIsDel(@Param("ids") Integer[] ids, @Param("isDel") Integer isDel) throws DataAccessException;

    List<Department> findDepartmentAll(Integer isDel) throws DataAccessException;
}
