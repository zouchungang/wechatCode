import com.rent.common.util.Base64Util;
import com.rent.common.util.HxHttpClient;
import com.rent.common.util.JsonUtils;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lgl on 2016/11/29.
 */
public class VerificationTest {


    /**
     * 获取通行信息
     */
    @Test
    public void verificationInfo() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("appId", "JQ676499");
        map.put("appKey", "16c916418b16dcf5524bcaf69930a50a");
        map.put("timesTamp", "2017-6-29 00:00:00");
        Map<String, Object> mapc = new HashMap<String, Object>();
        mapc.put("passNumber", "13065611791548321");
        mapc.put("inputType", 4);
        mapc.put("terminalNo", "JQ676499427459684732");
        String strc = JsonUtils.toJacksonStr(mapc);
        String mapcstr = Base64Util.encodeBase64(strc);
        map.put("content", mapcstr);
        map.put("extendData", "");
        String string = JsonUtils.toJacksonStr(map);
        Map<String, String> map1 = new HashMap<String, String>();
        map1.put("reqdata", string);
        String str = HxHttpClient.post("http://localhost:8081/base/api/verification/info", map1);
        System.out.print(str);
    }

    /**
     * 核销
     */
    @Test
    public void verificationVerifi() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("appId", "JQ676499");
        map.put("appKey", "16c916418b16dcf5524bcaf69930a50a");
        map.put("timesTamp", "2017-6-29 00:00:00");
        Map<String, Object> mapc = new HashMap<String, Object>();
        mapc.put("passNumber", "25502987610703319");
        mapc.put("inputType", 4);
        mapc.put("terminalNo", "JQ676499427459684732");
        mapc.put("direction", 1);
        mapc.put("personNum", 1);
        String strc = JsonUtils.toJacksonStr(mapc);
        String mapcstr = Base64Util.encodeBase64(strc);
        map.put("content", mapcstr);
        map.put("extendData", "");
        String string = JsonUtils.toJacksonStr(map);
        Map<String, String> map1 = new HashMap<String, String>();
        map1.put("reqdata", string);
        String str = HxHttpClient.post("http://127.0.0.1:8081/base/api/verification/verifi", map1);
        System.out.print(str);
    }

    /**
     *登记通关类型信息
     */
    @Test
    public void registInformation() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("appId", "JQ026660");
        map.put("appKey", "752df603179386650e401bdd44c347fc");
        map.put("timesTamp", "sadfgadsfga");
        Map<String, Object> mapc = new HashMap<String, Object>();
        mapc.put("passNumber", "31150074515560418");
        mapc.put("checkType", 4);
        mapc.put("terminalNo", "JQ035604008217698598");
        mapc.put("info", "烧豆腐");
        mapc.put("backparam", "");
        String strc = JsonUtils.toJacksonStr(mapc);
        String mapcstr = Base64Util.encodeBase64(strc);
        map.put("content", mapcstr);
        map.put("extendData", "");
        String string = JsonUtils.toJacksonStr(map);
        Map<String, String> map1 = new HashMap<String, String>();
        map1.put("reqdata", string);
        String str = HxHttpClient.post("http://localhost:8081/base/api/verification/registInformation", map1);
        System.out.print(str);
    }
}
