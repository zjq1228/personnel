package com.dj.personnel.controller.page;

import com.dj.personnel.pojo.User;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserPageController {
    @Autowired
    private UserService userService;

    @RequestMapping("toLogin")
    public String toLogin(){
        return "user/login";
    }
    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("out")
    public String out(HttpSession session) {
        session.invalidate();
        return "user/login";
    }
    @RequestMapping("toShow")
    public String toShow(){
        return "user/show";
    }
    @RequestMapping("toInsert")
    public String toInsert(){
        return "user/add";
    }
    @RequestMapping("toUpdate")
    public String toUpdate(Model model, Integer id){
        User user = userService.getById(id);
        model.addAttribute("user",user);
        return "user/update";
    }


}
