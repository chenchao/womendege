package com.kingnode.xsimple.dto.opinion;
/**
 * 陈超
 * 系统属性
 */
public class SystemAttributeDTO{
    private String telNum;//"13026608678",--联系电话
    private String email;//"asdf@163.com",--电子邮箱
    public SystemAttributeDTO(){
    }
    public SystemAttributeDTO(String telNum,String email){
        this.telNum=telNum;
        this.email=email;
    }
    public String getTelNum(){
        return telNum;
    }
    public void setTelNum(String telNum){
        this.telNum=telNum;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email=email;
    }

}
