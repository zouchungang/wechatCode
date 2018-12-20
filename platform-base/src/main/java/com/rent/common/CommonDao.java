package com.rent.common;

import com.rent.common.util.StrUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.hibernate.Session;
import org.hibernate.internal.SessionImpl;
import org.hibernate.query.NativeQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Transactional
@Repository
public class CommonDao {
    @PersistenceContext
    private EntityManager em;

    /**
     * * 查询数据集合
     *
     * @param sql    查询sql sql中的参数用:name格式
     * @param params 查询参数map格式，key对应参数中的:name
     * @param clazz  实体类型为空则直接转换为map格式
     * @return
     */
    public List<?> queryListEntity(String sql, Map<String, Object> params, Class<?> clazz) {
        Session session = em.unwrap(Session.class);
        NativeQuery query = session.createNativeQuery(sql);
        if (params != null) {
            for (String key : params.keySet()) {
                query.setParameter(key, params.get(key));
            }
        }
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map<String, Object>> result = query.list();
        if (clazz != null) {
            List<Object> entityList = convert(clazz, result);
            return entityList;
        }
        return result;
    }

    /**
     * @param clazz
     * @param list
     * @return
     */
    private List<Object> convert(Class<?> clazz, List<Map<String, Object>> list) {
        List<Object> result;
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        result = new ArrayList<Object>();
        try {
            PropertyDescriptor[] props = Introspector.getBeanInfo(clazz).getPropertyDescriptors();
            for (Map<String, Object> map : list) {
                Object obj = clazz.newInstance();
                for (String key : map.keySet()) {
                    String attrName = StrUtils.toLowerCaseFirstOne(key);
                    for (PropertyDescriptor prop : props) {
                        attrName = removeUnderLine(attrName);
                        if (!attrName.equals(prop.getName())) {
                            continue;
                        }
                        Method method = prop.getWriteMethod();
                        Object value = map.get(key);
                        if (value != null) {
                            value = ConvertUtils.convert(value, prop.getPropertyType());
                        } else {
                            value = "";
                        }
                        method.invoke(obj, value);
                    }
                }
                result.add(obj);
            }
        } catch (Exception e) {
            throw new RuntimeException("数据转换错误");
        }
        return result;
    }

    private String removeUnderLine(String attrName) {
        //去掉数据库字段的下划线
        if (attrName.contains("_")) {
            String[] names = attrName.split("_");
            String firstPart = names[0];
            StringBuffer otherPart = new StringBuffer();
            for (int i = 1; i < names.length; i++) {
                String word = names[i].replaceFirst(names[i].substring(0, 1), names[i].substring(0, 1).toUpperCase());
                otherPart.append(word);
            }
            attrName = firstPart + otherPart;
        }
        return attrName;
    }

    /**
     * 获取记录条数
     *
     * @param sql
     * @param params
     * @return
     */
    public Integer getCountBy(String sql, Map<String, Object> params) {
        Query query = em.createNativeQuery(sql);
        if (params != null) {
            for (String key : params.keySet()) {
                query.setParameter(key, params.get(key));
            }
        }
        BigInteger bigInteger = (BigInteger) query.getSingleResult();
        return bigInteger.intValue();
    }

    /**
     * 新增或者删除
     *
     * @param sql
     * @param params
     * @return
     */
    public Integer deleteOrUpDate(String sql, Map<String, Object> params) {
        Query query = em.createNativeQuery(sql);
        if (params != null) {
            for (String key : params.keySet()) {
                query.setParameter(key, params.get(key));
            }
        }
        return query.executeUpdate();
    }

    /**
     * 验证数据库中是否纯在某个表 参数: catalog:目录名称，一般都为空.
     * <p/>
     * 参数：schema:数据库名，对于sqlserver2005+和oracle来说就用户名
     * <p/>
     * 参数：tablename:表名称
     * <p/>
     * 参数：type :表的类型(TABLE | VIEW)
     * <p/>
     * 注意：在使用过程中，参数名称必须使用大写的。
     *
     * @return
     */
    public boolean tableisexist(String catalog, String schema,
                                String tablename, String type) {
        boolean flag = false;
        Connection connection = em.unwrap(SessionImpl.class).connection();
        try {
            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet rs = metaData.getTables(null, schema, tablename,
                    new String[]{type});
            if (rs.next()) {// 如果有就返回true,表示数据库中已经存在了该表
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
