import com.rent.common.util.Base64Util;
import com.rent.common.util.HxHttpClient;
import com.rent.common.util.JsonUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lgl on 2016/11/29.
 */
public class TerminalTest {

    public void valadate() {
        //设备状态通知
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("appId", "JQ240036");
        map.put("appKey", "b5081999e49113c0d1c3ddcd1f0c4f84");
        map.put("timesTamp", "2016-11-29 14:09:00");
        Map<String, Object> mapc = new HashMap<String, Object>();
        mapc.put("terminalNo", "JQ240036621063713170");
        mapc.put("infoType", 4);
        mapc.put("infoContent", "茶厂村");
        String strc = JsonUtils.toJacksonStr(mapc);
        String mapcstr = Base64Util.encodeBase64(strc);
        map.put("content", mapcstr);
        map.put("extendData", "");

        String string = JsonUtils.toJacksonStr(map);
        Map<String, String> map1 = new HashMap<String, String>();
        map1.put("reqdata", string);
        String str = HxHttpClient.post("http://localhost:8081/base/api/terminal/state", map1);
        System.out.print(str);
    }
}
