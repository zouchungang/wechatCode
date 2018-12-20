package com.rent.system.action;

import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import com.rent.common.util.Base64Util;
import com.rent.common.util.FileUtils;
import com.rent.common.util.PropertiesUtils;
import com.rent.system.entity.PlatformInfo;
import com.rent.system.service.PlatformInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 平台企业维护action
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/info")
public class PlatformAction extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(PlatformAction.class);
    @Autowired
    private PlatformInfoService platformInfoService;

    /**
     * 转向到平台公司管理主页面
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/platform/platform/index");
    }

    /**
     * 根据id(主键)，返回唯一数据
     *
     * @param id 主键
     * @return
     */
    @RequestMapping(value = "one", method = RequestMethod.GET)
    @ResponseBody
    public PlatformInfo one(String id) {
        return platformInfoService.findById(id);
    }

    /**
     * 获取唯一一条平台企业信息
     *
     * @return
     */
    @RequestMapping(value = "/firstEntity", method = RequestMethod.GET)
    @ResponseBody
    public PlatformInfo firstEntity() {
        PlatformInfo companyinfo = new PlatformInfo();
        List<PlatformInfo> list = platformInfoService.findALL();
        if (list.size() > 0) {
            companyinfo = list.get(0);
        }
        return companyinfo;
    }

    /**
     * 上传平台企业LOGO图片
     *
     * @return
     */
    @SuppressWarnings("finally")
    @RequestMapping(value = "/logo", method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "平台企业信息--上传企业logo", modelName = "平台企业信息")
    public String uploadPhoto(HttpServletRequest request, MultipartFile file) {
        String result = "";
        if (file.getSize() > 0) {
            try {
                // String realPath = request.getSession().getServletContext().getRealPath("");
                PropertiesUtils propertiesUtils = new PropertiesUtils();
                String realPath = propertiesUtils.getConfig("", "commonFiles");
                result = FileUtils.uploadFile(file, "platformLogo", realPath);
            } catch (Exception e) {
                logger.error("上传企业logo失败:" + e.getMessage());
            }
        }
        return result;
    }

    /**
     * 更新平台企业信息
     *
     * @param companyinfo
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台企业信息--修改信息", modelName = "平台企业信息")
    public String update(@PathVariable String id, PlatformInfo companyinfo) {
        platformInfoService.update(companyinfo);
        return messageSource.getMessage("ac.uSuccess", null, null);
    }

    /**
     * 添加平台企业信息
     *
     * @param companyinfo
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "平台企业信息--添加信息", modelName = "平台企业信息")
    public String creat(PlatformInfo companyinfo) {
        List<PlatformInfo> list = platformInfoService.findALL();
        if (list.size() > 0) {
            companyinfo.setId(list.get(0).getId());
            platformInfoService.update(companyinfo);
            return messageSource.getMessage("ac.uSuccess", null, null);
        } else {
            platformInfoService.create(companyinfo);
            return messageSource.getMessage("ac.success", null, null);
        }
    }
}
