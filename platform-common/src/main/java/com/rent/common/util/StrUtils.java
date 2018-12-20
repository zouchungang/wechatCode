package com.rent.common.util;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

public class StrUtils extends StringUtils {
    private static Logger logger = LoggerFactory.getLogger(StrUtils.class);

    /**
     * 去掉下划线,并转为小写
     *
     * @param tname
     * @return
     */
    public static String dropUnderline(String tname) {
        StringBuffer columnName = new StringBuffer();
        tname = tname.toLowerCase();

        char[] tnames = tname.toCharArray();
        boolean _show = false;
        for (int i = 0; i < tnames.length; i++) {
            if ("_".equals(String.valueOf(tnames[i]))) {
                _show = true;
                continue;
            }
            if (_show) {
                columnName.append(String.valueOf(Character.toUpperCase(tnames[i])));
                _show = false;
            } else {
                columnName.append(String.valueOf(tnames[i]));
            }
        }
        return columnName.toString();
    }

    /**
     * 增加下划线,并转为大写
     *
     * @param tname
     * @return
     */
    public static String addUnderline(String tname) {
        String columnName = "";

        char[] tnames = tname.toCharArray();
        boolean _show = false;
        for (int i = 0; i < tnames.length; i++) {
            if (!Character.isLowerCase(tnames[i]) && i > 0) {
                _show = true;
            }
            if (_show) {
                columnName += "_" + tnames[i];
                _show = false;
            } else {
                columnName += tnames[i];
            }
        }
        return columnName.toLowerCase();
    }

    /**
     * 专用，元 转 分  12位数字
     *
     * @param m
     */
    public static String money(String m) {
        String s = null;
        if (null != m && m.trim().length() > 0) {
            if (m.contains(".")) {//如果有小数点
                String[] ss = m.split("\\.");
                if (ss.length > 1) {
                    if (ss[1].length() > 2) {
                        s = ss[0] + ss[1].substring(0, 2);
                    } else if (ss[1].length() < 2) {
                        s = ss[0] + rightPad(ss[1], 2, "0");
                    } else {
                        s = ss[0] + ss[1];
                    }
                }
                s = leftPad(s, 12, "0");
            } else {
                s = leftPad(m + "00", 12, "0");
            }
        } else {
            s = "000000000000";
        }
        return s;
    }

