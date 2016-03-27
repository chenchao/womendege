package com.kingnode.gou.entity;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author segry ouyang(328361257@qq.com)
 */
@Entity @Table(name="footprint")
public class Footprint extends AuditEntity{
    private long customerId;
    private long productId;
    private Date browsingTime;
    public Footprint(long customerId,long productId,Date browsingTime){
        this.customerId=customerId;
        this.productId=productId;
        this.browsingTime=browsingTime;
    }
    public long getCustomerId(){
        return customerId;
    }
    public void setCustomerId(long customerId){
        this.customerId=customerId;
    }
    public long getProductId(){
        return productId;
    }
    public void setProductId(long productId){
        this.productId=productId;
    }
    public Date getBrowsingTime(){
        return browsingTime;
    }
    public void setBrowsingTime(Date browsingTime){
        this.browsingTime=browsingTime;
    }
}
