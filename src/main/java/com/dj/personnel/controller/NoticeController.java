package com.dj.personnel.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.Department;
import com.dj.personnel.pojo.Notice;
import com.dj.personnel.pojo.User;
import com.dj.personnel.pojo.UserQuery;
import com.dj.personnel.service.DepartmentService;
import com.dj.personnel.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门
 */
@RestController
@RequestMapping("/notice/")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    /**
     * 展示
     *
     * @param UserQuery
     * @return
     */
    @RequestMapping("show")
    public ResultModel show(UserQuery UserQuery) {
        Map<String, Object> map = new HashMap<>();
        try {
            //当前页，每页条数
            IPage iPage = new Page(UserQuery.getPageNo(), UserQuery.getPageSize());
            QueryWrapper<Notice> queryWrapper = new QueryWrapper<>();
            if (!UserQuery.getTitle().isEmpty() && !"".equals(UserQuery.getTitle())) {
                queryWrapper.like("title", UserQuery.getTitle());
            }
            IPage pageInfo = noticeService.page(iPage, queryWrapper);
            map.put("pages", pageInfo.getPages());//总页数
            map.put("list", pageInfo.getRecords());//数据结果
            return new ResultModel().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error("服务器异常，请稍后再试");
        }
    }

    /**
     * 新增
     *
     * @param notice
     * @return
     */
    @PostMapping
    public ResultModel save(Notice notice, @SessionAttribute("user") User user) {
        try {
            notice.setUsername(user.getUsername());
            noticeService.save(notice);
            return new ResultModel().success(notice);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 注册去重
     *
     * @param notice
     * @return
     */
    @RequestMapping("findNoticeByTitle")
    public Boolean findNoticeByTitle(Notice notice) {
        try {
            QueryWrapper<Notice> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("title", notice.getTitle());
            Notice findNoticeByName = noticeService.getOne(queryWrapper);
            return findNoticeByName == null ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 修改用户信息
     *
     * @param notice
     * @return
     */
    @RequestMapping("update")
    public ResultModel update(Notice notice) {
        try {
            noticeService.updateById(notice);
            return new ResultModel().success(notice);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 删除职位
     *
     * @param ids
     * @return
     */
    @RequestMapping("deleteNotice")
    public ResultModel deleteNotice(Integer[] ids) {
        try {
            List<Integer> idsList = Arrays.asList(ids);
            noticeService.removeByIds(idsList);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }
}
