package cn.earlymorning.netvideo.units;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.util.Map;

/**
 * @author zpf
 * @create 2019-05-28-18:53
 */
public class MapToJavaBean {
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public static <T> T map2Java(T javaBean, Map map) {
        //创建javaBean对象
        Object obj = null;
        try {
            //获取javaBean属性
            BeanInfo beanInfo = Introspector.getBeanInfo(javaBean.getClass());
            obj = javaBean.getClass().newInstance();
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            if(propertyDescriptors!=null&&propertyDescriptors.length>0) {
                for(PropertyDescriptor pd:propertyDescriptors) {
                    String propertyName = pd.getName();
                    if(map.containsKey(propertyName)) {
                        Object propertyValue = map.get(propertyName);
                        Object[] args = new Object[1];
                        args[0] = propertyValue;
                        pd.getWriteMethod().invoke(obj, args);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (T) obj;
    }
}
