package com.rent.common.util;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JsonUtils {

    private static Gson gson = new Gson();

    private static ObjectMapper objmap = new ObjectMapper();

    /**
     * json转换为Object--使用的是GSON转换工具
     *
     * @param <T>
     * @param t
     * @param json
     * @return
     */
    public static <T> Object objFromJson(T t, String json) {
        Object obj = gson.fromJson(json, t.getClass());
        return obj;
    }

    /**
     * json转换为map--使用的是GSON转换工具
     *
     * @param json
     * @return
     */
    public static Map<String, Object> fromJsonStr(String json) {
        Map<String, Object> infoMap = gson.fromJson(json,
                new TypeToken<Map<String, String>>() {
                }.getType());
        return infoMap;
    }

    /**
     * 将json字符串转换为list集合--使用的是GSON转换工具
     *
     * @param <T>
     * @param json
     * @param clsT
     * @return
     */
    public static <T> List<T> jsonToList(String json, Class<T> clsT) {
        Gson gson = new Gson();
        List<T> retList = gson.fromJson(json, new TypeToken<List<T>>() {
        }.getType());
        return retList;
    }

    /**
     * 对象转换为json--使用的是jackson包转换工具
     *
     * @param obj
     * @return
     */
    public static String toJacksonStr(Object obj) {
        String content = "";
        try {
            content = objmap.writeValueAsString(obj);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
            // logger.error("转换JSON数据出错，请检查数据类型");
        }
        return content;
    }

    /**
     * json转为实体对象--使用的是jackson包转换工具
     *
     * @param <T>
     * @param t
     * @param json
     * @return
     */
    public static <T> T jsonToObject(Class<T> t, String json) {
        String content = json;
        try {
            T t1 = objmap.readValue(content, t);
            return t1;
        } catch (JsonParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } catch (JsonMappingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }

    /**
     * json转为List类型
     *
     * @return
     */
    public static List<Map<String, Object>> jsonToList(String json) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            List<Map<String, Object>> list = mapper.readValue(json, List.class);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * @param json
     * @param clazz
     * @param <T>
     * @return
     * @throws Exception
     */
    public static <T> List<T> fromJsonArray(String json, Class<T> clazz) throws Exception {
        List<T> lst = new ArrayList<T>();
        JsonArray array = new JsonParser().parse(json).getAsJsonArray();
        for (final JsonElement elem : array) {
            lst.add(new Gson().fromJson(elem, clazz));
        }
        return lst;
    }
}
