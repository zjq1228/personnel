package com.dj.personnel.controller;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.BaseData;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.BaseDataService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private BaseDataService baseDataService;

    /**
     * 登陆
     *
     * @param user
     * @return
     */
   /* @RequestMapping("login")
    public ResultModel login(User user, HttpSession session) {
        try {
            QueryWrapper<User> query = new QueryWrapper<>();
            query.eq("username", user.getUsername());
            query.eq("password", user.getPassword());
            User user1 = userService.getOne(query);
            if (null != user1) {
                return new ResultModel().error("用户名密码不能为空");
            }
            session.setAttribute("user", user1);
            return new ResultModel().success("登陆成功");

        } catch (Exception e) {
            return new ResultModel().error(e.getMessage());
        }
    }*/

    @RequestMapping("login")
    public ResultModel login(User user, HttpSession session) {
        try {
            if (StringUtils.isEmpty(user.getUsername()) && StringUtils.isEmpty(user.getPassword())) {
                return new ResultModel().error("用户名密码不能为空");
            }
            User user1 = userService.findUserByNameAndPwd(user);
            System.out.println(user1);
            session.setAttribute("user", user1);
            if (null == user1) {
                return new ResultModel().error("用户名或密码错误");
            }
            return new ResultModel().success("登录成功");
        } catch (Exception e) {
            return new ResultModel().error("服务器异常,请稍后再试");
        }

    }

    /**
     * 展示
     *
     * @param
     * @return
     */
    @RequestMapping("show")
    public ResultModel show(@SessionAttribute("user")User user) {
        try {
            List<User> list = userService.findLevelShow(user);
            for (User user1 : list){
                System.out.println(user1);
            }
            return new ResultModel().success(list);
        } catch (Exception e) {
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 添加
     * 同时添加进基础数据表内
     * @param user
     * @return
     */
    @RequestMapping("addUser")
    public ResultModel addUser(User user) {
        try {
            LocalDateTime now = LocalDateTime.now();
            user.setCreateTime(now);
            userService.save(user);
            //增加到基础表
            BaseData baseData = new BaseData();
            baseData.setParentId(user.getPId());
            baseData.setBaseName(user.getUsername());
            baseDataService.addBase(baseData);
            return new ResultModel().success("成功");
        } catch (Exception e) {
            return new ResultModel().error(e.getMessage());
        }

    }

    /**
     * 二级联动添加用户所属部门及领导
     * @param parentId
     * @return
     */
    @RequestMapping("getParent")
    public ResultModel getParent(Integer parentId) {
        try {
            List<BaseData> parentIdBM = baseDataService.findBaseParentId(parentId);
            return new ResultModel().success(parentIdBM);
        } catch (Exception e) {
            return new ResultModel().error(e.getMessage());
        }

    }

}
