package com.rent.business.action;

import com.google.common.collect.Maps;
import com.rent.business.entity.RUsersEntity;
import com.rent.business.service.RUsersEntityService;
import com.rent.business.vo.RUsersEntityVo;
import com.rent.common.BaseController;
import com.rent.common.Constants;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import com.rent.system.entity.PlatformEmployee;
import com.rent.system.entity.PlatformNotice;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
* --controller
*
**/
@Controller
@RequestMapping(value = "/bussiness/rUsersEntity")
public class RUsersEntityAction extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(RUsersEntityAction.class);
    @Autowired
    private RUsersEntityService rUsersEntityService;

    /**
    * @param request
    * @return
    */
    @RequestMapping(value = "/index")
    @SystemLog(description = "首页", modelName = "")
    public String index(HttpServletRequest request) {
        String to = request.getParameter("to");
        if (StringUtils.isNotBlank(to)) {
            return to;
        }
        return "business/users/index";
    }

    /**
    * 无查询条件，无分页，无排序
    *
    * @param request
    * @return
    */
    @RequestMapping(value = "/list")
    @ResponseBody
    @SystemLog(description = "列表，无查询条件，无分页，无排序", modelName = "")
    public List<RUsersEntity> list(HttpServletRequest request) {
        List<RUsersEntity> list = rUsersEntityService.getAll();
        return list;
    }

    /**
    * 有查询条件，无分页，无排序
    *
    * @param request
    * @param rUsersEntityVo
    * @return
    */
    @RequestMapping(value = "/listByParameter")
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，无排序", modelName = "")
    public List<RUsersEntity> list(HttpServletRequest request,RUsersEntityVo rUsersEntityVo) {
        List<RUsersEntity> list = rUsersEntityService.find(rUsersEntityVo, null,null,null);
        return list;
    }

    /**
     * 平台管理人员登录
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/login")
    @SystemLog(description = "平台员工登录", modelName = "平台登录模块")
    public ModelAndView login(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String username = request.getParameter("uname");
        username=(username==null?"":username.trim());
        String pwd = request.getParameter("upwd");
        String pwdmd5 = pwd != null ? DigestUtils.md5Hex(pwd) : null;
        RUsersEntity user = rUsersEntityService.findByUnameAndUpwd(
                username, pwdmd5);
        if (user != null) {
//            Subject currentUser = SecurityUtils.getSubject();
//            UsernamePasswordToken token = new UsernamePasswordToken(username,
//                    pwdmd5);
//            currentUser.login(token);// 登录认证 记录登陆信息
//            if (user.getUseFlag()) {
                sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEEID, user.getId());// 设置登录用户信息到session中
                sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEECODE, user.getUname());// 设置登录用户信息到session中
                sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEETRUENAME, user.getTruename());// 设置登录用户信息到session中
                sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEELOGO, user.getImage());// 设置logo信息到session中
                sessionManager.setSessionValue(request, Constants.EMPLOYEE, user);// 设置logo信息到session中
//                //获取通知信息
//                long noticeCount = platformNoticeService.getActiveCount();
//                List<PlatformNotice> noticeList = platformNoticeService.findActiveList();
//                request.setAttribute("noticeCount", noticeCount);
//                request.setAttribute("noticeList", noticeList);

                return new ModelAndView("usercenter");
//            } else {
//                map.put("msg", "你的用户目前为不可用状态，请联系管理人员进行授权！");
//                return new ModelAndView("forward:/platform/index", map);
//            }
        } else {
            map.put("msg", "登录名或者密码有错误,请重新输入！");
            return new ModelAndView("forward:/web/userLogin", map);
        }
    }

    /**
    * 有查询条件，带分页，无排序
    *
    * @param rUsersEntityVo
    * @param offset
    * @param limit
    * @return
    */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，无排序", modelName = "")
    public Map<String,Object> pagerList(RUsersEntityVo rUsersEntityVo, @RequestParam int offset, @RequestParam int limit) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = rUsersEntityService.count(rUsersEntityVo);
        List<RUsersEntity> list = rUsersEntityService.find(rUsersEntityVo,pagerequest,null,null);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 有查询条件，带分页，排序
    *
    * @param request
    * @param rUsersEntityVo
    * @param offset
    * @param limit
    * @param sort
    * @param order
    * @return
    */
    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，排序", modelName = "")
    public Map<String,Object> pagerSortList(HttpServletRequest request,RUsersEntityVo rUsersEntityVo, @RequestParam int offset, @RequestParam int limit,@RequestParam String sort,@RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = rUsersEntityService.count(rUsersEntityVo);
        List<RUsersEntity> list = rUsersEntityService.find(rUsersEntityVo,pagerequest,sort,order);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 添加
    *
    * @param rUsersEntity
    * @return
    */
    @RequestMapping(method=RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "--添加", modelName = "")
    @TokenSubmit(remove = true)
    public Map create(RUsersEntity rUsersEntity){
        Map<String, String> ret = Maps.newHashMap();
        try {
            rUsersEntityService.create(rUsersEntity);
            ret.put("code","200");
            ret.put("msg",messageSource.getMessage("ac.success",null,null));
        } catch (Exception e) {
            e.printStackTrace();
            ret.put("code","1001");
            ret.put("msg",messageSource.getMessage("ac.error",null,null));
        }
        return ret;
    }

    /**
     * 首页更新密码使用
     *
     * @param upwd
     * @param newpwd
     * @return
     */
    @RequestMapping(value = "alterPwd", method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "平台企业员工--平台员工自己更新密码", modelName = "平台企业员工")
    public String updatePwd(HttpServletRequest request, String upwd, String newpwd) {
        String employeeId = sessionManager.getSessionValue(request, Constants.PLATFORMEMPLOYEEID).toString();
        RUsersEntity user = rUsersEntityService.findById(employeeId);
        String msg = "";
        if (!DigestUtils.md5Hex(upwd).equals(user.getUpwd())) {
            msg = "原密码不正确，修改失败！";
        } else {
            user.setUpwd(DigestUtils.md5Hex(newpwd));
            msg = "密码修改成功，下次登录时生效！";
            rUsersEntityService.update(user);
        }
        return msg;
    }

    /***
     * 平台管理人员登出
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/logoutfont")
    @SystemLog(description = "平台员工登出", modelName = "平台登录模块")
    public ModelAndView logout(HttpServletRequest request) {
        sessionManager.removeSessionValue(request, Constants.PLATFORMEMPLOYEEID);// 设置登录用户信息到session中
        sessionManager.removeSessionValue(request, Constants.PLATFORMEMPLOYEECODE);// 设置登录用户信息到session中
        sessionManager.removeSessionValue(request, Constants.PLATFORMEMPLOYEETRUENAME);// 设置登录用户信息到session中
        sessionManager.removeSessionValue(request, Constants.PLATFORMEMPLOYEELOGO);// 设置logo信息到session中
        sessionManager.removeSessionValue(request, Constants.EMPLOYEE);// 设置logo信息到session中

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "退出登录成功！");
        return new ModelAndView("usercenter", map);
    }

    /**
    * 更新
    *
    * @param rUsersEntity
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "--更新", modelName = "")
    public String update(RUsersEntity rUsersEntity, @PathVariable String id){
        rUsersEntityService.update(rUsersEntity);
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
    @SystemLog(description = "--根据id获取唯一记录", modelName = "")
    public RUsersEntity view(@PathVariable String id){
        RUsersEntity rUsersEntity = rUsersEntityService.findById(id);
        return rUsersEntity;
    }

    /**
     * 判断用户是否存在
     *
     * @param uname
     * @return
     */
    @RequestMapping(value="/validUser", method=RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "--判断用户是否存在", modelName = "")
    public String validUser(String uname){
        if (uname == null && "".equalsIgnoreCase(uname)) {
            return "0";
        }
        RUsersEntity rUsersEntity = rUsersEntityService.findByName(uname);
        if (rUsersEntity != null) {
            return "1";
        } else {
            return "0";
        }
    }

    /**
    * 根据id删除一条记录
    *
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "--根据id删除一条记录", modelName = "")
    public String delete(@PathVariable String id){
        rUsersEntityService.delete(id);
        return messageSource.getMessage("ac.dSuccess",null,null);
    }

}
