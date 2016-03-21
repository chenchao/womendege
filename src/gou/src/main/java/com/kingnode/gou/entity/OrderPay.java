package com.kingnode.gou.entity;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author 58120775@qq.com (chenchao)
 * 订单支付表
 */

@Entity
@Table(name="order_pay")
public class OrderPay extends AuditEntity{
    private Long userId;//用户id
    private Long orderHeadId;//用户头表id
    @Enumerated(EnumType.STRING)
    private PayStatus status;//成功或者失败
    private String accountNo;//账户
    private BigDecimal money;//订单总金额
    @Enumerated(EnumType.STRING)
    private SourceType sourceType;//pc还是app
    private String remark;//备注

    public Long getUserId(){
        return userId;
    }
    public void setUserId(Long userId){
        this.userId=userId;
    }
    public Long getOrderHeadId(){
        return orderHeadId;
    }
    public void setOrderHeadId(Long orderHeadId){
        this.orderHeadId=orderHeadId;
    }
    public PayStatus getStatus(){
        return status;
    }
    public void setStatus(PayStatus status){
        this.status=status;
    }
    public String getAccountNo(){
        return accountNo;
    }
    public void setAccountNo(String accountNo){
        this.accountNo=accountNo;
    }
    public BigDecimal getMoney(){
        return money;
    }
    public void setMoney(BigDecimal money){
        this.money=money;
    }

    public String getRemark(){
        return remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }
    public SourceType getSourceType(){
        return sourceType;
    }
    public void setSourceType(SourceType sourceType){
        this.sourceType=sourceType;
    }
    public enum PayStatus{
        success,falie
    }
    public enum SourceType{
        PC,IOS,ANDROID
    }
}
