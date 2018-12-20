package com.rent.baseinfo.action;

import com.rent.baseinfo.entity.Dict;
import com.rent.baseinfo.entity.DictType;
import com.rent.baseinfo.service.DictService;
import com.rent.baseinfo.service.DictTypeService;
import com.rent.baseinfo.vo.DictVo;
import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统数据字典管理
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/baseinfo/dict")
public class DictAction extends BaseController {
    @Autowired
    private DictTypeService dictTypeService;
    @Autowired
    private DictService dictService;

    /**
     * 转向到数据字典管理主页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
            return new ModelAndView("baseinfo/dict_index");
    }


    /**
     * @return
     */
    @RequestMapping(value = "listType", method = RequestMethod.GET)
    @ResponseBody
    public List<DictType> listType() {
        return dictTypeService.findALL();
    }

    /**
     * 根据查询条件显示分页数据
     *
     * @param dict
     * @param offset
     * @param limit
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> listTwo(Dict dict,
                                       @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        List<Dict> list = dictService.find(dict, pagerequest, sort, order);
        long total = dictService.count(dict);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
     * @return
     */
    @RequestMapping(value = "sublist", method = RequestMethod.POST)
    @ResponseBody
    public List<Dict> sublist(String type) {
        return dictService.findByType(type);
    }


    /**
     * @return
     */
    @RequestMapping(value = "sublists", method = RequestMethod.POST)
    @ResponseBody
    public List<Dict> sublists(String type) {
        List<String> listStr = new ArrayList<String>();
        listStr.add(type);
        return dictService.findByTypes(listStr);
    }

    /**
     * 添加数据字典信息
     *
     * @param dict
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "添加数据字典信息", modelName = "数据字典维护")
    @TokenSubmit(remove = true)
    public String add(Dict dict) {
        dictService.create(dict);
        return messageSource.getMessage("ac.success", null, null);
    }

    /**
     * 更新数据字典信息
     *
     * @param dict
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "更新数据字典信息", modelName = "数据字典维护")
    public String update(Dict dict) {
        Dict oldDict = dictService.findById(dict.getId());
        dict.setInitFlag(oldDict.getInitFlag());
        dictService.create(dict);
        return messageSource.getMessage("ac.uSuccess", null, null);
    }

    /**
     * 更新数据字典状态，useFlag
     *
     * @param useflag
     * @param id
     * @return
     */
    @RequestMapping(value = "/sub/use/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "更新数据字典状态", modelName = "数据字典维护")
    public String updateUse(Boolean useflag, @PathVariable String id) {
        Dict dict = dictService.findById(id);
        dict.setUseFlag(useflag);
        dictService.update(dict);
        return messageSource.getMessage("ac.uSuccess", null, null);
    }

    /**
     * 删除数据字典，delete
     *
     * @param id
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "删除数据字典", modelName = "数据字典维护")
    public String delete(@PathVariable String id) {
        Dict d = dictService.findById(id);
        if(d.getInitFlag()){
            return "系统初始化参数，无法删除";
        }else{
            dictService.deleteById(id);
            return messageSource.getMessage("ac.dSuccess", null, null);
        }
    }

    /**
     * 查询能够使用的数据字典类型(记录数据字典id)
     *
     * @param type
     * @return
     */
    @RequestMapping(value = "/dictByType", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "查询能够使用的数据字典类型", modelName = "数据字典维护")
    public List<DictVo> findParamsByType(String type) {
        List<DictVo> dictLi = dictService.findCanUseByTypes(type);
        return dictLi;
    }

    /**
     * 查询能够使用的数据字典类型（记录数据字典value）
     *
     * @param type
     * @return
     */
    @RequestMapping(value = "/dictValueByType", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "查询能够使用的数据字典类型", modelName = "数据字典维护")
    public List<DictVo> findValueParamsByType(String type) {
        List<DictVo> dictLi = dictService.findValueCanUseByTypes(type);
        return dictLi;
    }

    /**
     * 查询能够使用的数据字典类型（记录数据字典value）
     *
     * @param type
     * @return
     */
    @RequestMapping(value = "/showDictNameByTypeValues", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "查询能够使用的数据字典类型", modelName = "数据字典维护")
    public String showDictNameByTypeValues(String type,String values) {
        return dictService.showDictNameByTypeValues(type,values);
    }

    /**
     * 验证数据字典名称
     *
     * @param id
     * @param paramName
     * @return
     */
    @RequestMapping(value = "/validateParamName", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "验证字典名称", modelName = "数据字典维护")
    public Boolean validateParamName(String paramName,String id,String dictTypeId) {
        if (id!=null&&!"".equals(id)){
            Dict dict=dictService.findById(id);
            if (dict!=null){
                String pName=dict.getParamName();
                if(pName.trim().equals(paramName.trim())){
                    return true;
                }else{
                    List<Dict> dictLi=dictService.findByNameAndType(dictTypeId,paramName.trim());
                    if (dictLi.size()>0){
                        return false;
                    }else{
                        return true;
                    }
                }

            }else{
                return false;
            }
        }else{
            List<Dict> dictLi=dictService.findByNameAndType(dictTypeId,paramName.trim());
            if (dictLi.size()>0){
                return false;
            }else{
                return true;
            }
        }

    }

    /**
     * 验证数据字典值
     *
     * @param id
     * @param paramValue
     * @return
     */
    @RequestMapping(value = "/validateParamValue", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "验证字典的值", modelName = "数据字典维护")
    public Boolean validateParamValue(String paramValue,String id,String dictTypeId) {
        if (id!=null&&!"".equals(id)){
            Dict dict=dictService.findById(id);
            if (dict!=null){
                String pValue=dict.getParamValue();
                if(pValue.equals(paramValue)){
                    return true;
                }else{
                    List<Dict> dictLi=dictService.findByValueAndType(dictTypeId,paramValue);
                    if (dictLi.size()>0){
                        return false;
                    }else{
                        return true;
                    }
                }
            }else{
                return false;
            }
        }else{
            List<Dict> dictLi=dictService.findByValueAndType(dictTypeId,paramValue);
            if (dictLi.size()>0){
                return false;
            }else{
                return true;
            }
        }

    }
}
