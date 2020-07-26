package com.dj.personnel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.personnel.pojo.Department;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.awt.print.Book;
import java.util.List;

/**
 * 部门mapper接口
 */
public interface DepartmentMapper extends BaseMapper<Department> {

    void updateIsDel(@Param("ids") Integer[] ids, @Param("isDel") Integer isDel) throws DataAccessException;

    List<Department> findDepartmentAll(Integer isDel) throws DataAccessException;

}
