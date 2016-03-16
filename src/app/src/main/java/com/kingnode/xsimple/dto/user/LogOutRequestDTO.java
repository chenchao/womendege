package com.kingnode.xsimple.dto.user;
import org.hibernate.validator.constraints.NotBlank;
/**
 * 注销登录请求参数
 * @author kongjiangwei@kingnode.com
 */
public class LogOutRequestDTO{
    private String plat;
    private String token;
    @NotBlank(message="设备token不能为空")
    public String getToken(){
        return token;
    }
    public void setToken(String token){
        this.token=token;
    }
    @NotBlank(message="设备平台不能为空")
    public String getPlat(){
        return plat;
    }
    public void setPlat(String plat){
        this.plat=plat;
    }
}
