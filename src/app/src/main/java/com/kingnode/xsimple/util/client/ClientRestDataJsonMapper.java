package com.kingnode.xsimple.util.client;
import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
/**
 * 设置客户端显示的null值
 * jackson + spring 支持rest接口，输出的JSON 对于null的字符串是invoiceTitle: null，但是接受方希望返回的是invoiceTitle: ""。解决方法重写ObjectMapper
 *
 * @author caichune@kingnode.com (cici)
 */
public class ClientRestDataJsonMapper extends ObjectMapper{
    public ClientRestDataJsonMapper(){
        super();
        // 允许单引号
        this.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES,true);
        // 字段和值都加引号
        this.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES,true);
       /* // 数字也加引号
        this.configure(JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS,true);
        this.configure(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS,true);*/
        // 空值处理为空串
        this.getSerializerProvider().setNullValueSerializer(new JsonSerializer<Object>(){
            @Override
            public void serialize(Object value,JsonGenerator jg,SerializerProvider sp) throws IOException, JsonProcessingException{
                jg.writeString("");
            }
        });
    }
}
