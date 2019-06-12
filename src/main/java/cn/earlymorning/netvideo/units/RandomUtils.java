package cn.earlymorning.netvideo.units;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 * @author zpf
 * @create 2019-05-28-17:29
 */
public class RandomUtils {

    public static Integer numberRandom(){
        Integer i = (int)(Math.random()*8999+1000);
        //Random r = new Random();
       // ThreadLocalRandom random = new ThreadLocalRandom();
        //Integer i = 8;
        return i;
    }

    public static void main(String[] args) {
        System.out.println(numberRandom());
    }
}
