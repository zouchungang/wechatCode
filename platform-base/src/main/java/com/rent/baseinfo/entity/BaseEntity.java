package com.rent.baseinfo.entity;

import com.rent.common.util.DateUtils;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;

/**
 * Created by liu_gl on 2016/8/30.
 */
@MappedSuperclass
public class BaseEntity implements Serializable {
    private String id;//主键
    private String dataCreateTime = DateUtils.getSystime();//数据创建时间
    private String dataUpdateTime = DateUtils.getSystime();//数据更新时间
    private Integer dataVersion=1;


    @Id
    @GeneratedValue(generator = "uuid2")   //指定生成器名称
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")  //生成器名称，uuid生成类
    @Column(name = "id", unique = true, nullable = false, length = 36)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "dataCreateTime", updatable = false, length = 20)
    public String getDataCreateTime() {
        return dataCreateTime;
    }

    public void setDataCreateTime(String dataCreateTime) {
        this.dataCreateTime = dataCreateTime;
    }

    @Column(name = "dataUpdateTime", length = 20)
    public String getDataUpdateTime() {
        return dataUpdateTime;
    }

    public void setDataUpdateTime(String dataUpdateTime) {
        this.dataUpdateTime = dataUpdateTime;
    }

    @Column(name = "dataVersion", length = 5)
    public Integer getDataVersion() {
        return dataVersion;
    }

    public void setDataVersion(Integer dataVersion) {
        this.dataVersion = dataVersion;
    }
}
