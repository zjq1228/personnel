package com.dj.personnel.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * 用户实体类
 */
@Data
@TableName("user")
public class User {

    /**
     * 用户ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 父类id
     */
    private Integer pId;

    /**
     * 用户等级（boss是 1，管理员是2，普通员工是“3”）
     */
    private Integer userLevel;

    /**
     * 登录名称
     */
    private String username;


    /**
     *密码
     */
    private String password;

    /**
     *状态
     */
    private Integer status;

    /**
     *注册时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    /**
     * 手机号
     */
    private String userPhone;

    /**
     * 身份证号码
     */
    private String idCard;
}
