package com.dj.personnel.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 基础数据表
 */
@Data
@TableName("base")
public class BaseData {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 父类Id
     */
    private Integer parentId;
    /**
     * 基础数据名称
     */
    private String baseName;
    /**
     * 状态
     */
    private Integer isDel;

    private boolean isParent;


}
