package com.kingnode.xsimple.listener;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import com.kingnode.xsimple.entity.EmployeeAuditEntity;
public class EmployeeEntityListener{
    @PrePersist
    public void prePersist(EmployeeAuditEntity ae){
        ae.setCreateTime(System.currentTimeMillis());
        ae.setUpdateTime(System.currentTimeMillis());
    }
    @PreUpdate
    public void preUpdate(EmployeeAuditEntity ae){
        ae.setUpdateTime(System.currentTimeMillis());
    }
}