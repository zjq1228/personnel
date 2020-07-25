package com.dj.personnel.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.personnel.pojo.BaseData;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface BaseDataMapper extends BaseMapper<BaseData> {

    List<BaseData> findBaseParentId(Integer id) throws DataAccessException;

    BaseData findBaseById(Integer id) throws DataAccessException;

    void addBase(BaseData baseData) throws DataAccessException;

    List<BaseData> findBaseAll() throws DataAccessException;

    void updateIsdel(@Param("ids") List<Integer> ids, @Param("id")Integer id)throws DataAccessException;

    void updateTree(@Param("id")Integer id,@Param("baseName")String baseName)throws DataAccessException;
}
