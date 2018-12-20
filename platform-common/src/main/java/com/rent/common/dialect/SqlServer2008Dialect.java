package com.rent.common.dialect;

import org.hibernate.dialect.SQLServer2008Dialect;

/**
 * @author liu_gl
 * @version 创建时间：2016-3-14 下午02:22:14
 * @E-mail:wenbei123@126.com
 * @qq:252431978
 */
public class SqlServer2008Dialect extends SQLServer2008Dialect {
    public SqlServer2008Dialect() {
        super();
        registerHibernateType(1, "string");
        registerHibernateType(-9, "string");
        registerHibernateType(-16, "string");
        registerHibernateType(3, "double");
    }
}
