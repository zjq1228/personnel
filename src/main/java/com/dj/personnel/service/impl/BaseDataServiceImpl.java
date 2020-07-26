package com.dj.personnel.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.personnel.mapper.BaseDataMapper;
import com.dj.personnel.pojo.BaseData;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.BaseDataService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class BaseDataServiceImpl extends ServiceImpl<BaseDataMapper, BaseData> implements BaseDataService {

    @Autowired
    private BaseDataMapper baseDataMapper;

    @Override
    public List<BaseData> findBaseParentId(Integer id) throws Exception {
        return baseDataMapper.findBaseParentId(id);
    }

    @Override
    public void addBase(BaseData baseData) throws Exception {
        baseDataMapper.addBase(baseData);

    }

    @Override
    public BaseData findBaseById(Integer id) throws Exception {
        return baseDataMapper.findBaseById(id);
    }

    @Override
    public List<BaseData> findBaseAll() throws Exception {
        return baseDataMapper.findBaseAll();
    }

    @Override
    public void updateIsdel(List<Integer> ids, Integer id) throws Exception {
        baseDataMapper.updateIsdel(ids, id);
    }

    @Override
    public void updateTree(Integer id, String baseName) throws Exception {
        baseDataMapper.updateTree(id, baseName);
    }
}
