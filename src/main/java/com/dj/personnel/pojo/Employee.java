package com.dj.personnel.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Data
@TableName("employee")
public class Employee {
    /**
     * 职员ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 部门ID
     */
    private Integer departmentId;

    /**
     * 职位ID
     */
    private Integer jobId;

    /**
     * 姓名
     */
    private String name;

    /**
     * 工号
     */
    private String cardId;

    /**
     * 地址
     */
    private String address;

    /**
     * 邮政编码
     */
    private String postCode;

    /**
     * 家庭电话
     */
    private String telephone;

    /**
     * 移动号码
     */
    private String mobile;

    /**
     * QQ号
     */
    private String qq;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别
     */
    private Integer sex;

    /**
     * 派别
     */
    private String party;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 种族
     */
    private String race;

    /**
     * 教育
     */
    private String education;

    /**
     * 特长
     */
    private String speciality;

    /**
     * 爱好
     */
    private String hobby;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")// jackson
    private Date createTime;

    @TableField(exist = false)
    private String bumen;
    @TableField(exist = false)
    private String zhiwei;
}
