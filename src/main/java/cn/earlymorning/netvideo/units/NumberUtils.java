package cn.earlymorning.netvideo.units;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.regex.Pattern;

/**
 * @author zpf
 * @create 2019-05-28-17:02
 */
public class NumberUtils {
    /**
     * 通过java自带函数判断字符串是否为数字
     * @param str
     * @return
     */
    public static boolean isNumeric(String str) {
        if(str==null||"".equals(str)) {
            return false;
        }
        for(int i = str.length();i>=0;i--) {
            if(Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return false;
    }
    /**
     * 通过正则表达式判断字符串是否为数字
     * @param str
     * @return
     */
    public static boolean isNumericByMatch(String str) {
        if(str==null||"".equals(str)) {
            return false;
        }
        Pattern pattern = Pattern.compile("[0-9]*");
        return pattern.matcher(str).matches();
    }
    /**
     * 通过ASCII码判断字符串是否是数字
     * @param str
     * @return
     */
    public static boolean isNumericByAscii(String str) {
        if(str==null||"".equals(str)) {
            return false;
        }
        for(int i=str.length();i>=0;i--) {
            int ch = str.charAt(i);
            if(ch<48||ch>57) {
                return false;
            }
        }
        return true;
    }
    /**
     * 通过正则表达式判断字符串是否为浮点型，包括float和double
     * @param str
     * @return
     */
    public static boolean isDouble(String str) {
        if(str==null||"".equals(str)) {
            return false;
        }
        Pattern pattern = Pattern.compile("^[-\\+]?[.\\d]*$");
        return pattern.matcher(str).matches();
    }
    /**
     * 把字符串转换为数字类型
     * @param str
     * @param scale
     * @return
     */
    public static double stringToDouble(String str,int scale) {
        double d = Double.parseDouble(str);
        return convertDoubleScale(d,scale);
    }
    /**
     * 转换数字保留小数点位数
     * @param value
     * @param scale
     * @return
     */
    public static double convertDoubleScale(double value,int scale) {
        BigDecimal b = BigDecimal.valueOf(value);
        double d1 = b.setScale(scale,BigDecimal.ROUND_HALF_UP ).doubleValue();
        return d1;
    }
    /**
     * 转化数字为千分位字符串
     * @param value
     * @return
     */
    public static String convertDoubleRMBString(double value) {
        String s1 = "";
        BigDecimal b = BigDecimal.valueOf(value);
        DecimalFormat df = new DecimalFormat(",###,##0.00");
        s1 = df.format(b);
        return s1;
    }
    /**
     * 转换数字为字符串保留2位小数
     * @param value
     * @return
     */
    public static String convertDoubleString(double value) {
        return convertDoubleString(value,2);
    }
    /**
     * 转换数字保留位数字符号串
     * @param value
     * @param scale
     * @return
     */
    public static String convertDoubleString(double value,int scale) {
        String s1 = "";
        BigDecimal b = BigDecimal.valueOf(value);
        if(scale==2) {
            DecimalFormat df = new DecimalFormat("0.00");
            s1 = df.format(b);
        }else if(scale==4) {
            DecimalFormat df = new DecimalFormat("0.0000");
            s1 = df.format(b);
        }
        return s1;
    }
    /**
     * 转化字符串为数字类型
     * @param str
     * @return
     */
    public static double stringToFloat(String str) {
        double f = Double.parseDouble(str);
        BigDecimal b = BigDecimal.valueOf(f);
        float f1 = b.setScale(2,BigDecimal.ROUND_HALF_UP ).floatValue();
        return f1;
    }
}
