package com.rent.common.util;

import org.apache.commons.beanutils.ConvertUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Author:zhangyingbing@meituan.com
 * Date:14-12-9
 * Time:上午11:50
 */
public class ListUtils {

    private static final Logger log = LoggerFactory.getLogger(ListUtils.class);

    public static <T> List<T> toList(T... ts) {
        List<T> list = new ArrayList<T>();
        for (T t : ts) {
            list.add(t);
        }
        return list;
    }

    public static <T> List<T> append(List<T> list, T... ts) {
        for (T t : ts) {
            list.add(t);
        }
        return list;
    }

    public static <T> List<T> toTList(Class<T> clazz, String... elems) {
        List<T> list = new ArrayList<T>();
        for (String e : elems) {
            list.add((T) ConvertUtils.convert(e, clazz));
        }
        return list;
    }

    public static <T extends Comparable<? super T>> void sort(List<T> list) {
        Collections.sort(list);
    }

    public static <T> void sort(List<T> list, Comparator<T> comp) {
        Collections.sort(list, comp);
    }

    public static <T> List<T> clone(List<T> list) {
        if (list == null) {
            return null;
        }

        List<T> ret = null;
        try {
            ret = list.getClass().newInstance();
            for (T t : list) {
                ret.add(t);
            }
        } catch (Exception e) {
            log.error("ListUtils clone", e);
        }
        return ret;
    }

    /**
     * <pre>
     * <code>
     *  List<Integer> list = ListUtils.toList(1, 2, 3, 4, 8, 11);
     *  ListUtils.remove(list, new IListRemovable<Integer>() {
     *  		public boolean removable(int i, Integer elem) {
     * 			if (elem % 2 == 0)
     * 			return true;
     * 		    return false;
     *        }
     * });
     *  </code>
     * </pre>
     */
    public static <T> void remove(List<T> list, ICollectionRemovable<T> removable) {
        List<Integer> removeIndexList = new ArrayList<Integer>();

        for (int i = 0; i < list.size(); i++) {
            T t = list.get(i);
            if (removable.removable(i, t)) {
                removeIndexList.add(i);
            }
        }

        for (int j = removeIndexList.size() - 1; j >= 0; j--) {
            list.remove((int) removeIndexList.get(j));
        }
    }

    public static interface ICollectionRemovable<T> {
        public boolean removable(int i, T t);
    }

}
