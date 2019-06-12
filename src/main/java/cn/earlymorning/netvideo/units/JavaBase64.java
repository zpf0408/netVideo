package cn.earlymorning.netvideo.units;

import sun.misc.BASE64Encoder;

/**
 * @author zpf
 * @create 2019-05-28-19:25
 */
public class JavaBase64 {
    /**
     * 对字符串加密
     * @param key
     * @return
     */
    public static String baseEncode(String key) {
        BASE64Encoder encoder = new BASE64Encoder();
        String encodeKey = encoder.encode(key.getBytes());
        return encodeKey;
    }
}
