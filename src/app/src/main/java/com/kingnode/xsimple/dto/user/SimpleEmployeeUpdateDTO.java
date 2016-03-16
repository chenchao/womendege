package com.kingnode.xsimple.dto.user;
/**
 * 员工的更新基本信息DTO
 * @author cici
 */
public class SimpleEmployeeUpdateDTO{
    private Long updateTime;
    private String k1;//add/update/del分别表示新增/更新/删除
    private Long id;
    private String loginName;//用户的userId
    public Long getUpdateTime(){
        return updateTime;
    }
    public void setUpdateTime(Long updateTime){
        this.updateTime=updateTime;
    }
    public String getK1(){
        return k1;
    }
    public void setK1(String k1){
        this.k1=k1;
    }
    public Long getId(){
        return id;
    }
    public void setId(Long id){
        this.id=id;
    }
    public String getLoginName(){
        return loginName;
    }
    public void setLoginName(String loginName){
        this.loginName=loginName;
    }
}
