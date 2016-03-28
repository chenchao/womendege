package com.kingnode.gou.entity;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author segry ouyang(328361257@qq.com)
 */
@Entity @Table(name="position")
public class Position extends AuditEntity{
    private String code;
    private String name;
    private PositionType type=PositionType.pc;
    private double width;
    private double height;
    public String getCode(){
        return code;
    }
    public void setCode(String code){
        this.code=code;
    }
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name=name;
    }
    @Enumerated(EnumType.STRING)
    public PositionType getType(){
        return type;
    }
    public void setType(PositionType type){
        this.type=type;
    }
    public double getWidth(){
        return width;
    }
    public void setWidth(double width){
        this.width=width;
    }
    public double getHeight(){
        return height;
    }
    public void setHeight(double height){
        this.height=height;
    }
    public enum PositionType{
        app,pc
    }
}
