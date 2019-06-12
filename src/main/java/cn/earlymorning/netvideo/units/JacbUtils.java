package cn.earlymorning.netvideo.units;

import javax.xml.bind.*;
import java.io.StringReader;
import java.io.StringWriter;

/**
 * @author zpf
 * @create 2019-05-28-19:14
 */
public class JacbUtils {

    /**
     * java转化为xml
     * @param object
     * @param encoding
     * @return
     */
    public static String converToxml(Object object,String encoding) {
        String result = null;
        try {
            JAXBContext context = JAXBContext.newInstance(Object.class);
            //将java序列化为xml接口
            Marshaller marshaller = context.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.setProperty(Marshaller.JAXB_ENCODING, encoding);
            //创建流对象
            StringWriter writer = new StringWriter();
            marshaller.marshal(object, writer);
            result = writer.toString();
        } catch (PropertyException e) {
            e.printStackTrace();
        } catch (JAXBException e) {

            e.printStackTrace();
        }

        return result;

    }

    @SuppressWarnings("unchecked")
    public static <T> T converToJavaBean(String xml,Class<T> c) {
        T t = null;
        try {
            JAXBContext context = JAXBContext.newInstance(c);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            t = (T) unmarshaller.unmarshal(new StringReader(xml));
        } catch (JAXBException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return t;
    }
}
