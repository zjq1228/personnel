package com.dj.personnel.controller.page;



import com.dj.personnel.pojo.Job;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.JobService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/job/")
public class JobPageController {
    @Autowired
    private JobService jobService;

    @RequestMapping("toShow")
    public String toShow(){
        return "job/show";
    }
    @RequestMapping("toInsert")
    public String toInsert(){
        return "job/add";
    }
    @RequestMapping("toUpdate")
    public String toUpdate(Model model, Integer id){
        Job job = jobService.getById(id);
        model.addAttribute("job",job);
        return "job/update";
    }

}
