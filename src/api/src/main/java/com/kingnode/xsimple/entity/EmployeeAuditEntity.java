package com.kingnode.xsimple.entity;
import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kingnode.xsimple.listener.EmployeeEntityListener;
/**
 * 员工更新的自动更新
 *
 * @author cici
 */
@MappedSuperclass @EntityListeners({EmployeeEntityListener.class})
public abstract class EmployeeAuditEntity{
    private static final long serialVersionUID=163949452818086930L;
    protected Long updateTime;
    protected Long createTime;
    @Column(name="update_time", length=13)
    public Long getUpdateTime(){
        return updateTime;
    }
    public void setUpdateTime(Long updateTime){
        this.updateTime=updateTime;
    }
    @JsonIgnore @Column(name="create_time", length=13, updatable=false)
    public Long getCreateTime(){
        return createTime;
    }
    public void setCreateTime(Long createTime){
        this.createTime=createTime;
    }
}