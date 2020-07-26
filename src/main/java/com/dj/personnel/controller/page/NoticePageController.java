package com.dj.personnel.controller.page;



import com.dj.personnel.pojo.Notice;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.NoticeService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice/")
public class NoticePageController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping("toShow")
    public String toShow(){
        return "notice/show";
    }
    @RequestMapping("toInsert")
    public String toInsert(){
        return "notice/add";
    }
    @RequestMapping("toUpdate")
    public String toUpdate(Model model, Integer id){
        Notice notice = noticeService.getById(id);
        model.addAttribute("notice",notice);
        return "notice/update";
    }
    @RequestMapping("toSee")
    public String toSee(Model model, Integer id){
        Notice notice = noticeService.getById(id);
        model.addAttribute("notice",notice);
        return "notice/see";
    }

}
