package com.dj.personnel.controller.page;



import com.dj.personnel.pojo.Document;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.DocumentService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
