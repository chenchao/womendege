package com.kingnode.gou.entity;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
    private OrderDetail orderDetail;//对应订单详情表
    private String orderReturnNo;//退单编号 在订单号前加上R
    private ReturnStatus status;//退货状态 退货申请，待退款，退款完成,拒绝
    @Lob
    private String reson;//退货原因
    private BigDecimal money;//退货金额
    private Long approveTime;//审批时间
    private String img1;//图片地址
    private String img2;//图片地址
    private String img3;//图片地址
    @Enumerated(EnumType.STRING)
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
    public String getImg2(){
        return img2;
    }
    public void setImg2(String img2){
        this.img2=img2;
    }
    public String getImg3(){
        return img3;
    }
    public void setImg3(String img3){
        this.img3=img3;
    }
    public String getImg1(){
        return img1;
    }
    public void setImg1(String img1){
        this.img1=img1;
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
