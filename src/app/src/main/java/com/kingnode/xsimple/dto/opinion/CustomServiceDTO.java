package com.kingnode.xsimple.dto.opinion;
/**
 * 客服人员信息DTO信息
 * @author cici
 */
public class CustomServiceDTO  {
    private String fullName; //用户全名
    private String uaccount;// 账号
    private String userId; //跟 UserInfo 对象形成 外键关系
    private String fromSys; //跟 UserInfo 对象形成 外键关系
    public String getFullName(){
        return fullName;
    }
    public void setFullName(String fullName){
        this.fullName=fullName;
    }
    public String getUaccount(){
        return uaccount;
    }
    public void setUaccount(String uaccount){
        this.uaccount=uaccount;
    }
    public String getUserId(){
        return userId;
    }
    public void setUserId(String userId){
        this.userId=userId;
    }
    public String getFromSys(){
        return fromSys;
    }
    public void setFromSys(String fromSys){
        this.fromSys=fromSys;
    }
}
