package com.dj.personnel.pojo;

import lombok.Data;

import java.util.List;

@Data
public class UserQuery {
    /**
     * Job表name
     */
    private String name;
    private Integer pageNo;
    private Integer pageSize = 4;
    private List<User> list;

}
