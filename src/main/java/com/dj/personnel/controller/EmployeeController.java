package com.dj.personnel.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.Employee;
import com.dj.personnel.pojo.Job;
import com.dj.personnel.pojo.UserQuery;
import com.dj.personnel.service.EmployeeService;
import com.dj.personnel.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 员工
 */
@RestController
@RequestMapping("/employee/")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

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
            IPage<Employee> pageInfo = employeeService.findAll(iPage, UserQuery);
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
     * @param employee
     * @return
     */
    @PostMapping
    public ResultModel save(Employee employee) {
        try {
            employeeService.save(employee);
            return new ResultModel().success(employee);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 注册去重
     * @param employee
     * @return
     */
    @RequestMapping("findEmployeeByName")
    public Boolean findEmployeeByName(Employee employee) {
        try {
            QueryWrapper<Employee> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("name", employee.getName());
           Employee findEmployeeByName = employeeService.getOne(queryWrapper);
            return findEmployeeByName == null ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 修改用户信息
     *
     * @param employee 用户信息
     * @return
     * @URL PUT /users
     */
    @RequestMapping("update")
    public ResultModel update(Employee employee) {
        try {
            return new ResultModel().success(employeeService.updateById(employee));
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
    //@DeleteMapping
    @RequestMapping("deleteEmployee")
    public ResultModel deleteEmployee(Integer[] ids) {
        try {
            List<Integer> idsList = Arrays.asList(ids);
            employeeService.removeByIds(idsList);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }
}
