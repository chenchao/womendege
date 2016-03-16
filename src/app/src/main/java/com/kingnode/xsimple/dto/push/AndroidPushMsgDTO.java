package com.kingnode.xsimple.dto.push;
/**
 * android推送带回执消息的DTO
 * @author 448778074@qq.com (cici)
 */
public class AndroidPushMsgDTO{
    private Long id;//消息的主键id
    private String msg;//消息的内容
    public Long getId(){
        return id;
    }
    public void setId(Long id){
        this.id=id;
    }
    public String getMsg(){
        return msg;
    }
    public void setMsg(String msg){
        this.msg=msg;
    }
}