    /**
     * 产生一个规则如下的实体卡号
     * 4位随数+当前日期-2015-10-01的天数(4位)+4位随数
     *
     * @return
     */
    public static String getEntityCardNo() {
        int prefixNum = -1;//前四位随机数
        int suffixNum = -1;//后四位随机数
        String middleNum = "";//中间四位
        try {
            prefixNum = (int) (Math.random() * (9999 - 1000 + 1)) + 1000;
            suffixNum = (int) (Math.random() * (9999 - 1000 + 1)) + 1000;
            SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date begin = dfs.parse("2015-10-01");
            java.util.Date end = dfs.parse(DateUtils.getSysdate());
            long between = (end.getTime() - begin.getTime()) / 1000;//除以1000是为了转换成秒

            long day = between / (24 * 3600);
            middleNum = day + "";
            int index = 4 - middleNum.length();
            if (middleNum.length() < 4) {
                for (int i = 1; i <= index; i++) {
                    middleNum = "0" + middleNum;
                }
            }

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return prefixNum + middleNum + suffixNum;
    }

    /**
     * @param b 生成多少位
     * @return
     */
    public static String generateNumberCode(int b) {
        String chars = "0123456789";
        char[] rands = new char[b];
        for (int i = 0; i < b; i++) {
            int rand = (int) (Math.random() * 10);
            rands[i] = chars.charAt(rand);
        }
        return String.valueOf(rands);
    }

    /**
     * 日期（YYYYMMDDHHMMSS）+随机数
     *
     * @param b 生成多少位
     * @return
     */
    public static String dateAddGenerateNumber(int b) {
        String chars = "0123456789";
        char[] rands = new char[b];
        for (int i = 0; i < b; i++) {
            int rand = (int) (Math.random() * 10);
            rands[i] = chars.charAt(rand);
        }
        return DateUtils.getSystimeNoSign() + String.valueOf(rands);
    }

    /**
     * @param numStr 是否数字字符串
     * @return
     */
    public static boolean validateNumber(String numStr) {
        return numStr.matches("^[-+]?(([0-9]+)([.]([0-9]+))?|([.]([0-9]+))?)$");
    }

    /**
     * 返回首字母
     *
     * @param strChinese
     * @param bUpCase    1(返回大写字母) 2(返回小写字母)
     * @return
     */
    public static String getPYIndexStr(String strChinese, int bUpCase) {
        try {
            StringBuffer buffer = new StringBuffer();
            byte b[] = strChinese.getBytes("GBK");//把中文转化成byte数组
            for (int i = 0; i < b.length; i++) {
                if ((b[i] & 255) > 128) {
                    int char1 = b[i++] & 255;
                    char1 <<= 8;//左移运算符用“<<”表示，是将运算符左边的对象，向左移动运算符右边指定的位数，并且在低位补零。其实，向左移n位，就相当于乘上2的n次方
                    int chart = char1 + (b[i] & 255);
                    buffer.append(getPYIndexChar((char) chart, bUpCase));
                    continue;
                }
                char c = (char) b[i];
                if (!Character.isJavaIdentifierPart(c))//确定指定字符是否可以是 Java 标识符中首字符以外的部分。
                    c = 'A';
                buffer.append(c);
            }
            return buffer.toString();
        } catch (Exception e) {
            logger.info((new StringBuilder()).append("\u53D6\u4E2D\u6587\u62FC\u97F3\u6709\u9519").append(e.getMessage()).toString());
        }
        return null;
    }

    /**
     * 得到首字母
     *
     * @param strChinese
     * @param bUpCase
     * @return
     */
    private static char getPYIndexChar(char strChinese, int bUpCase) {
        int charGBK = strChinese;
        char result;
        if (charGBK >= 45217 && charGBK <= 45252)
            result = 'A';
        else if (charGBK >= 45253 && charGBK <= 45760)
            result = 'B';
        else if (charGBK >= 45761 && charGBK <= 46317)
            result = 'C';
        else if (charGBK >= 46318 && charGBK <= 46825)
            result = 'D';
        else if (charGBK >= 46826 && charGBK <= 47009)
            result = 'E';
        else if (charGBK >= 47010 && charGBK <= 47296)
            result = 'F';
        else if (charGBK >= 47297 && charGBK <= 47613)
            result = 'G';
        else if (charGBK >= 47614 && charGBK <= 48118)
            result = 'H';
        else if (charGBK >= 48119 && charGBK <= 49061)
            result = 'J';
        else if (charGBK >= 49062 && charGBK <= 49323)
            result = 'K';
        else if (charGBK >= 49324 && charGBK <= 49895)
            result = 'L';
        else if (charGBK >= 49896 && charGBK <= 50370)
            result = 'M';
        else if (charGBK >= 50371 && charGBK <= 50613)
            result = 'N';
        else if (charGBK >= 50614 && charGBK <= 50621)
            result = 'O';
        else if (charGBK >= 50622 && charGBK <= 50905)
            result = 'P';
        else if (charGBK >= 50906 && charGBK <= 51386)
            result = 'Q';
        else if (charGBK >= 51387 && charGBK <= 51445)
            result = 'R';
        else if (charGBK >= 51446 && charGBK <= 52217)
            result = 'S';
        else if (charGBK >= 52218 && charGBK <= 52697)
            result = 'T';
        else if (charGBK >= 52698 && charGBK <= 52979)
            result = 'W';
        else if (charGBK >= 52980 && charGBK <= 53688)
            result = 'X';
        else if (charGBK >= 53689 && charGBK <= 54480)
            result = 'Y';
        else if (charGBK >= 54481 && charGBK <= 55289)
            result = 'Z';
        else
            result = (char) (65 + (new Random()).nextInt(25));
        if (2 == bUpCase)
            result = Character.toLowerCase(result);
        return result;
    }

    /**
     * 获得规定位数的String类型流水号（前面补0）
     * 注：liuShuiHao位数请不要小于noLength
     *
     * @param liuShuiHao 需要转的号
     * @param noLength   位数
     */
    public static String intToStringBit(Integer liuShuiHao, Integer noLength) {
        String strHao = liuShuiHao.toString();
        while (strHao.length() < noLength) {
            strHao = "0" + strHao;
        }
        return strHao;
    }


    /**
     * 判断访问URI是否是静态文件请求
     *
     * @throws Exception
     */
    public static boolean isStaticFile(String uri) {
        // 静态文件后缀
        String[] staticFiles = {".css", ".js", ".png", ".jpg", ".gif", ".jpeg", ".bmp", ".ico", ".swf", ".psd", ".htc", ".crx", ".xpi", ".exe", ".ipa", ".apk"};
//		if ((StringUtils.startsWith(uri, "/static/") || StringUtils.endsWithAny(uri, sfs))
//				&& !StringUtils.endsWithAny(uri, ".jsp") && !StringUtils.endsWithAny(uri, ".java")){
//			return true;
//		}
        //&& !StringUtils.endsWithAny(uri, urlSuffix)
        String[] dt = {".jsp", ".java"};
        if (StringUtils.endsWithAny(uri, staticFiles) && !StringUtils.endsWithAny(uri, dt)) {
            return true;
        }
        return false;
    }

    //首字母转小写
    public static String toLowerCaseFirstOne(String s) {
        if (Character.isLowerCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
    }

    //首字母转大写
    public static String toUpperCaseFirstOne(String s) {
        if (Character.isUpperCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder()).append(Character.toUpperCase(s.charAt(0))).append(s.substring(1)).toString();
    }

}
