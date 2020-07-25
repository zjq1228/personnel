package com.dj.personnel.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.Department;
import com.dj.personnel.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 部门Controller
 */
@RestController
@RequestMapping("/department/")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("show")
    public ResultModel<Object> list(Department department, Integer pageNo) {
        Map<String, Object> map = new HashMap<>();
        try {
            IPage<Department> page = new Page<>(pageNo, 5);
            QueryWrapper<Department> queryWrapper = new QueryWrapper<>();
            if (!StringUtils.isEmpty(department.getName())){

                queryWrapper.like("name", department.getName());
            }
            IPage<Department> pageInfo = departmentService.page(page, queryWrapper);
            map.put("pages", pageInfo.getPages());
            map.put("list", pageInfo.getRecords());
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }

    @RequestMapping("updateIsDel")
    public Map<String, Object> updateIsDel(@RequestParam("ids[]") Integer[] ids, Integer isDel) {
        Map<String, Object> map = new HashMap<>();
        try {
            departmentService.updateIsDel(ids, isDel);
            map.put("code", 200);
            map.put("msg", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("code", 500);
            map.put("msg", "服务器异常");
        }
        return map;
    }

    @RequestMapping("add")
    public ResultModel<Object> add(Department department) {
        try {
            QueryWrapper<Department> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("name", department.getName());
            Department departmentName = departmentService.getOne(queryWrapper);
            if(departmentName != null){
                return new ResultModel<>().error("部门名已存在");
            }
            departmentService.save(department);
            return new ResultModel<>().success();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }

}
