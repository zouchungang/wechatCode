package ${packageName}.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
/**
*
*${moduleMemo!} --实体类
*
**/
@Entity
@Table(name = "${tabname}")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler"})
public class ${entityname} extends BaseEntity {

/**
*
*/
private static final long serialVersionUID = 1L;
private String id;//主键
<#list fieldsList as entity>
	<#if entity.fieldType == "java.lang.String">
    private java.lang.String ${entity.fieldName};//${entity.explain}
	</#if>
	<#if entity.fieldType == "java.lang.Integer">
    private java.lang.Integer ${entity.fieldName};//${entity.explain}
	</#if>
	<#if entity.fieldType == "java.lang.Double">
    private java.lang.Double ${entity.fieldName};//${entity.explain}
	</#if>
	<#if entity.fieldType == "java.math.BigDecimal">
    private java.math.BigDecimal ${entity.fieldName};//${entity.explain}
	</#if>
	<#if entity.fieldType == "java.util.Date">
    private java.util.Date ${entity.fieldName};//${entity.explain}
	</#if>
	<#if entity.fieldType == "1">
    private selffield ${entity.firtdonselffield};//${entity.explain}
	</#if>
</#list>

@Id
@GeneratedValue(generator = "system-uuid")
@GenericGenerator(name = "system-uuid", strategy = "uuid")
@Column(name = "id", unique = true, nullable = false, length = 50)
    public String getId() {
    return this.id;
    }

    public void setId(String id) {
    this.id = id;
    }
<#list fieldsList as entity>
	<#if entity.fieldType == "java.lang.String">
    @Column(name = "${entity.tabfieldName}")
    public java.lang.String get${entity.firtupFieldName}() {
    return this.${entity.fieldName};
    }

    public void set${entity.firtupFieldName}(java.lang.String ${entity.fieldName}) {
    this.${entity.fieldName} = ${entity.fieldName};
    }
	</#if>
	<#if entity.fieldType == "java.lang.Integer">
    @Column(name = "${entity.tabfieldName}")
    public java.lang.Integer get${entity.firtupFieldName}() {
    return this.${entity.fieldName};
    }

    public void set${entity.firtupFieldName}(java.lang.Integer ${entity.fieldName}) {
    this.${entity.fieldName} = ${entity.fieldName};
    }
	</#if>
	<#if entity.fieldType == "java.lang.Double">
    @Column(name = "${entity.tabfieldName}")
    public java.lang.Double get${entity.firtupFieldName}() {
    return this.${entity.fieldName};
    }

    public void set${entity.firtupFieldName}(java.lang.Double ${entity.fieldName}) {
    this.${entity.fieldName} = ${entity.fieldName};
    }
	</#if>
	<#if entity.fieldType == "java.math.BigDecimal">
    @Column(name = "${entity.tabfieldName}")
    public java.math.BigDecimal get${entity.firtupFieldName}() {
    return this.${entity.fieldName};
    }

    public void set${entity.firtupFieldName}(java.math.BigDecimal ${entity.fieldName}) {
    this.${entity.fieldName} = ${entity.fieldName};
    }
	</#if>
	<#if entity.fieldType == "java.util.Date">
    @Column(name = "${entity.tabfieldName}")
    public java.util.Date get${entity.firtupFieldName}() {
    return this.${entity.fieldName};
    }

    public void set${entity.firtupFieldName}(java.util.Date ${entity.fieldName}) {
    this.${entity.fieldName} = ${entity.fieldName};
    }
	</#if>
	<#if entity.fieldType == "1">
    @Column(name = "${entity.firtdonselffield}id")
    public java.util.Date get${entity.selffield}() {
    return this.${entity.firtdonselffield};
    }

    public void set${entity.selffield}(java.util.Date ${entity.firtdonselffield}) {
    this.${entity.firtdonselffield} = ${entity.firtdonselffield};
    }
	</#if>
</#list>


}