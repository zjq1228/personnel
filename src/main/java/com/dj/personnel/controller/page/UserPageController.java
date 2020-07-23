package com.dj.personnel.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserPageController {

    /**
     * 去登陆
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin(){
        return "/user/login";
    }



    /**
     * 去展示
     * @return
     */
    @RequestMapping("toShow")
    public String toShow() {
        return "/user/show";

    }

    /**
     * 去添加
     * @return
     */
    @RequestMapping("toAdd")
    public String toAdd(){
        return "user/add";
    }


    /**
     * 推出登陆
     * @param session
     * @return
     */
    @RequestMapping("out")
    public String out(HttpSession session){
        session.invalidate();
        return "/user/login";
    }
}
