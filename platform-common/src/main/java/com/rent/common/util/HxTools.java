package com.rent.common.util;

import org.apache.commons.codec.digest.DigestUtils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class HxTools {
    /**
     * 锁对象，可以为任意对象
     */
    private static Object lockObj = "lockerOrder";
    /**
     * 订单号生成计数器
     */
    private static long orderNumCount = 0L;
    /**
     * 每毫秒生成订单号数量最大值
     */
    private static int maxPerMSECSize = 100;

    /**
     * appkey的生成规则：公司编码+appId+公司创建时间，通过MD5加密过后的值
     *
     * @param companyCode
     * @param appId
     * @param createDate
     * @return
     */
    public static String generateKey(String companyCode, String appId, String createDate) {
        String str = companyCode + appId + createDate;
        String appKey = DigestUtils.md5Hex(str);
        return appKey;
    }



    /**
     * 生成非重复订单号，理论上限1毫秒1000个，可扩展
     *
     * @param tname 测试用
     */
    public static String makeOrderNum(String tname) {
        try {
            // 最终生成的订单号
            String finOrderNum = "";
            synchronized (lockObj) {
                // 取系统当前时间作为订单号变量前半部分，精确到毫秒
                long nowLong = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
                // 计数器到最大值归零，可扩展更大，目前1毫秒处理峰值1000个，1秒100万
                if (orderNumCount > maxPerMSECSize) {
                    orderNumCount = 0L;
                }
                //组装订单号
                String countStr = maxPerMSECSize + orderNumCount + "";
                finOrderNum = nowLong + countStr.substring(1);
                orderNumCount++;
                //去除世纪数后随机打乱
                finOrderNum = shuffleForSortingString(finOrderNum.substring(2));
                return finOrderNum;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    /**
     * 将生成订单号乱排
     *
     * @param s
     * @return
     */
    private static String shuffleForSortingString(String s) {
        char[] c = s.toCharArray();
        List<Character> lst = new ArrayList<Character>();
        for (int i = 0; i < c.length; i++) {
            lst.add(c[i]);
        }
        Collections.shuffle(lst);
        String resultStr = "";
        for (int i = 0; i < lst.size(); i++) {
            resultStr += lst.get(i);
        }
        return resultStr;
    }
}
