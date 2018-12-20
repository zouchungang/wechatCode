package com.rent.baseinfo.service;

import com.rent.baseinfo.dao.DictDao;
import com.rent.baseinfo.entity.Dict;
import com.rent.baseinfo.vo.DictVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class DictService {
    @Autowired
    private DictDao dictDao;

    /**
     * @return
     */
    @Cacheable(value = "dict")
    public List<Dict> findALL() {
        // TODO Auto-generated method stub
        return dictDao.findAll();
    }

    /**
     * @param dict
     * @param pageable
     * @param sort
     * @param order
     * @return
     */
    public List<Dict> find(Dict dict, Pageable pageable, String sort, String order) {
        // TODO Auto-generated method stub
        return dictDao.find(dict, pageable, sort, order);
    }

    /**
     * @param dict
     * @return
     */
    public Long count(Dict dict) {
        // TODO Auto-generated method stub
        return dictDao.count(dict);
    }

    /**
     * 添加的时候，清除dict缓存目录下全部缓存
     *
     * @param dict
     */
    @CacheEvict(value = "dict", allEntries = true)
    public void create(Dict dict) {
        // TODO Auto-generated method stub
        dictDao.save(dict);
    }

    /**
     * 更新的时候，清除dict缓存目录下全部缓存
     *
     * @param dict
     */
    @CacheEvict(value = "dict", allEntries = true)
    public void update(Dict dict) {
        // TODO Auto-generated method stub
        dictDao.save(dict);
    }

    /**
     * @param id
     * @return
     */
    @Cacheable(key = "#id", value = "dict")
    public Dict findById(String id) {
        // TODO Auto-generated method stub
        return dictDao.findById(id);
    }

    /**
     * @param id
     */
    @CacheEvict(value = "dict", allEntries = true)
    @Transactional
    public void deleteById(String id) {
        // TODO Auto-generated method stub
        dictDao.delete(id);
    }

    /**
     * 缓存key为字典类型的主键
     *
     * @param type 字典类型的主键
     * @return
     */
    @Cacheable(key = "#type", value = "dict")
    public List<Dict> findByType(String type) {
        // TODO Auto-generated method stub
        return dictDao.findByType(type);
    }

    /**
     * @param ins
     * @return
     */
    public List<Dict> findByTypes(List<String> ins) {
        // TODO Auto-generated method stub
        return dictDao.findByTypes(ins);
    }

    /**
     * 根据数据字典类型编码和数据字典值，获取到数据字典的名称
     *
     * @param type
     * @param value
     * @return
     */
    @Cacheable(key = "#type+#value", value = "dict")
    public String findParamName(String type, String value) {
        return dictDao.findParamName(type, value);
    }

    /**
     * 根据数据字典类型编码和数据字名称，获取到数据字典的列表
     *
     * @param type
     * @param name
     * @return
     */
    @Cacheable(key = "#type+#name", value = "dict")
    public List<Dict> findByNameAndType(String type, String name) {
        return dictDao.findByNameAndType(type, name);
    }

    /**
     * @param type
     * @param value
     * @return
     */
    public List<Dict> findByValueAndType(String type, String value) {
        return dictDao.findByValueAndType(type, value);
    }

    /**
     * @param type
     * @return
     */
    public List<DictVo> findCanUseByTypes(String type) {
        List<Dict> dList = dictDao.findCanUseByTypes(type);
        List<DictVo> voList = new ArrayList<DictVo>();
        for (Dict dict : dList) {
            DictVo dv = new DictVo();
            dv.setName(dict.getParamName());
            dv.setValue(dict.getId());//value 存放参数id
            voList.add(dv);
        }
        return voList;
    }

    /**
     * @param type
     * @return
     */
    public List<DictVo> findValueCanUseByTypes(String type) {
        List<Dict> dList = dictDao.findCanUseByTypes(type);
        List<DictVo> voList = new ArrayList<DictVo>();
        for (Dict dict : dList) {
            DictVo dv = new DictVo();
            dv.setName(dict.getParamName());
            dv.setValue(dict.getParamValue());//value 存放参数id
            voList.add(dv);
        }
        return voList;
    }

    /**
     * @param type
     * @param values
     * @return
     */
    public String showDictNameByTypeValues(String type, String values) {
        String resStr = "";
        if (type != null && values != null && values.length() > 0) {
            String[] valueArr = values.split(",");
            if (valueArr.length > 0) {
                List<String> valueList = Arrays.asList(valueArr);
                List<String> nameList = dictDao.showDictNameByTypeValues(type, valueList);
                resStr = nameList.toString().replace("[", "").replace("]", "").replace(",", "<br>");
            }
        }
        return resStr;
    }

}
