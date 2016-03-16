package com.kingnode.xsimple.dto.user;
/**
 * 功能的应用包信息DTO
 * @author cici
 */
public class FunctionAppPackageDTO{
    private String ifwurl;// ios要打开的应用的URL
    private String ipkg;//IOS的包名
    private String apkg;// android要打开的应用的包名
    private String url;//下载地址,Android和ios统一的
    public String getIfwurl(){
        return ifwurl;
    }
    public void setIfwurl(String ifwurl){
        this.ifwurl=ifwurl;
    }
    public String getIpkg(){
        return ipkg;
    }
    public void setIpkg(String ipkg){
        this.ipkg=ipkg;
    }
    public String getApkg(){
        return apkg;
    }
    public void setApkg(String apkg){
        this.apkg=apkg;
    }
    public String getUrl(){
        return url;
    }
    public void setUrl(String url){
        this.url=url;
    }
}
