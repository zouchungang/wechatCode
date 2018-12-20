import org.junit.Test;

import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by Administrator on 2017-04-21.
 */
public class OrderTest {

    @Test
    public void testPostCreateOrder() {
        for (int x = 0; x < 1; x++) {
            int count = 1;
            CyclicBarrier cyclicBarrier = new CyclicBarrier(count);
            ExecutorService executorService = Executors.newFixedThreadPool(count);
            for (int i = 0; i < count; i++)
                executorService.execute(new Task(cyclicBarrier));
            executorService.shutdown();
            while (!executorService.isTerminated()) {
                try {
                    Thread.sleep(1);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public class Task implements Runnable {
        private CyclicBarrier cyclicBarrier;

        public Task(CyclicBarrier cyclicBarrier) {
            this.cyclicBarrier = cyclicBarrier;
        }

        @Override
        public void run() {
            try {
                // 等待所有任务准备就绪
                cyclicBarrier.await();
//                addOrder();
                // 测试内容
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


//    private void addOrder() {
//        //System.out.println("测试下单方法");
//        WsaleOrderInfoVo wsaleOrderInfoVo = new WsaleOrderInfoVo();
//        List<WsaleOrderSplitsVo> orderSplitVos = new ArrayList<WsaleOrderSplitsVo>();
//        wsaleOrderInfoVo.setOrderSource(4);
//        wsaleOrderInfoVo.setOrderSourceCode("b7d183a1fa591e7d65b4f556161a7987");
//        wsaleOrderInfoVo.setOperationMemo("订单来源标示码 b7d183a1fa591e7d65b4f556161a7987");
//        wsaleOrderInfoVo.setOperator("孙宝旦");
//        wsaleOrderInfoVo.setPayType(2);
//        wsaleOrderInfoVo.setPayMethod(5);
//        wsaleOrderInfoVo.setOrderMemo("测试订单");
//        wsaleOrderInfoVo.setPreferentialFlag(0);
//        wsaleOrderInfoVo.setPrintInvoiceFlag(false);
//        wsaleOrderInfoVo.setRebateFlag(0);
//        wsaleOrderInfoVo.setContactName("丹丹");
//        wsaleOrderInfoVo.setContactMobile("13460319618");
//        wsaleOrderInfoVo.setContactIdCard("");
//        wsaleOrderInfoVo.setCompanyCodes("JQ026660");
//        for (int i = 0; i < 2; i++) {
//            WsaleOrderSplitsVo vo = new WsaleOrderSplitsVo();
//            vo.setBeginPassTime("2016-12-23 00:00:01");
//            vo.setEndPassTime("2016-12-24 23:59:59");
//            vo.setCompanyCode("JQ026660");
//            vo.setFactRegType("1," + 2 + i);
//            vo.setFingerprint("1" + i);
//            vo.setGivingFlag(false);
//            vo.setImageBinary("" + i);
//            vo.setTicketNum(1);
//            vo.setPassNo("1" + i);
//            vo.setTnNeed(1);
//            vo.setImagePath("s" + i);
//            vo.setTicketSettlePrice(new BigDecimal("20.00" + i));
//            vo.setTicketPrice(new BigDecimal("50.00" + i));
//            vo.setPlayerIdCard("41061119920213462" + i);
//            vo.setTicketCode("T107659");
//            vo.setPlayerPerTicket(2);
//            vo.setPlayerNum(2);
//            vo.setActiveFlag(1);
//            vo.setActiveMathod(1);
//            vo.setVlidDateNum(1);
//            vo.setVlidDateUnits(1);
//            vo.setCycleUnits(1);
//            vo.setCycleNum(1);
//            vo.setUnitUseNum(1);
//            vo.setActiveNum(1 + i);
//            vo.setQrCode("32542345" + 5 * i);
//            vo.setCardInfo("32542345" + 6 * i);
//            vo.setRegFingerprintMode(0);
//            orderSplitVos.add(vo);
//        }
//        wsaleOrderInfoVo.setOrderSplits(orderSplitVos);
//        String jsonStr = JsonUtils.toJacksonStr(wsaleOrderInfoVo);
//        //System.out.println("测试下单方法json:" + jsonStr);
//        String base64OrderStr = Base64Util.encodeBase64(jsonStr);
//        Map<String, String> map = new HashMap<String, String>();
//        map.put("appId", "JQ026660");
//        map.put("appKey", "752df603179386650e401bdd44c347fc");
//        map.put("timesTamp", DateUtils.getSystime());
//        map.put("content", base64OrderStr);
//        map.put("extendData", "");
//
//        String string = JsonUtils.toJacksonStr(map);
//        Map<String, String> reqMap = new HashMap<String, String>();
//        reqMap.put("reqdata", string);
//
//        String resStr = HxHttpClient.post("http://127.0.0.1:81/base/api/order/wsaleOrder/createOrder", reqMap);
//        System.out.println("返回数据++++++" + System.currentTimeMillis() + "====" + resStr);
//    }
}
