package com.dj.personnel.controller.page;



import com.dj.personnel.pojo.Department;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.DepartmentService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/department/")
public class DepartmentPageController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("toShow")
    public String toShow(){
        return "department/show";
    }
    @RequestMapping("toInsert")
    public String toInsert(){
        return "department/add";
    }
    @RequestMapping("toUpdate")
    public String toUpdate(Model model, Integer id){
        Department  department = departmentService.getById(id);
        model.addAttribute("department",department);
        return "department/update";
    }

}
