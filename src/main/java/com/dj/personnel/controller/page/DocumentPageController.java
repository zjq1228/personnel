package com.dj.personnel.controller.page;



import com.dj.personnel.pojo.Document;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.DocumentService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

@Controller
@RequestMapping("/document/")
public class DocumentPageController {
    @Autowired
    private DocumentService documentService;

    @RequestMapping("toShow")
    public String toShow(){
        return "document/show";
    }
    @RequestMapping("toInsert")
    public String toInsert(){
        return "document/add";
    }
    @RequestMapping("toUpdate")
    public String toUpdate(Model model, Integer id){
        Document document = documentService.getById(id);
        model.addAttribute("document",document);
        return "document/update";
    }
    /**
     * 文件下载
     * @param id
     * @param response
     */
    @RequestMapping("download")
    public void download(Integer id, HttpServletResponse response) {
        try {
            Document document = documentService.getById(id);
            response.reset();
            response.setContentType("application/x-msdownload; charset=utf-8");
            // 设置UTF-8格式
            response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(document.getFileName(), "utf-8"));
            // 将服务器上的文件夹读取到JAVA程序里，InputStream
            InputStream input = new FileInputStream("E:/upload/" + document.getFileName());
            // 将读取到的内容响应给用户，使用response可以响应到用户看到的地方=游览器
            OutputStream stream = response.getOutputStream();
            // 缓解程序的压力 4096
            byte[] buffer = new byte[4096];
            while ((input.read(buffer)) > 0) {
                stream.write(buffer);
            }
            input.close();
            stream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
