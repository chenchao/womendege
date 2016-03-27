package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import com.kingnode.xsimple.entity.AuditEntity;
import com.kingnode.xsimple.util.dete.DateUtil;
@Entity @Table(name="activity") public class Activity extends AuditEntity{
    private String name;    //特卖名称
    private String content;  //特卖内容
    private Long startTime;        //开始时间
    private Long endTime;        //结束时间
    private String activityCode; //特卖类型
    private Double discount;    //折扣
    private int pri;
    private ActivityState state;
    @NotNull @Column(length=200) public String getName(){
        return name;
    }
    public void setName(String name){
        this.name=name;
    }
    @NotNull @Column(length=400) public String getContent(){
        return content;
    }
    public void setContent(String content){
        this.content=content;
    }
    public Long getStartTime(){
        return startTime;
    }
    public void setStartTime(Long startTime){
        this.startTime=startTime;
    }
    public Long getEndTime(){
        return endTime;
    }
    public void setEndTime(Long endTime){
        this.endTime=endTime;
    }
    public String getActivityCode(){
        return activityCode;
    }
    public void setActivityCode(String activityCode){
        this.activityCode=activityCode;
    }
    public void setDiscount(Double discount){
        this.discount=discount;
    }
    public Double getDiscount(){
        return discount;
    }
    public int getPri(){
        return pri;
    }
    public void setPri(int pri){
        this.pri=pri;
    }
    public ActivityState getState(){
        return state;
    }
    public void setState(ActivityState state){
        this.state=state;
    }
    public enum ActivityState{
        ready("未开始"),running("进行中"),finish("已完成"),closed("已关闭"),delete("已废弃");
        private final String state;
        ActivityState(final String state){
            this.state=state;
        }
        public String getStateName(){
            return state;
        }
    }
    public enum Position{
        top("300:600"),left("400:800"),center("400:800");
        private final String position;
        Position(final String position){
            this.position=position;
        }
        public String getPosition(){
            return position;
        }
    }
    @Transient
    public String getEndTimeStr(){
        return DateUtil.getDate(endTime);
    }
    @Transient
    public String getStartTimeStr(){
        return DateUtil.getDate(startTime);
    }
}