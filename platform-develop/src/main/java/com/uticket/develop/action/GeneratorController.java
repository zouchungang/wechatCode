package com.uticket.develop.action;

import com.rent.common.util.PropertiesUtils;
import com.uticket.develop.service.GeneratorService;
import com.uticket.develop.vo.TableEntity;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

/**
 * 开发人员使用的代码生成类
 *
 * @author liu_gl
 */
@Controller
public class GeneratorController {
    private static String WAITING = "com.uticket.waiting.";
    @Autowired
    private GeneratorService generatorService;

    private String getConfigParem(String key) {
        PropertiesUtils pu = new PropertiesUtils();
        return pu.getConfig("", key);
    }

    /**
     * 生成代码开始页面
     *
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request) {
        request.setAttribute("srcDir", getConfigParem("srcDir"));
        request.setAttribute("viewDir", getConfigParem("viewDir"));
        return "/index";
    }


    /**
     * 读取实体类里的字段。
     * <p/>
     * 这个是生成jsp的存放路径
     *
     * @param packageName
     * @param className
     * @param moduleMemo
     * @param moduleName
     * @param model
     * @return
     */
    @RequestMapping(value = "/entity")
    public ModelAndView getEntity(String packageName, String className,
                                  String moduleName, String moduleMemo, String moduleType, Model model) {
        ModelAndView modelView = new ModelAndView("/entity");
        String primaryKeyName = "id";
        String wholeClassName = WAITING + className;
        List<TableEntity> returnList = new ArrayList<TableEntity>();
        try {
            Class<?> entity = Class.forName(wholeClassName);
            Field[] fields = entity.getDeclaredFields();
            for (Field field : fields) {
                String fieldName = field.getName();
                if ("serialVersionUID".equals(fieldName))
                    continue;
                try {
                    TableEntity tableEntity = new TableEntity();
                    tableEntity.setFieldName(fieldName);
                    String upperFieldName = fieldName.replaceFirst(fieldName
                            .substring(0, 1), fieldName.substring(0, 1)
                            .toUpperCase());
                    Class<?> type = field.getType();
                    tableEntity.setType(type.getName());
                    Method getter = entity.getMethod("get" + upperFieldName);
                    Annotation[] annotations = getter.getAnnotations();
                    for (Annotation annotation : annotations) {
                        Class<?> annoType = annotation.annotationType();
                        if (annoType.equals(Class
                                .forName("javax.persistence.Column"))) {
                            tableEntity.setAnnoType("Column");
                        } else if (annoType.equals(Class
                                .forName("javax.persistence.ManyToOne"))) {
                            tableEntity.setAnnoType("ManyToOne");
                        } else if (annoType.equals(Class
                                .forName("javax.persistence.Id"))) {
                            primaryKeyName = fieldName;
                        }
                    }
                    returnList.add(tableEntity);
                } catch (NoSuchMethodException e) {
                    continue;
                }
            }
        } catch (Exception e) {
            modelView.setViewName("/index");
            modelView.getModel().put("error","com.uticket.waiting包下没有找到的定义的实体类");
            modelView.getModel().put("srcDir", getConfigParem("srcDir"));
            modelView.getModel().put("viewDir", getConfigParem("viewDir"));
            //e.printStackTrace();
        }

        model.addAttribute("returnList", returnList);//实体类中的字段列表
        model.addAttribute("packageName", packageName);//包
        model.addAttribute("className", className);//实体类名称
        model.addAttribute("moduleName", moduleName);//模块名称
        model.addAttribute("moduleMemo", moduleMemo);//模块描述
        model.addAttribute("primaryKeyName", primaryKeyName);//主键
        model.addAttribute("moduleType", moduleType);//模块类型

        return modelView;
    }

