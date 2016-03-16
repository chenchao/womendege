package com.kingnode.xsimple.dto.user;
import com.kingnode.xsimple.rest.RestStatus;
/**
 * 版本相应DTO信息
 * @author kongjiangwei@kingnode.com
 */
public class VersionResponseDTO extends RestStatus{
    private String vf;
    private String url;
    private String ver;//加入app的版本号信息进行返回
    public String getUrl(){
        return url;
    }
    public void setUrl(String url){
        this.url=url;
    }
    public String getVf(){
        return vf;
    }
    public void setVf(String vf){
        this.vf=vf;
    }
    public String getVer(){
        return ver;
    }
    public void setVer(String ver){
        this.ver=ver;
    }
}
