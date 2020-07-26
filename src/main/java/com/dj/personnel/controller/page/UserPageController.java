package com.dj.personnel.controller.page;

import com.dj.personnel.config.SysConstant;
import com.dj.personnel.pojo.BaseData;
import com.dj.personnel.service.BaseDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/user/")
public class UserPageController {

    @Autowired
    private BaseDataService baseDataService;

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
    public String toShow(Model model, Integer id) throws Exception {
        List<BaseData> parentIdBM = baseDataService.findBaseParentId(SysConstant.BASE_PARENTID_4);
        model.addAttribute("id", id);
        model.addAttribute("parentIdBM", parentIdBM);
        return "/user/show";

    }

    /**
     * 去添加
     * @return
     */
    @RequestMapping("toAdd")
    public String toAdd(){
        return "/user/add";
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