    /**
     * 提交生成action,service,dao,实体校验类
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/generate", method = RequestMethod.POST)
    public String generate(HttpServletRequest request) {
        String daoFlag = request.getParameter("sdao");// 是否生成DAO
        String serviceFlag = request.getParameter("sservice");// 是否生成service
        String controllerFlag = request.getParameter("scontroller");// 是否生成controller
        String pagerFlag = request.getParameter("sjsp");// 是否生成jsp
        String jsptemptype = request.getParameter("jsptemptype");// 生成jsp选择的模板
        String[] fieldNames = request.getParameterValues("fieldName");// 字段数组
        String[] fieldNamesu = request.getParameterValues("fieldNameU");// 字段VIEW
        // NAME数组
        String[] types = request.getParameterValues("type");// 字段类型
        String[] isTree = request.getParameterValues("isTree");// 字段类型
        String[] formTypes = request.getParameterValues("formType");// jsp表单类型
        String[] musts = request.getParameterValues("must");// 是否必填
        String[] validatetype = request.getParameterValues("validatetype");// 是否必填
        String[] showLists = request.getParameterValues("showList");// jsp中是否显示数据列表中
        String[] showSearchs = request.getParameterValues("showSearch");// jsp中是否生成查询条件
        String[] sortSearchs = request.getParameterValues("sortSearch");// jsp中是否生成查询条件
        String[] fieldNameHiddens = request.getParameterValues("fieldNameHidden");//jsp form中是否作为隐藏字段
        String moduleName = request.getParameter("moduleName");// 模块名称生成jsp的时候用到的目录
        String packageName = request.getParameter("packageName");// java的包名称
        String className = request.getParameter("className");// java的类名称
        String moduleMemo = request.getParameter("moduleMemo");//模块描述
//        String primaryKeyName = request.getParameter("primaryKeyName");//主键
        String primaryKeyName = "id";//主键
        String moduleType = request.getParameter("moduleType");//模块类型

        String classNameL = className.replaceFirst(className.substring(0, 1),
                className.substring(0, 1).toLowerCase());// 把类名的第一个字母变为小写，作为参数
        List<TableEntity> searchList = new ArrayList<TableEntity>();
        List<TableEntity> formList = new ArrayList<TableEntity>();
        List<TableEntity> formHiddenList = new ArrayList<TableEntity>();
        List<TableEntity> formShowList = new ArrayList<TableEntity>();
        List<TableEntity> listList = new ArrayList<TableEntity>();
        List<TableEntity> sortList = new ArrayList<TableEntity>();
        List<TableEntity> allList = new ArrayList<TableEntity>();
        boolean searchFlag = false;
        boolean sortFlag = false;
        boolean haveWaijian = false;
        boolean havaTree = false;
        TableEntity treeTE = new TableEntity();//记录树字段
        for (int i = 0, len = fieldNames.length; i < len; i++) {
            String fieldName = fieldNames[i];
            String fieldNameU = fieldNamesu[i];
            String type = types[i];
            String formType = formTypes[i];
            String showList = showLists[i];
            String showSearch = showSearchs[i];
            String sortSearch = sortSearchs[i];
            String fieldNameHidden = fieldNameHiddens[i];
            String mustsStr = musts[i];
            String validatetypeStr = validatetype[i];
            String isTreeStr = isTree[i];
            //判断是否需要显示在列表中
            if ("true".equals(showList)) {
                TableEntity e = new TableEntity();
                e.setFieldName(fieldName);
                e.setFieldNameU(fieldNameU);
                e.setType(type);
                e.setFormType(formType);
                if (formType.equals("wjselect")) {
                    haveWaijian = true;
                }
                e.setSortWhether(sortSearch);
                e.setMustWrite(mustsStr);
                e.setValidateType(validatetypeStr);
                listList.add(e);
            }
            //判断是否树字段
            if ("true".equals(isTreeStr)) {
                treeTE.setFieldName(fieldName);
                treeTE.setFieldNameU(fieldNameU);
                treeTE.setType(type);
                treeTE.setFormType(formType);
                treeTE.setSortWhether(sortSearch);
                treeTE.setMustWrite(mustsStr);
                treeTE.setValidateType(validatetypeStr);
                havaTree = true;
            }
            //判断是否需要添加到搜索条件中
            if ("true".equals(showSearch)) {
                TableEntity e = new TableEntity();
                e.setFieldName(fieldName);
                e.setFieldNameU(fieldNameU);
                e.setType(type);
                e.setFormType(formType);
                e.setSortWhether(sortSearch);
                String fielNamef = fieldName.replaceFirst(fieldName.substring(0, 1),
                        fieldName.substring(0, 1).toUpperCase());// 把类名的第一个字母变为小写，作为参数
                e.setFieldNameF(fielNamef);
                searchList.add(e);
                searchFlag = true;
            }
            //判断是否需要添加到搜索条件中
            if ("true".equals(sortSearch)) {
                TableEntity e = new TableEntity();
                e.setFieldName(fieldName);
                e.setFieldNameU(fieldNameU);
                e.setType(type);
                e.setFormType(formType);
                e.setSortWhether(sortSearch);
                sortList.add(e);
                sortFlag = true;
            }
            //判断是否需要显示在form表单中
            if (formType != null && !"".equals(formType)) {
                TableEntity e = new TableEntity();
                e.setFieldName(fieldName);
                e.setFieldNameU(fieldNameU);
                e.setType(type);
                e.setFormType(formType);
                formList.add(e);
            }
            //判断是否为隐藏字段（jsp form中使用）
            if ("true".equals(fieldNameHidden)) {
                TableEntity e = new TableEntity();
                e.setFieldName(fieldName);
                e.setFieldNameU(fieldNameU);
                e.setType(type);
                e.setFormType(formType);
                formHiddenList.add(e);
            } else {
                TableEntity e = new TableEntity();
                e.setFieldName(fieldName);
                e.setFieldNameU(fieldNameU);
                e.setType(type);
                e.setFormType(formType);
                formShowList.add(e);
            }
            //全部的数据
            TableEntity e = new TableEntity();
            e.setFieldName(fieldName);
            e.setFieldNameU(fieldNameU);
            e.setType(type);
            e.setFormType(formType);
            e.setHiddenWhether(fieldNameHidden);
            e.setMustWrite(mustsStr);
            e.setValidateType(validatetypeStr);
            String fielNamef = fieldName.replaceFirst(fieldName.substring(0, 1),
                    fieldName.substring(0, 1).toUpperCase());// 把类名的第一个字母变为小写，作为参数
            e.setFieldNameF(fielNamef);

            allList.add(e);
        }
        Version version = new Version(2, 3, 24);//设置freemarker版本为最新2.3.24版本
        Configuration cfg = new Configuration(version);
        cfg.setDefaultEncoding("UTF-8");
        try {
            cfg.setServletContextForTemplateLoading(request.getSession().getServletContext(), "ftl");//读取模板
            //cfg.setDirectoryForTemplateLoading(new File(ftlDir + "ftl"));//读取模板
            cfg.setObjectWrapper(new DefaultObjectWrapper(version));
            Map<String, Object> root = new HashMap<String, Object>();
            root.put("daoFlag", daoFlag);
            root.put("serviceFlag", serviceFlag);
            root.put("controllerFlag", controllerFlag);
            root.put("pagerFlag", pagerFlag);
            root.put("jsptemptype", jsptemptype);
            root.put("packageName", packageName);// 包路径
            root.put("className", className);// 实体类名称
            root.put("classNameL", classNameL);
            root.put("moduleName", moduleName);// 模块名称
            root.put("searchFlag", searchFlag);// 是否生成自定义DAO
            root.put("searchList", searchList);// 需要搜索的字段
            root.put("haveWaijian", haveWaijian);// 是否含有外键字段
            root.put("sortList", sortList);// 需要排序的字段
            root.put("formTypes", formTypes);// 需要搜索的字段
            root.put("musts", sortList);// 数据验证是否必填
            root.put("validatetype", validatetype);// 数据验证类型字段

            root.put("formList", formList);
            root.put("formHiddenList", formHiddenList);//jsp form中隐藏字段list
            root.put("formShowList", formShowList);//jsp form中显示字段list
            root.put("listList", listList);//列表显示字段list
            root.put("allList", allList);//全部字段list
            root.put("moduleMemo", moduleMemo);//模块注释
            root.put("primaryKeyName", primaryKeyName);//主键
            root.put("moduleType", moduleType);//模块类型
            root.put("sortFlag", sortFlag);//是否排序
            root.put("havaTree", havaTree);//是否有树字段
            root.put("treeTE", treeTE);//记录树字段
            root.put("cfg", cfg);
            generatorService.generatorDao(root, searchFlag);// 生成dao
            generatorService.generatorService(root);// 生成service
            generatorService.generatorController(root);// 生成action
            generatorService.generatorstaticmetamodel(root);// 生成校验实体类
            generatorService.generatorVo(root);// 生成vo
            if (formTypes != null && Arrays.asList(formTypes).contains("booleanselect")) {
                root.put("havcheckbox", "1");//引入checkboxcss
            } else {
                root.put("havcheckbox", "2");//不引入checkboxcss
            }
            if (validatetype != null && Arrays.asList(validatetype).contains("date") || Arrays.asList(validatetype).contains("datetime")) {
                root.put("havdate", "1");//引入时间js
            } else {
                root.put("havdate", "2");//不引入时间js
            }
            if (sortFlag) {
                root.put("sort", sortList.get(0).getFieldName());//字段
            }
            generatorService.generatorPager(root);// 生成jsp
//            if (showSearchs != null && Arrays.asList(showSearchs).contains("true")) {

//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/success";
    }

}
