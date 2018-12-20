package com.rent.system.dao;

import com.rent.system.entity.PlatformInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 平台企业信息维护DAO
 *
 * @author lgl
 */
@Repository
public interface PlatformInfoDao extends
        JpaRepository<PlatformInfo, String> {

}
