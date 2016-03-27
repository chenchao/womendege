package com.kingnode.gou.entity;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author segry ouyang(328361257@qq.com)
 */
@Entity @Table(name="activity_product")
@Embeddable
public class ActivityProduct extends AuditEntity{
    private long activityId;
    private long productId;
    public ActivityProduct(long activityId,long productId){
        this.activityId=activityId;
        this.productId=productId;
    }
    public long getActivityId(){
        return activityId;
    }
    public void setActivityId(long activityId){
        this.activityId=activityId;
    }
    public long getProductId(){
        return productId;
    }
    public void setProductId(long productId){
        this.productId=productId;
    }
}
