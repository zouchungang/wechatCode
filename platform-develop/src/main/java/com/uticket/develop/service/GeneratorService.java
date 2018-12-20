package com.uticket.develop.service;

import com.rent.common.util.PropertiesUtils;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.Map;

/**
 * Created by lgl on 2017/4/1.
 */
@Service
public class GeneratorService {
    private String srcDir = getConfigParem("srcDir");//获取配置文件中的源码路径
    private String viewDir = getConfigParem("viewDir");//获取jsp文件存放路径

    private String getConfigParem(String key) {
        PropertiesUtils pu = new PropertiesUtils();
        return pu.getConfig("", key);
    }

    /**
     * 生成dao
     *
     * @param root
     * @param searchFlag
     * @throws IOException
     * @throws TemplateException
     */
    public void generatorDao(Map<String, Object> root, boolean searchFlag)
            throws IOException, TemplateException {
        String daoflag = (String) root.get("daoFlag");// 是否生成dao
        String packageName = (String) root.get("packageName");// 包名
        String className = (String) root.get("className");// 实体类名称
        // 生成dao
        if ("1".equals(daoflag)) {
            String daoPath = srcDir + packageName.replaceAll("\\.", "/") + "/"
                    + "dao" + "/" + className + "Dao.java";

            File daoFile = new File(daoPath);
            if (!daoFile.exists()) {
                File parent = daoFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                daoFile.createNewFile();
            }
            OutputStream daoOut = new FileOutputStream(daoFile);
            Configuration cfg = (Configuration) root.get("cfg");
            Template daoTemp = cfg.getTemplate("dao.ftl");
            daoTemp.setOutputEncoding("UTF-8");
            Writer daoWriter = new OutputStreamWriter(daoOut, "UTF-8");
            daoTemp.process(root, daoWriter);
            daoWriter.flush();
            daoWriter.close();
            daoOut.close();
            String daoCustomPath = srcDir
                    + packageName.replaceAll("\\.", "/") + "/" + "dao"
                    + "/" + className + "DaoCustom.java";
            String daoImplPath = srcDir
                    + packageName.replaceAll("\\.", "/") + "/" + "dao"
                    + "/" + "impl/" + className + "DaoImpl.java";
            File daoCustomFile = new File(daoCustomPath);
            File daoImplFile = new File(daoImplPath);
            if (!daoCustomFile.exists()) {
                File parent = daoCustomFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                daoCustomFile.createNewFile();
            }
            if (!daoImplFile.exists()) {
                File parent = daoImplFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                daoImplFile.createNewFile();
            }
            OutputStream daoCustomOut = new FileOutputStream(daoCustomFile);
            OutputStream daoImplOut = new FileOutputStream(daoImplFile);

            Template daoCustomTemp = cfg.getTemplate("daoCustom.ftl");
            Template daoImplTemp = cfg.getTemplate("daoImpl.ftl");
            daoCustomTemp.setOutputEncoding("UTF-8");
            daoImplTemp.setOutputEncoding("UTF-8");
            Writer daoCustomWriter = new OutputStreamWriter(daoCustomOut,
                    "UTF-8");
            Writer daoImplWriter = new OutputStreamWriter(daoImplOut,
                    "UTF-8");
            daoCustomTemp.process(root, daoCustomWriter);
            daoCustomWriter.flush();
            daoCustomWriter.close();
            daoCustomOut.close();
            daoImplTemp.process(root, daoImplWriter);
            daoImplWriter.flush();
            daoImplWriter.close();
            daoImplOut.close();
        }
    }

    /**
     * 生成service
     *
     * @param root
     * @throws IOException
     * @throws TemplateException
     */
    public void generatorService(Map<String, Object> root) throws IOException,
            TemplateException {
        String serviceflag = (String) root.get("serviceFlag");// 是否生成service
        String packageName = (String) root.get("packageName");// 包名
        String className = (String) root.get("className");// 实体类名称
        if ("1".equals(serviceflag)) {
            Configuration cfg = (Configuration) root.get("cfg");
            // service实现类生成
            String serviceImplPath = srcDir
                    + packageName.replaceAll("\\.", "/") + "/" + "service"
                    + "/" + className + "Service.java";
            File serviceImplFile = new File(serviceImplPath);
            if (!serviceImplFile.exists()) {
                File parent = serviceImplFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                serviceImplFile.createNewFile();
            }
            OutputStream serviceImplOut = new FileOutputStream(serviceImplFile);
            Template serviceImplTemp = cfg.getTemplate("service.ftl");
            serviceImplTemp.setOutputEncoding("UTF-8");
            Writer serviceImplWriter = new OutputStreamWriter(serviceImplOut,
                    "UTF-8");
            serviceImplTemp.process(root, serviceImplWriter);
            serviceImplWriter.flush();
            serviceImplWriter.close();
            serviceImplOut.close();
        }
    }

