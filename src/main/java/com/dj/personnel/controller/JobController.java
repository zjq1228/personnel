package com.dj.personnel.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.Job;
import com.dj.personnel.pojo.User;
import com.dj.personnel.pojo.UserQuery;
import com.dj.personnel.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 职位
 */
@RestController
@RequestMapping("/job/")
public class JobController {
    @Autowired
    private JobService jobService;

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
            QueryWrapper<Job> queryWrapper = new QueryWrapper<>();
            if (!UserQuery.getName().isEmpty()) {
                queryWrapper.like("name", UserQuery.getName());
            }
            IPage pageInfo = jobService.page(iPage, queryWrapper);
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
     * @param job
     * @return
     */
    @PostMapping
    public ResultModel save(Job job) {
        try {
            jobService.save(job);
            return new ResultModel().success(job);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 注册去重
     * @param job
     * @return
     */
    @RequestMapping("findJobByName")
    public Boolean findJobByName(Job job) {
        try {
            QueryWrapper<Job> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("name", job.getName());
            Job findJobByName = jobService.getOne(queryWrapper);
            return findJobByName == null ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 修改信息
     * @param job
     * @return
     */
    @RequestMapping("update")
    public ResultModel update(Job job) {
        try {
            return new ResultModel().success(jobService.updateById(job));
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 删除职位
     * @param ids
     * @return
     */
    @RequestMapping("deleteJob")
    public ResultModel deleteJob(Integer[] ids) {
        try {
            List<Integer> idsList = Arrays.asList(ids);
            jobService.removeByIds(idsList);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }
}
