package com.dj.personnel.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登陆
     *
     * @param user
     * @return
     */
    @RequestMapping("login")
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
    }

    /**
     * 展示
     *
     * @param user
     * @return
     */
    @RequestMapping("show")
    public ResultModel show(User user) {
        try {
            List<User> list = userService.list();
            return new ResultModel().success(list);
        } catch (Exception e) {
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 添加
     *
     * @param user
     * @return
     */
    @RequestMapping("addUser")
    public ResultModel addUser(User user) {
        try {
            userService.save(user);
            return new ResultModel().success("成功");
        } catch (Exception e) {
            return new ResultModel().error(e.getMessage());
        }

    }

}
