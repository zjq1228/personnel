package com.dj.personnel.controller.page;



import com.dj.personnel.pojo.Employee;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.EmployeeService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee/")
public class EmployeePageController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("toShow")
    public String toShow(){
        return "employee/show";
    }
    @RequestMapping("toInsert")
    public String toInsert(){
        return "employee/add";
    }
    @RequestMapping("toUpdate")
    public String toUpdate(Model model, Integer id){
        Employee employee = employeeService.getById(id);
        model.addAttribute("employee",employee);
        return "employee/update";
    }

}
