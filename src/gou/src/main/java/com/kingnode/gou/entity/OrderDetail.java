package com.kingnode.gou.entity;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * @author 58120775@qq.com (chenchao)
 * 订单明细表
 */

@Entity
@Table(name="order_detail")
public class OrderDetail extends AuditEntity{
    private Long productId;//产品id
    private OrderHead orderHead;//订单头表对象
    private String orderNo;//订单编号
    private BigDecimal price;//价格
    private BigDecimal orgPrice;//原始价格
    private Integer quatity;//数量
    private String guige;//规格
    public String getGuige(){
        return guige;
    }
    public void setGuige(String guige){
        this.guige=guige;
    }
    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;
    }
    public String getOrderNo(){
        return orderNo;
    }
    public void setOrderNo(String orderNo){
        this.orderNo=orderNo;
    }
    public BigDecimal getPrice(){
        return price;
    }
    public void setPrice(BigDecimal price){
        this.price=price;
    }
    public BigDecimal getOrgPrice(){
        return orgPrice;
    }
    public void setOrgPrice(BigDecimal orgPrice){
        this.orgPrice=orgPrice;
    }
    public Integer getQuatity(){
        return quatity;
    }
    public void setQuatity(Integer quatity){
        this.quatity=quatity;
    }


    @ManyToOne
    @JoinColumn(nullable=false, name="orderHead_id") @Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
    public OrderHead getOrderHead(){
        return orderHead;
    }
    public void setOrderHead(OrderHead orderHead){
        this.orderHead=orderHead;
    }
}
