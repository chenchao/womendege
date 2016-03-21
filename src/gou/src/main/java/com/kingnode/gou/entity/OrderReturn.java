package com.kingnode.gou.entity;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author 58120775@qq.com (chenchao)
 * 订单支付表
 */

@Entity
@Table(name="order_return")
public class OrderReturn extends AuditEntity{
    private Long userId;//用户id
    private Long orderHeadId;//订单头表id
    @Enumerated(EnumType.STRING)
    private Status status;//待审核，通过，拒绝
    private Long invoiceId;//收货地址id
    @Lob
    private String reson;//退货原因
    private BigDecimal money;//退货金额
    private String logisticsNo;//物流编号
    private String logisticsComp;//物流公司
    private Date logisticsTime;//物流发货时间
    private String payType;//pc还是app
    private String remark;//备注

    public Long getInvoiceId(){
        return invoiceId;
    }
    public void setInvoiceId(Long invoiceId){
        this.invoiceId=invoiceId;
    }
    public Long getUserId(){
        return userId;
    }
    public void setUserId(Long userId){
        this.userId=userId;
    }
    public Status getStatus(){
        return status;
    }
    public void setStatus(Status status){
        this.status=status;
    }
    public Long getOrderHeadId(){
        return orderHeadId;
    }
    public void setOrderHeadId(Long orderHeadId){
        this.orderHeadId=orderHeadId;
    }
    public String getReson(){
        return reson;
    }
    public void setReson(String reson){
        this.reson=reson;
    }
    public String getLogisticsNo(){
        return logisticsNo;
    }
    public void setLogisticsNo(String logisticsNo){
        this.logisticsNo=logisticsNo;
    }
    public String getLogisticsComp(){
        return logisticsComp;
    }
    public void setLogisticsComp(String logisticsComp){
        this.logisticsComp=logisticsComp;
    }
    public Date getLogisticsTime(){
        return logisticsTime;
    }
    public void setLogisticsTime(Date logisticsTime){
        this.logisticsTime=logisticsTime;
    }
    public BigDecimal getMoney(){
        return money;
    }
    public void setMoney(BigDecimal money){
        this.money=money;
    }
    public String getPayType(){
        return payType;
    }
    public void setPayType(String payType){
        this.payType=payType;
    }
    public String getRemark(){
        return remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }
    public enum Status{
        success,falie
    }
}
