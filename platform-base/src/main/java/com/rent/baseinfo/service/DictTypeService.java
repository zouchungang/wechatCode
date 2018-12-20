package com.rent.baseinfo.service;

import com.rent.baseinfo.dao.DictTypeDao;
import com.rent.baseinfo.entity.DictType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DictTypeService {
    @Autowired
    private DictTypeDao dictTypeDao;

    public List<DictType> findALL() {
        // TODO Auto-generated method stub
        Sort s = new Sort(Sort.Direction.ASC, "dataSort");
        return dictTypeDao.findAll(s);
    }

    @CacheEvict(value = "dict", allEntries = true)
    public void create(DictType dictType) {
        // TODO Auto-generated method stub
        dictTypeDao.save(dictType);
    }

    @CacheEvict(value = "dict", allEntries = true)
    public void update(DictType dictType) {
        // TODO Auto-generated method stub
        dictTypeDao.save(dictType);
    }

    @Cacheable(key = "#id", value = "dict")
    public DictType findById(String id) {
        // TODO Auto-generated method stub
        return dictTypeDao.findById(id);
    }

    @CacheEvict(value = "dict", allEntries = true)
    @Transactional
    public void deleteById(String id) {
        // TODO Auto-generated method stub
        dictTypeDao.deleteById(id);
    }

    public List<Map<String, Object>> tree() {
        // TODO Auto-generated method stub
        List<Map<String, Object>> tree = new ArrayList<Map<String, Object>>();
        List<DictType> list = dictTypeDao.findAll();
        for (DictType dictType : list) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("id", dictType.getId());
            map.put("text", dictType.getTypeName());
            tree.add(map);
        }
        return tree;
    }
}
