package com.kingnode.gou.entity;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@Table(name="order_return_detail")
public class OrderReturnDetail extends AuditEntity{
    private Long productId;//产品id
    private OrderDetail orderDetail;//对应订单详情表
    private String orderReturnNo;//退单编号 在订单号前加上R
    private ReturnStatus status;//退货状态 退货申请，待退款，退款完成,拒绝
    @Lob
    private String reson;//退货原因
    private BigDecimal money;//退货金额
    private Long approveTime;//审批时间

    public ReturnStatus getStatus(){
        return status;
    }
    public void setStatus(ReturnStatus status){
        this.status=status;
    }
    public String getReson(){
        return reson;
    }
    public void setReson(String reson){
        this.reson=reson;
    }
    public BigDecimal getMoney(){
        return money;
    }
    public void setMoney(BigDecimal money){
        this.money=money;
    }
    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;
    }
    public String getOrderReturnNo(){
        return orderReturnNo;
    }
    public void setOrderReturnNo(String orderReturnNo){
        this.orderReturnNo=orderReturnNo;
    }
    public Long getApproveTime(){
        return approveTime;
    }
    public void setApproveTime(Long approveTime){
        this.approveTime=approveTime;
    }
    @ManyToOne
    @JoinColumn(nullable=false, name="order_detail_id") @Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
    public OrderDetail getOrderDetail(){
        return orderDetail;
    }
    public void setOrderDetail(OrderDetail orderDetail){
        this.orderDetail=orderDetail;
    }
    public enum ReturnStatus{
        daishenhe,daituikuan,wancheng,jujue
    }

}
