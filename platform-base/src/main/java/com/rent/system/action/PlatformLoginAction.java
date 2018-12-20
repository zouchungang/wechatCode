package com.rent.system.action;

import com.rent.common.BaseController;
import com.rent.common.Constants;
import com.rent.common.annotation.SystemLog;
import com.rent.system.entity.PlatformEmployee;
import com.rent.system.entity.PlatformNotice;
import com.rent.system.service.PlatformEmployeeService;
import com.rent.system.service.PlatformNoticeService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 此类主要是处理平台员工登录和转向使用
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform")
public class PlatformLoginAction extends BaseController {
    @Autowired
    private PlatformEmployeeService platformEmployeeService;
    @Autowired
    private PlatformNoticeService platformNoticeService;

    /**
     * 转向到后台管理登录页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "index")
    public String index(HttpServletRequest request) {
        return "platform/index";
    }

    @RequestMapping(value = "index_v")
    public String index_v(HttpServletRequest request) {
        return "platform/index_v";
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
        String username = request.getParameter("username");
        username=(username==null?"":username.trim());
        String pwd = request.getParameter("password");
        String pwdmd5 = pwd != null ? DigestUtils.md5Hex(pwd) : null;
        PlatformEmployee employee1 = platformEmployeeService.getByEmployeecodeAndPwd(
                username, pwdmd5);
        PlatformEmployee employee2 = platformEmployeeService.getByPhoneAndPwd(
                username, pwdmd5);
        PlatformEmployee employee = employee1 == null ? employee2 : employee1;
        if (employee != null) {
            Subject currentUser = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username,
                    pwdmd5);
            currentUser.login(token);// 登录认证 记录登陆信息
            if (employee.getUseFlag()) {
                sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEEID, employee.getId());// 设置登录用户信息到session中
                sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEECODE, employee.getEmployeeCode());// 设置登录用户信息到session中
                sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEENAME, employee.getEmployeeName());// 设置登录用户信息到session中
                if ("".equals(employee.getPhoto()) || employee.getPhoto() == null) {
                    String defph = "/upfile/default.jpg";
                    sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEELOGO, defph);// 设置登录用户信息到session中
                } else {
                    sessionManager.setSessionValue(request, Constants.PLATFORMEMPLOYEELOGO, employee.getPhoto());// 设置登录用户信息到session中
                }
                sessionManager.setSessionValue(request, Constants.PLATFORMID, employee.getPlatformDept().getPlatformInfo().getId());// 设置登录用户的所属公司信息到session中
                //获取通知信息
                long noticeCount = platformNoticeService.getActiveCount();
                List<PlatformNotice> noticeList = platformNoticeService.findActiveList();
                request.setAttribute("noticeCount", noticeCount);
                request.setAttribute("noticeList", noticeList);

                return new ModelAndView("platform/main");
            } else {
                map.put("msg", "你的用户目前为不可用状态，请联系管理人员进行授权！");
                return new ModelAndView("forward:/web/platform/index", map);
            }
        } else {
            map.put("msg", "登录名或者密码有错误,请重新输入！");
            return new ModelAndView("forward:/web/platform/index", map);
        }
    }

    /***
     * 平台管理人员登出
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/logout")
    @SystemLog(description = "平台员工登出", modelName = "平台登录模块")
    public ModelAndView logout(HttpServletRequest request) {
        sessionManager.removeSessionValue(request, Constants.PLATFORMID);// 销毁登录人员公司的session信息
        sessionManager.removeSessionValue(request, Constants.PLATFORMEMPLOYEEID);// 销毁登录人员的session信息
        sessionManager.removeSessionValue(request, Constants.PLATFORMEMPLOYEECODE);// 销毁登录人员的session信息
        sessionManager.removeSessionValue(request, Constants.PLATFORMEMPLOYEENAME);// 销毁登录人员公司的session信息
        sessionManager.removeSessionValue(request, Constants.PLATFORMEMPLOYEELOGO);// 销毁登录人员公司的session信息
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg", "退出登录成功！");
        return new ModelAndView("forward:/web/platform/index", map);
    }
}
