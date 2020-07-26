package com.dj.personnel.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.Department;
import com.dj.personnel.pojo.Employee;
import com.dj.personnel.pojo.UserQuery;
import com.dj.personnel.service.DepartmentService;
import com.dj.personnel.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门
 */
@RestController
@RequestMapping("/department/")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    /**
     * 展示
     *
     * @param UserQuery
     * @return
     */
    @RequestMapping("show")
    public ResultModel show(UserQuery UserQuery) {
        Map<String, Object> map = new HashMap<>();
        try {
            //当前页，每页条数
            IPage iPage = new Page(UserQuery.getPageNo(), UserQuery.getPageSize());
            QueryWrapper<Department> queryWrapper = new QueryWrapper<>();
            if (!(UserQuery.getName() == null) && !"".equals(UserQuery.getName())) {
                queryWrapper.like("name", UserQuery.getName());
            }
            IPage pageInfo = departmentService.page(iPage, queryWrapper);
            map.put("pages", pageInfo.getPages());//总页数
            map.put("list", pageInfo.getRecords());//数据结果
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常，请稍后再试");
        }
    }
    /**
     * 新增
     *
     * @param department
     * @return
     */
    @PostMapping
    public ResultModel save(Department department) {
        try {
            departmentService.save(department);
            return new ResultModel().success(department);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 注册去重
     * @param department
     * @return
     */
    @RequestMapping("findDepartmentByName")
    public Boolean findDepartmentByName(Department department) {
        try {
            QueryWrapper<Department> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("name", department.getName());
            Department findEmployeeByName = departmentService.getOne(queryWrapper);
            return findEmployeeByName == null ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 修改部门信息
     *
     * @param department 部门信息
     * @return
     */
    @RequestMapping("update")
    public ResultModel update(Department department) {
        try {
            return new ResultModel().success(departmentService.updateById(department));
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }
    /**
     * 删除职位
     *
     * @param ids 用户ID
     * @return
     * @URL DELETE /user/id
     */
    @RequestMapping("deleteDepartment")
    public ResultModel deleteDepartment(Integer[] ids) {
        try {
            List<Integer> idsList = Arrays.asList(ids);
            departmentService.removeByIds(idsList);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }
}
