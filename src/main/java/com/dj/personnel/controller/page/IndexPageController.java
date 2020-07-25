package com.dj.personnel.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexPageController {


    @RequestMapping("/toIndex")
    public String toIndex(){
        return "/index/index";
    }

    @RequestMapping("/toTop")
    public String toTop(){
        return "/index/top";
    }

    @RequestMapping("/toLeft")
    public String toLeft(){
        return "/index/left";
    }

    @RequestMapping("/toRight")
    public String toRight(){
        return "/index/right";
    }
}
