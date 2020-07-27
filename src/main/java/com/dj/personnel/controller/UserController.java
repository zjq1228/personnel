package com.dj.personnel.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.User;
import com.dj.personnel.pojo.UserQuery;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户
 */
@RestController
@RequestMapping("/user/")
public class UserController {
    @Autowired
    private UserService userSerivce;

    /**
     * 登陆
     *
     * @param user
     * @return
     */
    @RequestMapping("login")
    public ResultModel login(User user, HttpSession session) {
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("username", user.getUsername());
            queryWrapper.eq("password", user.getPassword());
            User user1 = userSerivce.getOneUser(queryWrapper);
            if (null == user1) {
                return new ResultModel<>().error("该用户不存在");
            }
            session.setAttribute("user", user1);
            return new ResultModel<>().success("登陆成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(e.getMessage());
        }
    }

    /**
     * 新增
     *
     * @param user
     * @return
     */
    @PostMapping
    public ResultModel save(User user) {
        try {
            userSerivce.save(user);
            return new ResultModel().success(user);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 注册去重
     *
     * @param user
     * @return
     */
    @RequestMapping("findUserByUserName")
    public Boolean findUserByUserName(User user) {
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("username", user.getUsername());
            User findUserByName = userSerivce.getOne(queryWrapper);
            return findUserByName == null ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 展示
     *
     * @param UserQuery
     * @return
     */
    @RequestMapping("show")
    public ResultModel show(UserQuery UserQuery, User user) {
        Map<String, Object> map = new HashMap<>();
        try {
            //当前页，每页条数
            IPage iPage = new Page(UserQuery.getPageNo(), UserQuery.getPageSize());
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            if (!(UserQuery.getUserName() == null) && !"".equals(UserQuery.getUserName())) {
                queryWrapper.like("username", UserQuery.getUserName());
            }
            if (!(user.getStatus() == null) && !"".equals(user.getStatus())) {
                queryWrapper.eq("status", user.getStatus());
            }
            IPage pageInfo = userSerivce.page(iPage, queryWrapper);
            map.put("pages", pageInfo.getPages());//总页数
            map.put("list", pageInfo.getRecords());//数据结果
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常，请稍后再试");
        }
    }

    /**
     * 修改用户信息
     *
     * @param user 用户信息
     * @return
     * @URL PUT /users
     */
    // @PutMapping
    @RequestMapping("update")
    public ResultModel update(User user) {
        try {
            return new ResultModel().success(userSerivce.updateById(user));
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 删除用户
     *
     * @param ids 用户ID
     * @return
     * @URL DELETE /user/id
     */
    @RequestMapping("deleteUser")
    public ResultModel deleteUser(Integer[] ids) {
        try {
            List<Integer> idsList = Arrays.asList(ids);
            userSerivce.removeByIds(idsList);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }
}

