package com.dj.personnel.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("job")
public class Job {
    /*职业ID*/
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**名称*/
    private String name;

    /**备注*/
    private String remark;

}
