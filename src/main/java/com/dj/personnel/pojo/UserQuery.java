package com.dj.personnel.pojo;

import lombok.Data;

import java.util.List;

@Data
public class UserQuery {
    //User表name
    private String userName;
    //Job表name
    private String name;
    //公告表 标题
    private String title;
    private String mobile;
    private Integer jobId;
    private Integer departmentId;
    private Integer sex;
    private Integer pageNo;
    private Integer pageSize = 4;
    private List<User> list;

}
