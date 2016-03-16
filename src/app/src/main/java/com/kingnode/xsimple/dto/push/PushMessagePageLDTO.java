package com.kingnode.xsimple.dto.push;
/**
 * 请求获取消息列表数据信息DTO,分页
 * @author 448778074@qq.com (cici)
 */
public class PushMessagePageLDTO{
    private Integer p;//当前页
    private Integer s;//页大小
    private String type;//设备类型
    private String token;//设备号
    private String ids;//消息的id集合,以分号;进行切分
    private String key;//应用的apiKey
    public Integer getP(){
        return p;
    }
    public void setP(Integer p){
        this.p=p;
    }
    public Integer getS(){
        return s;
    }
    public void setS(Integer s){
        this.s=s;
    }
    public String getType(){
        return type;
    }
    public void setType(String type){
        this.type=type;
    }
    public String getToken(){
        return token;
    }
    public void setToken(String token){
        this.token=token;
    }
    public String getIds(){
        return ids;
    }
    public void setIds(String ids){
        this.ids=ids;
    }
    public String getKey(){
        return key;
    }
    public void setKey(String key){
        this.key=key;
    }
}
