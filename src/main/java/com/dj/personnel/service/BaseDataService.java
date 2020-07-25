package com.dj.personnel.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.personnel.pojo.BaseData;

import java.util.List;

public interface BaseDataService  extends IService<BaseData> {

    List<BaseData> findBaseParentId(Integer id) throws Exception;

    void addBase(BaseData baseData) throws Exception;

    BaseData findBaseById(Integer id) throws Exception;

    List<BaseData> findBaseAll() throws Exception;

    void updateIsdel(List<Integer> ids, Integer id)throws Exception;

    void updateTree(Integer id, String baseName)throws Exception;
}
