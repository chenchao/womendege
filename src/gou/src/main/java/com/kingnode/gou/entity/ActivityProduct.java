package com.kingnode.gou.entity;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.kingnode.xsimple.entity.AuditEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * @author segry ouyang(328361257@qq.com)
 */
@Entity @Table(name="activity_product")
public class ActivityProduct extends AuditEntity{
    private Activity activity;
    private Product product;
    public ActivityProduct(){}
    public ActivityProduct(Activity activity,Product product){
        this.activity=activity;
        this.product=product;
    }
    @NotNull @ManyToOne @JoinColumn(name="activity_id") @Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
    public Activity getActivity(){
        return activity;
    }
    public void setActivity(Activity activity){
        this.activity=activity;
    }
    @NotNull @ManyToOne @JoinColumn(name="product_id") @Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
    public Product getProduct(){
        return product;
    }
    public void setProduct(Product product){
        this.product=product;
    }
}
