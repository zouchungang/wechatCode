package ${packageName}.vo;

<#list searchList as entity>
    <#if entity.formType == 'wjselect'>
import ${entity.type};
    </#if>
</#list>

/**
*${moduleMemo!} --查询Vo类
**/
public class ${className}Vo {

    private String id;//主键
<#list searchList as entity>
    <#if entity.type == "java.lang.String">
    private java.lang.String ${entity.fieldName};
    </#if>
    <#if entity.type == "java.lang.Integer">
    private java.lang.Integer ${entity.fieldName};
    </#if>
    <#if entity.type == "java.lang.Double">
    private java.lang.Double ${entity.fieldName};
    </#if>
    <#if entity.type == "java.math.BigDecimal">
    private java.math.BigDecimal ${entity.fieldName};
    </#if>
    <#if entity.type == "java.lang.Boolean">
    private java.lang.Boolean ${entity.fieldName};
    </#if>
    <#if entity.type == "java.util.Date">
    private java.util.Date ${entity.fieldName};
    </#if>
    <#if entity.type == "1">
    private selffield ${entity.firtdonselffield};
    </#if>
    <#if entity.type == "1">
    private selffield ${entity.firtdonselffield};
    </#if>
    <#if entity.formType == 'wjselect'>
    private ${entity.type} ${entity.fieldName};
    </#if>
</#list>

<#list searchList as entity>
    <#if entity.type == "java.lang.String">
    public java.lang.String get${entity.fieldNameF}() {
        return this.${entity.fieldName};
    }

    public void set${entity.fieldNameF}(java.lang.String ${entity.fieldName}) {
        this.${entity.fieldName} = ${entity.fieldName};
    }
    </#if>
    <#if entity.type == "java.lang.Integer">
    public java.lang.Integer get${entity.fieldNameF}() {
        return this.${entity.fieldName};
    }

    public void set${entity.fieldNameF}(java.lang.Integer ${entity.fieldName}) {
        this.${entity.fieldName} = ${entity.fieldName};
    }
    </#if>
    <#if entity.type == "java.lang.Double">
    public java.lang.Double get${entity.fieldNameF}() {
        return this.${entity.fieldName};
    }

    public void set${entity.fieldNameF}(java.lang.Double ${entity.fieldName}) {
        this.${entity.fieldName} = ${entity.fieldName};
    }
    </#if>
    <#if entity.type == "java.math.BigDecimal">
    public java.math.BigDecimal get${entity.fieldNameF}() {
        return this.${entity.fieldName};
    }

    public void set${entity.fieldNameF}(java.math.BigDecimal ${entity.fieldName}) {
        this.${entity.fieldName} = ${entity.fieldName};
    }
    </#if>
    <#if entity.type == "java.lang.Boolean">
    public java.lang.Boolean get${entity.fieldNameF}() {
        return this.${entity.fieldName};
    }

    public void set${entity.fieldNameF}(java.lang.Boolean ${entity.fieldName}) {
        this.${entity.fieldName} = ${entity.fieldName};
    }
    </#if>
    <#if entity.type == "java.util.Date">
    public java.util.Date get${entity.fieldNameF}() {
        return this.${entity.fieldName};
    }

    public void set${entity.fieldNameF}(java.util.Date ${entity.fieldName}) {
        this.${entity.fieldName} = ${entity.fieldName};
    }
    </#if>
    <#if entity.type == "1">
    public java.util.Date get${entity.selffield}() {
        return this.${entity.firtdonselffield};
    }

    public void set${entity.selffield}(java.util.Date ${entity.firtdonselffield}) {
        this.${entity.firtdonselffield} = ${entity.firtdonselffield};
    }
    </#if>
    <#if entity.formType == 'wjselect'>
    public ${entity.type} get${entity.fieldNameF}() {
        return this.${entity.fieldName};
    }

    public void set${entity.fieldNameF}(${entity.type} ${entity.fieldName}) {
        this.${entity.fieldName} = ${entity.fieldName};
    }
    </#if>
</#list>


}