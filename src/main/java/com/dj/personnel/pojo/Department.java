package com.dj.personnel.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 部门表111
 */
@Data
public class Department {
    /**
     * 部门id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 部门名称
     */
    private String name;

    /**
     * 部门描述
     */
    private String remark;

    /**
     * 部门状态
     * 0：删除
     * 1：正常
     */
    private Integer isDel;
}
