package cn.earlymorning.netvideo.test;


import cn.earlymorning.netvideo.units.JavaBase64;

/**
 *
 *
 * @author zpf
 * @create 2019-05-14-22:06
 */
public class TestMsg {

	public static void main(String[] args) {
		String pwd = "zpf1010";
		String basePwd = JavaBase64.baseEncode(pwd);
		System.out.println(basePwd);

		Integer count = 1;
		System.out.println(count>0);
	}

}

