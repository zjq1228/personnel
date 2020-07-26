package com.dj.personnel.controller;

import com.dj.personnel.config.ResultModel;
import com.dj.personnel.config.SysConstant;
import com.dj.personnel.pojo.BaseData;
import com.dj.personnel.pojo.User;
import com.dj.personnel.service.BaseDataService;
import com.dj.personnel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
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

    @Autowired
    private UserService userService;

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
    /**
     * 修改
     */
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

    /**
     * 增加
     * 异步加载树增加
     */
    @RequestMapping("add")
    public Map<String, Object> add(BaseData baseData) {
        Map<String, Object> map = new HashMap<>();
        try {
            baseDataService.addBase(baseData);
            List<Integer> ids = new ArrayList<>();
            List<Integer> ids1 = new ArrayList<>();
            getIds2(baseData.getParentId(), ids);
            getIds1(baseData.getParentId(), ids1);
            User user = new User();
            user.setUsername(baseData.getBaseName());
            for (Integer i:ids1){
                if (i == 2) {
                    user.setUserLevel(2);
                }else {
                    user.setUserLevel(3);
                }
            }
            user.setPassword("123");
            user.setUserPhone("请绑定您的手机号码");
            user.setStatus(1);
            user.setIdCard("请绑定您的身份证");
            user.setPId(baseData.getParentId());
            for (Integer i:ids){
                user.setProvince(i);
            }
            LocalDateTime now = LocalDateTime.now();
            user.setCreateTime(now);
            userService.save(user);
            map.put("code", "200");
            return map;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            map.put("code", "400");
            map.put("msg", "服务器异常 请稍后");
            return map;
        }

    }
    private void getIds2(Integer id, List<Integer> ids) throws Exception {
        BaseData id1 = baseDataService.findBaseById(id);
        if (id1 != null) {
            BaseData id2 = baseDataService.findBaseById(id1.getParentId());
            if (id2 != null) {
                if(id2.getParentId() != 0){
                    getIds(id2.getParentId(), ids);
                }else {
                    ids.add(id2.getId());
                }

            }else {
                ids.add(id1.getId());
            }
        }
    }
    private void getIds1(Integer id, List<Integer> ids1) throws Exception {
        BaseData id1 = baseDataService.findBaseById(id);
        if (id1 != null) {
            BaseData id2 = baseDataService.findBaseById(id1.getParentId());
            if (id2 != null) {
                ids1.add(3);
            }else {
                ids1.add(2);
            }
        }
    }


}
