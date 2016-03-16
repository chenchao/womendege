package com.kingnode.gou.entity;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * 实体超类，增加了逻辑删除标记与数据是否有效的标记
 */
@MappedSuperclass public class BaseEntity extends AuditEntity{
    private static final long serialVersionUID=6529177795182979576L;
    protected Integer removeTag=0;
    @NotNull public Integer getRemoveTag(){
        if(removeTag==null){
            return 0;
        }
        return removeTag;
    }
    public void setRemoveTag(Integer removeTag){
        if(removeTag==null){
            removeTag=0;
        }
        this.removeTag=removeTag;
    }

}
