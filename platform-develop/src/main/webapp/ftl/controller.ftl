package ${packageName}.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.uticket.common.annotation.SystemLog;
import com.uticket.common.annotation.TokenSubmit;

import ${packageName}.entity.${className};
import ${packageName}.vo.${className}Vo;
import ${packageName}.service.${className}Service;
import com.uticket.common.BaseController;
/**
*${moduleMemo!} --controller
*
**/
@Controller
@RequestMapping(value = "/${moduleType}/${classNameL}")
public class ${className}Action extends BaseController{
    private static Logger logger = LoggerFactory.getLogger(${className}Action.class);
    @Autowired
    private ${className}Service ${classNameL}Service;

    /**
    * @param request
    * @return
    */
    @RequestMapping(value = "/index")
    @SystemLog(description = "${moduleMemo!}首页", modelName = "${moduleMemo!}")
    public String index(HttpServletRequest request) {
        return "${moduleName}/index";
    }

    /**
    * 无查询条件，无分页，无排序
    *
    * @param request
    * @return
    */
    @RequestMapping(value = "/list")
    @ResponseBody
    @SystemLog(description = "${moduleMemo!}列表，无查询条件，无分页，无排序", modelName = "${moduleMemo!}")
    public List<${className}> list(HttpServletRequest request) {
        List<${className}> list = ${classNameL}Service.getAll();
        return list;
    }

    /**
    * 有查询条件，无分页，无排序
    *
    * @param request
    * @param ${classNameL}Vo
    * @return
    */
    @RequestMapping(value = "/listByParameter")
    @ResponseBody
    @SystemLog(description = "${moduleMemo!}列表，有查询条件，带分页，无排序", modelName = "${moduleMemo!}")
    public List<${className}> list(HttpServletRequest request,${className}Vo ${classNameL}Vo) {
        List<${className}> list = ${classNameL}Service.find(${classNameL}Vo, null,null,null);
        return list;
    }

    /**
    * 有查询条件，带分页，无排序
    *
    * @param ${classNameL}Vo
    * @param offset
    * @param limit
    * @return
    */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "${moduleMemo!}列表，有查询条件，带分页，无排序", modelName = "${moduleMemo!}")
    public Map<String,Object> pagerList(${className}Vo ${classNameL}Vo, @RequestParam int offset, @RequestParam int limit) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = ${classNameL}Service.count(${classNameL}Vo);
        List<${className}> list = ${classNameL}Service.find(${classNameL}Vo,pagerequest,null,null);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 有查询条件，带分页，排序
    *
    * @param request
    * @param ${classNameL}Vo
    * @param offset
    * @param limit
    * @param sort
    * @param order
    * @return
    */
    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "${moduleMemo!}列表，有查询条件，带分页，排序", modelName = "${moduleMemo!}")
    public Map<String,Object> pagerSortList(HttpServletRequest request,${className}Vo ${classNameL}Vo, @RequestParam int offset, @RequestParam int limit,@RequestParam String sort,@RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = ${classNameL}Service.count(${classNameL}Vo);
        List<${className}> list = ${classNameL}Service.find(${classNameL}Vo,pagerequest,sort,order);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 添加
    *
    * @param ${classNameL}
    * @return
    */
    @RequestMapping(method=RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "${moduleMemo!}--添加", modelName = "${moduleMemo!}")
    @TokenSubmit(remove = true)
    public String create(${className} ${classNameL}){
        ${classNameL}Service.create(${classNameL});
        return messageSource.getMessage("ac.success",null,null);
    }

    /**
    * 更新
    *
    * @param ${classNameL}
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "${moduleMemo!}--更新", modelName = "${moduleMemo!}")
    public String update(${className} ${classNameL}, @PathVariable String id){
        ${classNameL}Service.update(${classNameL});
        return messageSource.getMessage("ac.uSuccess",null,null);
    }

    /**
    * 根据id获取唯一记录
    *
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "${moduleMemo!}--根据id获取唯一记录", modelName = "${moduleMemo!}")
    public ${className} view(@PathVariable String id){
        ${className} ${classNameL} = ${classNameL}Service.findById(id);
        return ${classNameL};
    }

    /**
    * 根据id删除一条记录
    *
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "${moduleMemo!}--根据id删除一条记录", modelName = "${moduleMemo!}")
    public String delete(@PathVariable String id){
        ${classNameL}Service.delete(id);
        return messageSource.getMessage("ac.dSuccess",null,null);
    }

<#list allList as entity>
    <#if entity.validateType == "codeValidate">
    /**
    * 验证${entity.fieldNameU}可用
    *
    * @param ${entity.fieldName}
    * @return
    */
    @RequestMapping(value = "remote${entity.fieldName}")
    @ResponseBody
    public Boolean remote${entity.fieldName}(HttpServletRequest request, @RequestParam(value = "${entity.fieldName}") String ${entity.fieldName}, @RequestParam(value = "id") String id) {
        if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
            ${className} ${classNameL} = ${classNameL}Service.findById(id);
            if (${classNameL} != null) {
                return true;
            } else {
                return false;
            }
        } else {//没有id代表是新增时候的验证，验证是否可用
            long c = ${classNameL}Service.findCountBy${entity.fieldNameF}(${entity.fieldName});
            if (c == 0) {
                return true;
            } else {
                return false;
            }
        }
    }
    </#if>
</#list>
}
