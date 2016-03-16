package com.kingnode.xsimple.dto.user;
import org.hibernate.validator.constraints.NotBlank;
/**
 * 检测设备是否在线请求参数
 * @author kongjiangwei@kingnode.com
 */
public class DeviceRequestDTO{
    private String key;//app_key
    private String token;
    @NotBlank(message="设备token不能为空")
    public String getToken(){
        return token;
    }
    public void setToken(String token){
        this.token=token;
    }
    @NotBlank(message="应用标识不能为空")
    public String getKey(){
        return key;
    }
    public void setKey(String key){
        this.key=key;
    }

}
