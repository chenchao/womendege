package com.kingnode.gou.dto;
import java.io.Serializable;
/**
 * 活动范围表
 *
 * @author rascal
 */
public class ActivityDto implements Serializable{
    private String name;    //特卖名称
    private String content;  //特卖内容
    private String startTime;        //开始时间
    private String endTime;        //结束时间
    private String activityCode; //特卖类型
    private Double discount;    //折扣
    private int pri;
    private String imgPath;
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name=name;
    }
    public String getContent(){
        return content;
    }
    public void setContent(String content){
        this.content=content;
    }
    public String getStartTime(){
        return startTime;
    }
    public void setStartTime(String startTime){
        this.startTime=startTime;
    }
    public String getEndTime(){
        return endTime;
    }
    public void setEndTime(String endTime){
        this.endTime=endTime;
    }
    public String getActivityCode(){
        return activityCode;
    }
    public void setActivityCode(String activityCode){
        this.activityCode=activityCode;
    }
    public Double getDiscount(){
        return discount;
    }
    public void setDiscount(Double discount){
        this.discount=discount;
    }
    public int getPri(){
        return pri;
    }
    public void setPri(int pri){
        this.pri=pri;
    }
    public String getImgPath(){
        return imgPath;
    }
    public void setImgPath(String imgPath){
        this.imgPath=imgPath;
    }
}
