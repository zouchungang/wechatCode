package com.rent.baseinfo.service;

import com.rent.baseinfo.dao.CantonDao;
import com.rent.baseinfo.entity.Canton;
import com.rent.common.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CantonService {
    StringBuffer returnStr = new StringBuffer();
    List<Canton> listCanton = new ArrayList<Canton>();
    @Autowired
    private CantonDao cantonDao;


    @Cacheable(value = "cantondata")
    public List<Canton> findALL() {
        // TODO Auto-generated method stub
        return cantonDao.findAll();
    }

    @CacheEvict(value = "cantondata", allEntries = true)
    public void create(Canton canton) {
        // TODO Auto-generated method stub
        cantonDao.save(canton);
    }

    @CacheEvict(value = "cantondata", allEntries = true)
    public void update(Canton canton) {
        // TODO Auto-generated method stub
        cantonDao.save(canton);
    }

    //@Cacheable(key="#id",value = "cantondata")
    public Canton findById(String id) {
        // TODO Auto-generated method stub
        return cantonDao.findById(id);
    }

    @CacheEvict(value = "cantondata", allEntries = true)
    public void deleteById(String id) {
        // TODO Auto-generated method stub
        cantonDao.delete(id);
    }

    public List<Map<String, Object>> convertListToTree(List<Canton> list) {
        List<Map<String, Object>> tree = new ArrayList<Map<String, Object>>();
        for (Canton canton : list) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("id", canton.getId());
            map.put("text", canton.getCantonName());
            if (findByPidisUse(canton.getCantonCode()).size() > 0) {
                map.put("state", "closed");
            }
            tree.add(map);
        }
        return tree;
    }

    public List<Canton> findByPid(String pid) {

//        List<Canton> listct = new ArrayList<Canton>();
        return cantonDao.findByPid(pid);
    }

    public List<Canton> findByPidisUse(String pid) {
        // TODO Auto-generated method stub
        Canton canton = new Canton();
        canton.setUseFlag(true);// 1启用的数据
        canton.setParentId(pid);
        return cantonDao.find(canton, null, null, null);
    }

    public List<Canton> find(Canton canton, Pageable pageable, String sort, String order) {
        // TODO Auto-generated method stub
        return cantonDao.find(canton, pageable, sort, order);
    }

    public long count(Canton canton) {
        // TODO Auto-generated method stub
        return cantonDao.count(canton);
    }

    public String alltree(List<Canton> list, Canton canton) {
        // TODO Auto-generated method stub
        if (returnStr.toString().length() > 0) {
            returnStr = new StringBuffer();
        }
        recursionTreeFn(list, canton);
        return modifyStr(returnStr.toString());// 返回拼接好的json格式字符串
    }

    /**
     * 此方法拼接json格式，easyui tree的json格式
     *
     * @param list
     * @param canton
     */
    private void recursionTreeFn(List<Canton> list, Canton canton) {
        if (hasChild(list, canton)) {
            returnStr.append("{\"id\":\"");
            returnStr.append(canton.getId());
            returnStr.append("\",\"text\":\"");
            returnStr.append(canton.getCantonName());
            returnStr.append("\",\"state\":\"");
            if ("1".equals(canton.getCantonCode())) {
                returnStr.append("open");
            } else {
                returnStr.append("closed");
            }
            returnStr.append("\",\"attributes\":{\"url\":\"");
            returnStr.append("\"},\"children\":[");
            List<Canton> childList = getChildList(list, canton);
            Iterator<Canton> it = childList.iterator();
            while (it.hasNext()) {
                Canton n = it.next();
                recursionTreeFn(list, n);
            }
            returnStr.append("]},");
        } else {
            returnStr.append("{\"id\":\"");
            returnStr.append(canton.getCantonCode());
            returnStr.append("\",\"text\":\"");
            returnStr.append(canton.getCantonName());
            returnStr.append("\",\"attributes\":{\"url\":\"");
            returnStr.append("\"}},");
        }
    }

    /**
     * 修饰一下才能满足easyui tree的Json格式
     *
     * @param returnStr
     * @return
     */
    private String modifyStr(String returnStr) {
        String str = ("[" + returnStr + "]").replaceAll(",]", "]");
        return str;
    }

    /**
     * 判断是否有子节点
     *
     * @param list
     * @param canton
     * @return
     */
    private boolean hasChild(List<Canton> list, Canton canton) { // 判断pbmdept下是否有子节点
        return getChildList(list, canton).size() > 0 ? true : false;
    }

    /**
     * 获取子节点
     *
     * @param list
     * @param canton
     * @return
     */
    private List<Canton> getChildList(List<Canton> list,
                                      Canton canton) { // 得到pbmdept下的子节点列表
        List<Canton> li = new ArrayList<Canton>();
        Iterator<Canton> it = list.iterator();
        while (it.hasNext()) {
            Canton n = it.next();
            if (n.getParentId().equals(canton.getId())) {
                li.add(n);
            }
        }
        return li;
    }

    public Map<String, Object> treeGrid(Map<String, Object> map, List<Canton> listAll) {
        int size = listAll.size();
        /*
         * 循环遍历原始数据列表，判断列表中某对象的父id值是否等于当前节点的id值，
		 * 如果相等，进入递归创建新节点的子节点，直至无子节点时，返回节点，并将该 节点放入当前节点的子节点列表中
		 */
        List<Map> gardens = new ArrayList<Map>();
        for (int i = 0; i < size; i++) {
            Canton newNode = listAll.get(i);
            if (newNode.getParentId() != null && newNode.getParentId().equals(map.get("id"))) {
//                List<Canton> listct = getDownList(listAll, newNode);
//                listCanton.add(newNode);
                Map<String, Object> nodesMap = new HashMap<String, Object>();
                nodesMap.put("id", newNode.getId());
                nodesMap.put("name", newNode.getCantonName());
                nodesMap.put("text", newNode.getCantonName());
                nodesMap = treeGrid(nodesMap, listAll);
                gardens.add(nodesMap);
            }
        }
        if (gardens.size() > 0) {
            map.put("nodes", gardens);
        }
        return map;
    }

    //    @Cacheable(key = "#conton.cantoncode", value = "cantondata")
    public Map<String, Object> returntreeGrid(Map<String, Object> map, List<Canton> list) {
        return treeGrid(map, list);
    }

    public List<Canton> getDownList(List<Canton> listAll,
                                    Canton canton) {
//        List<Canton> List1 = new ArrayList<Canton>();
        int size = listAll.size();
        listCanton.add(canton);
        /*
         * 循环遍历原始数据列表，判断列表中某对象的父id值是否等于当前节点的id值，
		 * 如果相等，进入递归创建新节点的子节点，直至无子节点时，返回节点，并将该 节点放入当前节点的子节点列表中
		 */
        for (int i = 0; i < size; i++) {
            Canton newNode = listAll.get(i);
            if (newNode.getParentId() != null
                    && newNode.getParentId().equals(
                    canton.getCantonCode())) {
                List<Canton> listct = getDownList(listAll, newNode);
                listCanton.add(newNode);
            }
        }
        return listCanton;
    }


    @CacheEvict(value = "cantondata", allEntries = true)
    public String updateUse(Boolean useflag, String[] cantonids, String id) {
        Canton canton = findById(id);
        if (!useflag) {// 如果是禁用
            for (int i = 0; i < cantonids.length; i++) {
                Canton bct = findById(cantonids[i]);
                bct.setUseFlag(Constants.ACTIVE);
                update(canton);
            }
        } else {
            canton.setUseFlag(useflag);
            update(canton);
        }
        return "1";
    }

    /**
     * 批量修改
     *
     * @param listct
     */
    @CacheEvict(value = "cantondata", allEntries = true)
    public void updateList(List<Canton> listct) {
        cantonDao.save(listct);
    }


    /**
     * 根据父级id,code 查数量
     */
    public long findCountByPidCode(String pid, String code) {
        return cantonDao.findCountByPidCode(pid, code);
    }

    /**
     * 根据父级id,name 查数量
     */
    public long findCountByPidName(String pid, String name) {
        return cantonDao.findCountByPidName(pid, name);
    }

    /**
     * 根据父级id,name 查数量
     */
    public boolean remoteCode(String id, String code, String pid) {
        if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
            Canton pd = findById(id);
            if (pd != null && code != null && code.trim().equals(pd.getCantonCode())) {
                return true;
            } else {
                long num = findCountByPidCode(pid, code);
                return num < 1;
            }
        } else {
            long num = findCountByPidCode(pid, code);
            return num < 1;
        }
    }

    /**
     * 根据父级id,name 查数量
     */
    public boolean remoteName(String id, String name, String pid) {
        if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
            Canton pd = findById(id);
            if (pd != null && name != null && name.trim().equals(pd.getCantonName())) {
                return true;
            } else {
                long num = findCountByPidName(pid, name);
                return num < 1;
            }
        } else {
            long num = findCountByPidName(pid, name);
            return num < 1;
        }
    }


    /**
     * 排序查询所有地区，并封装成map
     * @return
     */
    public List<Map<String,String>> cantonTreeList(){
        List<Canton> cantonList=find(new Canton() , null, "dataSort", "asc");
        List<Map<String,String>> cantons=new ArrayList<>();
        for(Canton canton:cantonList){
            Map<String,String> map=new HashMap<>();
            map.put("id",canton.getId());
            map.put("pId",canton.getParentId());
            map.put("name",canton.getCantonName());
            if(canton.getId().equals("1")){
                map.put("open","true");//ztree树中设置此参数的节点直接展开
            }
            cantons.add(map);
        }
        return cantons;
    }

}
