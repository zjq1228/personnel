package com.dj.personnel.controller.page;

import com.dj.personnel.pojo.Department;
import com.dj.personnel.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 部门pageController
 */
@Controller
@RequestMapping("/department/")
public class DepartmentPageController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("toShow")
    public String toShow(){
        return "/department/show";
    }

    @RequestMapping("toAdd")
    public String toAdd() {
        return "/department/add";
    }
}
