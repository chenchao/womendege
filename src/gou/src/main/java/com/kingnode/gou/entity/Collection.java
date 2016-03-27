package com.kingnode.gou.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author segry ouyang(328361257@qq.com)
 */
@Entity @Table(name="collection")
public class Collection extends AuditEntity{
    private long customerId;
    private long productId;
    public Collection(long customerId,long productId){
        this.customerId=customerId;
        this.productId=productId;
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
}