    /**
     * 生成ACTION
     *
     * @param root
     * @throws IOException
     * @throws TemplateException
     */
    public void generatorController(Map<String, Object> root)
            throws IOException, TemplateException {
        String controllerflag = (String) root.get("controllerFlag");// 是否生成action
        String packageName = (String) root.get("packageName");// 包名
        String className = (String) root.get("className");// 实体类名称
        // 生成controller
        if ("1".equals(controllerflag)) {
            String controllerPath = srcDir + packageName.replaceAll("\\.", "/")
                    + "/" + "action" + "/" + className + "Action.java";
            File controllerFile = new File(controllerPath);
            if (!controllerFile.exists()) {
                File parent = controllerFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                controllerFile.createNewFile();
            }
            OutputStream controllerOut = new FileOutputStream(controllerFile);
            Configuration cfg = (Configuration) root.get("cfg");
            Template controllerTemp = cfg.getTemplate("controller.ftl");
            controllerTemp.setOutputEncoding("UTF-8");
            Writer controllerWriter = new OutputStreamWriter(controllerOut,
                    "UTF-8");
            controllerTemp.process(root, controllerWriter);
            controllerWriter.flush();
            controllerWriter.close();
            controllerOut.close();
        }
    }

    /**
     * 生成实体类校验类
     *
     * @param root
     * @throws IOException
     * @throws TemplateException
     */
    public void generatorstaticmetamodel(Map<String, Object> root)
            throws IOException, TemplateException {
        String packageName = (String) root.get("packageName");// 包名
        String className = (String) root.get("className");// 实体类名称
        // 生成controller
        String controllerPath = srcDir + packageName.replaceAll("\\.", "/")
                + "/entity/" + className + "_.java";
        File controllerFile = new File(controllerPath);
        if (!controllerFile.exists()) {
            File parent = controllerFile.getParentFile();
            if (parent != null && !parent.exists()) {
                parent.mkdirs();
            }
            controllerFile.createNewFile();
        }
        OutputStream controllerOut = new FileOutputStream(controllerFile);
        Configuration cfg = (Configuration) root.get("cfg");
        Template controllerTemp = cfg.getTemplate("staticmetamodel.ftl");
        controllerTemp.setOutputEncoding("UTF-8");
        Writer controllerWriter = new OutputStreamWriter(controllerOut, "UTF-8");
        controllerTemp.process(root, controllerWriter);
        controllerWriter.flush();
        controllerWriter.close();
        controllerOut.close();
    }

    /**
     * 生成jsp页面
     *
     * @param root
     * @throws IOException
     * @throws TemplateException
     */
    public void generatorPager(Map<String, Object> root) throws IOException,
            TemplateException {
        String pagerFlag = (String) root.get("pagerFlag");// 是否生成jsp
        String moduleName = (String) root.get("moduleName");// 实体类名称
        String classNameL = (String) root.get("classNameL");// 实体类参数名称
        String jsptemptype = (String) root.get("jsptemptype");// 生成jsp页面首页的时候的布局模版类型
        // 生成index页面
        if ("1".equals(pagerFlag)) {
            String indexPath = viewDir + moduleName + "/index.jsp";
            File indexFile = new File(indexPath);
            if (!indexFile.exists()) {
                File parent = indexFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                indexFile.createNewFile();
            }
            OutputStream indexOut = new FileOutputStream(indexFile);
            Configuration cfg = (Configuration) root.get("cfg");
            Template indexTemp = cfg.getTemplate(jsptemptype + "_index.ftl");
            indexTemp.setOutputEncoding("UTF-8");
            Writer indexWriter = new OutputStreamWriter(indexOut, "UTF-8");
            indexTemp.process(root, indexWriter);
            indexWriter.flush();
            indexWriter.close();
            indexOut.close();
        }
    }

    /**
     * 生成vo
     *
     * @param root
     * @throws IOException
     * @throws TemplateException
     */
    public void generatorVo(Map<String, Object> root) throws IOException,
            TemplateException {
        String packageName = (String) root.get("packageName");// 包名称
        String className = (String) root.get("className");// 实体类参数名称
        String indexPath = srcDir + packageName.replaceAll("\\.", "/")
                + "/vo/" + className + "Vo.java";
        File indexFile = new File(indexPath);
        if (!indexFile.exists()) {
            File parent = indexFile.getParentFile();
            if (parent != null && !parent.exists()) {
                parent.mkdirs();
            }
            indexFile.createNewFile();
        }
        OutputStream indexOut = new FileOutputStream(indexFile);
        Configuration cfg = (Configuration) root.get("cfg");
        Template indexTemp = cfg.getTemplate("entityVo.ftl");
        indexTemp.setOutputEncoding("UTF-8");
        Writer indexWriter = new OutputStreamWriter(indexOut, "UTF-8");
        indexTemp.process(root, indexWriter);
        indexWriter.flush();
        indexWriter.close();
        indexOut.close();
    }
}
