//package com.rent.system.action;
//
//import com.rent.common.BaseController;
//import com.rent.common.annotation.SystemLog;
//import com.rent.common.annotation.TokenSubmit;
//import com.rent.common.util.DateUtils;
//import com.rent.company.order.entity.OrderInfo;
//import com.rent.company.order.service.OrderInfoService;
//import com.rent.company.order.vo.OrderInfoVo;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
///**
// * 订单 后台操作-OrderInfo --controller
// */
//@Controller
//@RequestMapping("/platform/orderInfo")
//public class PlatformOrderAction extends BaseController {
//    private static Logger logger = LoggerFactory.getLogger(PlatformOrderAction.class);
//    @Autowired
//    private OrderInfoService orderInfoService;
//
//    /**
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/index")
//    public String index(HttpServletRequest request) {
//        return "platform/orderInfo/index";
//    }
//
//    /**
//     * 无查询条件，无分页，无排序
//     *
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/list")
//    @ResponseBody
//    public List<OrderInfo> list(HttpServletRequest request) {
//        List<OrderInfo> list = orderInfoService.getAll();
//        return list;
//    }
//
//    /**
//     * 有查询条件，无分页，无排序
//     *
//     * @param request
//     * @param orderInfoVo
//     * @return
//     */
//    @RequestMapping(value = "/listByParameter")
//    @ResponseBody
//    public List<OrderInfo> list(HttpServletRequest request, OrderInfoVo orderInfoVo) {
//        List<OrderInfo> list = orderInfoService.find(orderInfoVo, null, null, null);
//        return list;
//    }
//
//    /**
//     * 有查询条件，带分页，无排序
//     *
//     * @param orderInfoVo
//     * @param offset
//     * @param limit
//     * @return
//     */
//    @RequestMapping(value = "/page", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> pagerList(OrderInfoVo orderInfoVo, @RequestParam int offset, @RequestParam int limit) {
//        PageRequest pagerequest = new PageRequest(offset / limit, limit);
//        long total = orderInfoService.count(orderInfoVo);
//        List<OrderInfo> list = orderInfoService.find(orderInfoVo, pagerequest, null, null);
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("total", total);
//        map.put("rows", list);
//        return map;
//    }
//
//    /**
//     * 有查询条件，带分页，排序
//     *
//     * @param request
//     * @param orderInfoVo
//     * @param offset
//     * @param limit
//     * @param sort
//     * @param order
//     * @return
//     */
//    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> pagerSortList(HttpServletRequest request, OrderInfoVo orderInfoVo, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
//        PageRequest pagerequest = new PageRequest(offset / limit, limit);
//        long total = orderInfoService.count(orderInfoVo);
//        List<OrderInfo> list = orderInfoService.find(orderInfoVo, pagerequest, sort, order);
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("total", total);
//        map.put("rows", list);
//        return map;
//    }
//
//    /**
//     * 添加
//     *
//     * @param orderInfo
//     * @return
//     */
//    @RequestMapping(method = RequestMethod.POST)
//    @ResponseBody
//    @SystemLog(description = "订单信息--添加", modelName = "订单信息")
//    @TokenSubmit(remove = true)
//    public String create(OrderInfo orderInfo) {
//        orderInfoService.create(orderInfo);
//        return messageSource.getMessage("ac.success", null, null);
//    }
//
//    /**
//     * 更新
//     *
//     * @param orderInfo
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
//    @ResponseBody
//    @SystemLog(description = "订单信息--更新", modelName = "订单信息")
//    public String update(OrderInfo orderInfo, @PathVariable String id) {
//        orderInfoService.update(orderInfo);
//        return messageSource.getMessage("ac.uSuccess", null, null);
//    }
//
//    /**
//     * 根据id获取唯一记录
//     *
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    @SystemLog(description = "订单信息--根据id获取唯一记录", modelName = "订单信息")
//    public OrderInfo view(@PathVariable String id) {
//        OrderInfo orderInfo = orderInfoService.findById(id);
//        return orderInfo;
//    }
//
//    /**
//     * 根据id删除一条记录
//     *
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//    @ResponseBody
//    @SystemLog(description = "订单信息--根据id删除一条记录", modelName = "订单信息")
//    public String delete(@PathVariable String id) {
//        orderInfoService.delete(id);
//        return messageSource.getMessage("ac.dSuccess", null, null);
//    }
//
//    /**
//     * 获取订单子订单，详情，退订信息。订单操作记录
//     *
//     * @param request
//     * @param orderId
//     * @return
//     */
//    @RequestMapping(value = "/orderDetails", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> orderDetails(HttpServletRequest request, @RequestParam String orderId) {
//        Map<String, Object> objectMap = new HashMap<String, Object>();
//        if (orderId != null && !"".equals(orderId)) {
//            objectMap = orderInfoService.serchOrderSplit(orderId, "");
//        }
//        return objectMap;
//    }
//
//    /**
//     * 平台主页信息
//     * 获取就基础平台主页的报表数据信息
//     * @return
//     */
//    @RequestMapping(value = "/getPageData", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String,Object> initMainpage(){
//        Map<String, Object> map = new HashMap<String, Object>();
//        String payAmount =  orderInfoService.findPayAmountSum();
//        //总订单数
//        String orderNum = orderInfoService.findOrderNumSum("%-%");
//        //本月订单数
//        String orderNumMonth = orderInfoService.findOrderNumSum(DateUtils.getSysmonth()+"%");
//        //当天订单数
//        String orderNumToDay = orderInfoService.findOrderNumSum(DateUtils.getSysdate()+"%");
//
//        Map<String, Object> ordermap =  orderInfoService.findlistGroupByCode("%-%");
//        Map<String, Object> ordermapToDay = orderInfoService.findlistGroupByCode("%"+DateUtils.getSysdate()+"%");
//        map.put("payAmount",payAmount);
//        map.put("orderNum",orderNum);
//        map.put("orderNumMonth",orderNumMonth);
//        map.put("orderNumToDay",orderNumToDay);
//        map.put("list",ordermap);
//        map.put("listToDay",ordermapToDay);
//        return map;
//    }
//
//}
