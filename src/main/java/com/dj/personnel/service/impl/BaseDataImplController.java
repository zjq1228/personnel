package com.dj.personnel.service.impl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 基础数据表跳转
 */
@RequestMapping("/base")
@Controller
public class BaseDataImplController {

    @RequestMapping("toShow")
    private String toAjaxShow(Model model) throws Exception {
        return "/ztree/ztree_show";
    }

    @RequestMapping("toAdd")
    public String toAdd(Integer parentId, Model model) throws Exception {
        model.addAttribute("parentId" ,parentId);
        return "/ztree/add_base";
    }


}
