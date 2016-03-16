package com.kingnode.xsimple.dto.user;
import org.hibernate.validator.constraints.NotBlank;
/**
 * 注册请求参数
 * @author kongjiangwei@kingnode.com
 */
public class VersionRequestDTO{
    private String plat;
    private String key;
    private String ver;
    private String vtype="usable";
    public String getVtype(){
        return vtype;
    }
    public void setVtype(String vtype){
        this.vtype=vtype;
    }
    @NotBlank(message="设备平台不能为空")
    public String getPlat(){
        return plat;
    }
    public void setPlat(String plat){
        this.plat=plat;
    }
    @NotBlank(message="应用标识不能为空")
    public String getKey(){
        return key;
    }
    public void setKey(String key){
        this.key=key;
    }
    @NotBlank(message="应用版本号不能为空")
    public String getVer(){
        return ver;
    }
    public void setVer(String ver){
        this.ver=ver;
    }

}
