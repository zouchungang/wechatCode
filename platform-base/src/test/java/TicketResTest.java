import com.rent.common.util.Base64Util;
import com.rent.common.util.DateUtils;
import com.rent.common.util.HxHttpClient;
import com.rent.common.util.JsonUtils;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by Administrator on 2017-04-21.
 */
public class TicketResTest {

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
                ticketRes();
                // 测试内容
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


    private void ticketRes() {
        Map<String, String> dataMap = new HashMap<String, String>();
        dataMap.put("companyCode", "JQ596352");
        dataMap.put("ticketCode", "T151548");
        dataMap.put("bookingDate", "07-01");
        String jsonStr = JsonUtils.toJacksonStr(dataMap);
        String base64OrderStr = Base64Util.encodeBase64(jsonStr);
        Map<String, String> map = new HashMap<String, String>();
        map.put("appId", "JQ596352");
        map.put("appKey", "78d75614b8906359c694cd2689d8216a");
        map.put("systemCode", "48f27c0a3c0b7286570ba366c6f9a3a5");
        map.put("timesTamp", DateUtils.getSystime());
        map.put("content", base64OrderStr);
        map.put("extendData", "");

        String string = JsonUtils.toJacksonStr(map);
        Map<String, String> reqMap = new HashMap<String, String>();
        reqMap.put("reqdata", string);

        String resStr = HxHttpClient.post("http://127.0.0.1:8081/base/api/fsale/ticket/resources/number", reqMap);
        System.out.println("返回数据++++++" + System.currentTimeMillis() + "====" + resStr);
    }
}
