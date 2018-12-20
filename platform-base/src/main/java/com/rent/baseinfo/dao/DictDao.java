package com.rent.baseinfo.dao;

import com.rent.baseinfo.entity.Dict;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DictDao extends
        JpaRepository<Dict, String>, DictDaoCustom {
    /**
     * @param id
     * @return
     */
    @Query("select c from Dict c where c.id = :id")
    Dict findById(@Param("id") String id);

    /**
     * @param id
     */
    @Query("delete from Dict c where c.id= :id")
    @Modifying
    void deleteById(@Param("id") String id);

    /**
     * @param type
     * @return
     */
    @Query("select c from Dict c where c.dictType.typeCode = :type order by c.paramValue asc")
    List<Dict> findByType(@Param("type") String type);

    /**
     * 根据数据字典类型编码和数据字典值，获取到数据字典的名称
     *
     * @param type
     * @param value
     * @return
     */
    @Query("select c.paramName from Dict c where c.dictType.typeCode = :type and c.paramValue=:value")
    String findParamName(@Param("type") String type, @Param("value") String value);

    /**
     * @param type
     * @param name
     * @return
     */
    @Query("select c from Dict c where c.dictType.id = :type and c.paramName=:name")
    List<Dict> findByNameAndType(@Param("type") String type, @Param("name") String name);

    /**
     * @param type
     * @param value
     * @return
     */
    @Query("select c from Dict c where c.dictType.id = :type and c.paramValue=:value")
    List<Dict> findByValueAndType(@Param("type") String type, @Param("value") String value);

    /**
     * @param ins
     * @return
     */
    @Query("select c from Dict c where c.dictType.typeCode in (:ins)  and c.useFlag=true order by c.paramValue asc")
    List<Dict> findByTypes(@Param("ins") List<String> ins);

    /**
     * 根据参数类型查询启用的记录
     *
     * @param type
     * @return
     */
    @Query("select c from Dict c where c.dictType.typeCode = :type  and c.useFlag=true order by c.paramValue asc")
    List<Dict> findCanUseByTypes(@Param("type") String type);

    /**
     * 根据参数类型查询启用的记录
     *
     * @param type
     * @return
     */
    @Query("select c.paramName from Dict c where c.dictType.typeCode = :type  and c.paramValue in(:valueList)")
    List<String> showDictNameByTypeValues(@Param("type") String type, @Param("valueList") List<String> valueList);

    /**
     * 根据参数类型查询启用的记录
     *
     * @param type
     * @param aptStr
     * @return
     */
    @Query("select c.paramName from Dict c where c.dictType.typeCode = :type  and c.paramValue in(:aptStr)")
    List<String> showDictNameByTV(@Param("type") String type, @Param("aptStr") String[] aptStr);
}
