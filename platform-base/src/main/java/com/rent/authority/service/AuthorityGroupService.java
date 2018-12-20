package com.rent.authority.service;

import com.rent.authority.dao.AuthorityGroupDao;
import com.rent.authority.dao.GroupBussinessMenuDao;
import com.rent.authority.entity.AuthorityGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/11/18 0018.
 */
@Service
public class AuthorityGroupService {
    @Autowired
    private AuthorityGroupDao authorityGroupDao;
    @Autowired
    private GroupBussinessMenuDao groupBussinessMenuDao;
//    @Autowired
//    private CompanyLinkGroupDao companyLinkGroupDao;

    /**
     * @return
     */
    public List<AuthorityGroup> findAll() {
        return authorityGroupDao.findAll();
    }

    /**
     * @param authorityGroup
     * @param pageable
     * @param sort
     * @param order
     * @return
     */
    public List<AuthorityGroup> find(AuthorityGroup authorityGroup, Pageable pageable, String sort, String order) {
        return authorityGroupDao.find(authorityGroup, pageable, sort, order);
    }

    /**
     * @param id
     * @return
     */
    public AuthorityGroup findById(String id) {
        AuthorityGroup authorityGroup = authorityGroupDao.findById(id);
        return authorityGroup;
    }

    /**
     * @return
     */
    public Long count() {
        return authorityGroupDao.count();
    }

    /**
     * @param authorityGroup
     */
    public void creat(AuthorityGroup authorityGroup) {
        authorityGroupDao.save(authorityGroup);
    }

//    /**
//     * @param authorityGroup
//     * @return
//     */
//    public boolean update(AuthorityGroup authorityGroup) {
//        List<String> listStr1 = groupBussinessMenuDao.findByGroup(authorityGroup.getId());
//        List<String> listStr2 = companyLinkGroupDao.findByGroup(authorityGroup.getId());
//        if (!authorityGroup.getUseFlag() && listStr1 != null && listStr1.size() > 0 && listStr2 != null && listStr2.size() > 0) {
//            return false;
//        }
//        authorityGroupDao.save(authorityGroup);
//        return true;
//    }

//    /**
//     * 根据id 删除
//     *
//     * @param id
//     */
//    @Transactional
//    public boolean deleteById(String id) {
//        if (id != null && !"".equals(id)) {
//            List<String> listStr2 = companyLinkGroupDao.findByGroup(id);
//            if (listStr2 != null && listStr2.size() > 0) {
//                return false;
//            }
//            groupBussinessMenuDao.deleteByGroup(id);
//            authorityGroupDao.deleteById(id);
//            return true;
//        } else {
//            return false;
//        }
//    }

    /**
     * 用于校验名称唯一性
     *
     * @param name
     * @return
     */
    public long findCountByName(String name) {
        long count = authorityGroupDao.findCountByName(name);
        return count;
    }

//    public List<AuthorityGroup> find(String companyName, AuthorityGroup authorityGroup, PageRequest pagerequest, String sort, String order) {
//        return companyLinkGroupDao.findByCompanyName(companyName);
//    }
    public List<AuthorityGroup> findCanUse() {
        return authorityGroupDao.findCanUse();
    }
}
