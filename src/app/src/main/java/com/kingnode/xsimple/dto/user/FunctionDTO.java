package com.kingnode.xsimple.dto.user;
/**
 * @author kongjiangwei@kingnode.com
 */
public class FunctionDTO extends SimpleFunctionDTO{
    
    private String title;
    private String k2;
    private String zip;
    private String size;//zipSize-->size
    private String zver;//zipVersion-->zver
    private String status;
    private String icon;//fIcon-->icon
    private String ver;//fVersion-->ver
    private String url;//interfaceUrl-->url
    private String key;//funckey-->key
    public String getTitle(){
        return title;
    }
    public void setTitle(String title){
        this.title=title;
    }
    public String getK2(){
        return k2;
    }
    public void setK2(String k2){
        this.k2=k2;
    }
    public String getZip(){
        return zip;
    }
    public void setZip(String zip){
        this.zip=zip;
    }
    public String getSize(){
        return size;
    }
    public void setSize(String size){
        this.size=size;
    }
    public String getZver(){
        return zver;
    }
    public void setZver(String zver){
        this.zver=zver;
    }
    public String getStatus(){
        return status;
    }
    public void setStatus(String status){
        this.status=status;
    }
    public String getIcon(){
        return icon;
    }
    public void setIcon(String icon){
        this.icon=icon;
    }
    public String getVer(){
        return ver;
    }
    public void setVer(String ver){
        this.ver=ver;
    }
    public String getUrl(){
        return url;
    }
    public void setUrl(String url){
        this.url=url;
    }
    public String getKey(){
        return key;
    }
    public void setKey(String key){
        this.key=key;
    }
}
