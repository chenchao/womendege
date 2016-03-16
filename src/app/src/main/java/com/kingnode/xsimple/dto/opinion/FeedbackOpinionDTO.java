package com.kingnode.xsimple.dto.opinion;
/**
 * 陈超 意见反馈dto
 *
 */
public class FeedbackOpinionDTO {
    private String appKey;//应用的appkey
    private String fromSys;
    private String linkPerop; //联系人姓名
    private String phone; //联系电话
    private String content; //内容
    private String packageName; //客户端应用程序的包名
    public String getAppKey(){
        return appKey;
    }
    public void setAppKey(String appKey){
        this.appKey=appKey;
    }
    public String getFromSys(){
        return fromSys;
    }
    public void setFromSys(String fromSys){
        this.fromSys=fromSys;
    }
    public String getLinkPerop(){
        return linkPerop;
    }
    public void setLinkPerop(String linkPerop){
        this.linkPerop=linkPerop;
    }
    public String getPhone(){
        return phone;
    }
    public void setPhone(String phone){
        this.phone=phone;
    }
    public String getContent(){
        return content;
    }
    public void setContent(String content){
        this.content=content;
    }
    public String getPackageName(){
        return packageName;
    }
    public void setPackageName(String packageName){
        this.packageName=packageName;
    }
}
