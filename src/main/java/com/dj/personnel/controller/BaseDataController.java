package com.dj.personnel.controller;

import com.dj.personnel.config.ResultModel;
import com.dj.personnel.config.SysConstant;
import com.dj.personnel.pojo.BaseData;
import com.dj.personnel.service.BaseDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 基础数据表
 */
@RestController
@RequestMapping("/base/")
public class BaseDataController {

    @Autowired
    private BaseDataService baseDataService;

    /**
     * 展示
     * @param id
     * @return
     */
    @RequestMapping("list")
    public List<BaseData> list(Integer id) {
        try {
            if (id == null) {
                id = 0;
            }
            List<BaseData> list = baseDataService.findBaseParentId(id);
            for (BaseData base : list) {
                List<BaseData> b = baseDataService.findBaseParentId(base.getId());
                if (b.size() > 0) {
                    base.setParent(true);
                } else {
                    base.setParent(false);
                }
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("updateZtree")
    public ResultModel<Object> updateZtree(Integer id, String baseName) {
        Map<String, Object> map = new HashMap<>();
        try {
            baseDataService.updateTree(id, baseName);
            map.put("code", "200");
            return new ResultModel<>().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常 请稍后");
        }
    }

    /**
     * 递归逻辑删除
     */
    @RequestMapping("updateBaseIsdel")
    public ResultModel<Object> updateBaseIsdel(Integer id) {
        Map<String, Object> map = new HashMap<>();
        List<Integer> ids = new ArrayList<>();
        try {
            ids.add(id);
            // 调用getIds()方法
            getIds(id, ids);
            baseDataService.updateIsdel(ids, SysConstant.BASE_PARENTID_0);
            map.put("code", "200");
            return new ResultModel<>().success(map);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常 请稍后");
        }

    }

    private void getIds(Integer id, List<Integer> ids) throws Exception {
        List<BaseData> list1 = baseDataService.findBaseParentId(id);
        if (list1 != null && list1.size() > 0) {
            for (BaseData base : list1) {
                ids.add(base.getId());
                List<BaseData> list2 = baseDataService.findBaseParentId(base.getId());
                if (list2 != null && list2.size() > 0) {
                    getIds(base.getId(), ids);
                }
            }
        }
    }
}
