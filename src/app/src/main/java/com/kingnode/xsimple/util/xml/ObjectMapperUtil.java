package com.kingnode.xsimple.util.xml;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kingnode.diva.mapper.JsonMapper;
/**
 * JsonMapper工具类
 * @author caichune@kingnode.com (cici)
 */
public class ObjectMapperUtil extends JsonMapper{
    private ObjectMapper mapper;
    public ObjectMapperUtil(JsonInclude.Include include){
        mapper=new ObjectMapper();
        // 设置输出时包含属性的风格
        if(include!=null){
            mapper.setSerializationInclusion(include);
        }
        // 设置输入时忽略在JSON字符串中存在但Java对象实际没有的属性
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
    }
    public ObjectMapperUtil(){
        mapper=new ObjectMapper();
    }
    public ObjectMapper getMapper(){
        return mapper;
    }
    /**
     * 获取泛型的Collection Type
     *
     * @param collectionClass 泛型的Collection
     * @param elementClasses  元素类
     *
     * @return JavaType Java类型
     *
     * @since 1.0
     */
    public JavaType getCollectionType(Class<?> collectionClass,Class<?>... elementClasses){
        return mapper.getTypeFactory().constructParametricType(collectionClass,elementClasses);
    }
}
