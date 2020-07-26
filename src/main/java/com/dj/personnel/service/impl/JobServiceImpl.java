package com.dj.personnel.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.personnel.mapper.JobMapper;
import com.dj.personnel.pojo.Job;
import com.dj.personnel.service.JobService;
import org.springframework.stereotype.Service;

@Service
public class JobServiceImpl extends ServiceImpl<JobMapper, Job> implements JobService {

}
