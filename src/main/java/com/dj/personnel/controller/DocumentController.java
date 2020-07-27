package com.dj.personnel.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.personnel.config.ResultModel;
import com.dj.personnel.pojo.Document;
import com.dj.personnel.pojo.User;
import com.dj.personnel.pojo.UserQuery;
import com.dj.personnel.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.*;

/**
 * 部门
 */
@RestController
@RequestMapping("/document/")
public class DocumentController {
    @Autowired
    private DocumentService documentService;

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
            QueryWrapper<Document> queryWrapper = new QueryWrapper<>();
            if (!UserQuery.getTitle().isEmpty() && !"".equals(UserQuery.getTitle())) {
                queryWrapper.like("title", UserQuery.getTitle());
            }
            IPage pageInfo = documentService.page(iPage, queryWrapper);
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
     * @param document
     * @return
     */
    @PostMapping
    public ResultModel save(Document document) {
        try {

            documentService.save(document);
            return new ResultModel().success(document);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 注册去重
     *
     * @param document
     * @return
     */
    @RequestMapping("findDocumentByTitle")
    public Boolean findDocumentByTitle(Document document) {
        try {
            QueryWrapper<Document> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("title", document.getTitle());
            Document findEmployeeByName = documentService.getOne(queryWrapper);
            return findEmployeeByName == null ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 修改用户信息
     *
     * @param document 用户信息
     * @return
     * @URL PUT /users
     */
    @RequestMapping("update")
    public ResultModel update(Document document) {
        try {
            return new ResultModel().success(documentService.updateById(document));
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 删除职位
     *
     * @param ids 用户ID
     * @return
     * @URL DELETE /user/id
     */
    //@DeleteMapping
    @RequestMapping("deleteDocument")
    public ResultModel deleteDocument(Integer[] ids) {
        try {
            List<Integer> idsList = Arrays.asList(ids);
            documentService.removeByIds(idsList);
            return new ResultModel().success(true);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }

    /**
     * 文件上传
     *
     * @param file
     * @return
     */
    @RequestMapping("upload")
    public ResultModel upload(MultipartFile file, Document document, @SessionAttribute("user") User user) {
        try {
            if (!file.isEmpty()) {
                // 真实文件名称
                // 后缀名
                String filename = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
                // 随机名称
                String replace = UUID.randomUUID().toString().replace("-", "");
                // 存放名字 随机+后缀
                String newFileName = replace + "." + filename;
                System.out.println(newFileName);
                // 上传文件夹
                String dirpath = "E:/upload/";
                File f = new File(dirpath);
                // 文件夹不存在就创建一个
                if (!f.exists()) {
                    f.mkdirs();
                }
                file.transferTo(new File(dirpath + newFileName));
                // 设置名字
                document.setFileName(newFileName);
                document.setUsername(user.getUsername());
                System.out.println(user.getUsername());
                documentService.save(document);
                return new ResultModel().success(true);
            }
            return new ResultModel().error(false);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }


}
