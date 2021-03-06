package com.rent.common.util;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

/**
 * Created by liu_gl on 2016/5/9.
 */
public class EhcacheUtil {
    public static final CacheManager manager = CacheManager.create();

    public static Object get(String cacheName, Object key) {
        Cache cache = manager.getCache(cacheName);
        if (cache != null) {
            Element element = cache.get(key);
            if (element != null) {
                return element.getObjectValue();
            }
        }
        return null;
    }

    public static void put(String cacheName, Object key, Object value) {
        Cache cache = manager.getCache(cacheName);
        if (cache != null) {
            cache.put(new Element(key, value));
        }
    }

    public static boolean remove(String cacheName, Object key) {
        Cache cache = manager.getCache(cacheName);
        if (cache != null) {
            return cache.remove(key);
        }
        return false;
    }

    public static void main(String[] args) {
        String key = "key";
        String value = "hello";
        EhcacheUtil.put("mytest", key, value);
        System.out.println(EhcacheUtil.get("mytest", key));
    }
}
