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
public class IplimitTest {

    @Test
    public void testPostCreateOrder() {
        for (int x = 0; x < 120; x++) {
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
                addOrder();
                // 测试内容
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


    private void addOrder() {
        Map<String, String> map = new HashMap<String, String>();
        String string = JsonUtils.toJacksonStr(map);
        Map<String, String> reqMap = new HashMap<String, String>();
        reqMap.put("reqdata", string);
        String resStr = HxHttpClient.post("http://127.0.0.1:8081/base/api/test/limitIp", reqMap);
        System.out.println("返回数据++++++" + System.currentTimeMillis() + "====" + resStr);
    }
}
