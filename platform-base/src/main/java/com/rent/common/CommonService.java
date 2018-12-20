package com.rent.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommonService {
    @Autowired
    private CommonDao commonDao;

    /**
     * 验证数据库中是否纯在某个表
     * <p/>
     * 如果schema参数为null的话，那么它会查询整个数据库中的表有可能会冲突的：
     * <p/>
     * 如果tablename为空则显示该数据库中所有表
     * <p/>
     * 参数: catalog:目录名称，一般都为空.
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
    public boolean tableisexist(String schema, String tablename) {
        String upschema = "";
        String uptable = "";
        if (!"".equals(schema) && schema != null) {
            upschema = schema.toUpperCase();
        }
        if (!"".equals(tablename) && tablename != null) {
            uptable = tablename.toUpperCase();
        }
        return commonDao.tableisexist(null, upschema, uptable, "TABLE");
    }

    /**
     * 验证数据库中是否纯在某个视图
     * <p/>
     * 如果schema参数为null的话，那么它会查询整个数据库中的表有可能会冲突的：
     * <p/>
     * 如果tablename为空则显示该数据库中所有表
     * <p/>
     * 参数: catalog:目录名称，一般都为空.
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
    public boolean viewisexist(String schema, String tablename) {
        String upschema = "";
        String uptable = "";
        if (!"".equals(schema) && schema != null) {
            upschema = schema.toUpperCase();
        }
        if (!"".equals(tablename) && tablename != null) {
            uptable = tablename.toUpperCase();
        }
        return commonDao.tableisexist(null, upschema, uptable, "VIEW");
    }
}
