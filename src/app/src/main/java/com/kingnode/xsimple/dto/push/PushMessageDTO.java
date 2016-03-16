package com.kingnode.xsimple.dto.push;
/**
 * 推送的消息内容信息
 * @author 448778074@qq.com (cici)
 */
public class PushMessageDTO extends AndroidPushMsgDTO{
    private String title;
    public String getTitle(){
        return title;
    }
    public void setTitle(String title){
        this.title=title;
    }
}
