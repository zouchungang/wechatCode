package com.rent.authority.dao;


import com.rent.authority.entity.AuthorityGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/11/18 0018.
 */
@Repository
public interface AuthorityGroupDao extends JpaRepository<AuthorityGroup, String>, AuthorityGroupDaoCustom {
    /**
     * 根据id，删除一条记录，在service层需要加上事物注解
     *
     * @param id
     */
    @Query("delete from AuthorityGroup p where p.id= :id")
    @Modifying
    public void deleteById(@Param("id") String id);


    @Query("select t from AuthorityGroup t where t.id = :id")
    public AuthorityGroup findById(@Param("id") String id);

    @Query("select count(t) from AuthorityGroup t where t.groupName = upper(:name)")
    public Long findCountByName(@Param("name") String name);

    @Query("select t from AuthorityGroup t where t.useFlag = true order by t.dataSort asc")
    public List<AuthorityGroup> findCanUse();
}
