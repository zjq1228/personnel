package com.dj.personnel.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.personnel.mapper.DepartmentMapper;
import com.dj.personnel.mapper.DocumentMapper;
import com.dj.personnel.pojo.Department;
import com.dj.personnel.pojo.Document;
import com.dj.personnel.service.DepartmentService;
import com.dj.personnel.service.DocumentService;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImpl extends ServiceImpl<DocumentMapper, Document> implements DocumentService {

}
