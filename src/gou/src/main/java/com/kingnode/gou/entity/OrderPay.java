package com.kingnode.gou.entity;
import java.math.BigDecimal;
import javax.persistence.Column;
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
    private String orderNo;//订单号
    private String subject;//订单标题
    private String status;//成功或者失败,根据 一开始是start，然后开始return ，然后开始notify
    private String payStatus;//支付状态
    private String accountNo;//账户
    private String tradeNo;//支付宝返回号
    private BigDecimal beforeMoney;//订单总金额
    private BigDecimal afterDaynMoney;//订单金额
    private BigDecimal money;//订单金额


    private SourceType sourceType;//pc还是app
    private String remark;//备注

    @Column(length = 500)
    private String payBeforeStr;//支付前发送的字符串
    @Column(length = 500)
    private String payAfterStr;//返回信息字符串
    @Column(length = 500)
    private String payAfterDaynStr;//返回信息动态字符串

    public String getPayStatus(){
        return payStatus;
    }
    public void setPayStatus(String payStatus){
        this.payStatus=payStatus;
    }
    public String getTradeNo(){
        return tradeNo;
    }
    public void setTradeNo(String tradeNo){
        this.tradeNo=tradeNo;
    }
    public BigDecimal getMoney(){
        return money;
    }
    public void setMoney(BigDecimal money){
        this.money=money;
    }
    public BigDecimal getBeforeMoney(){
        return beforeMoney;
    }
    public void setBeforeMoney(BigDecimal beforeMoney){
        this.beforeMoney=beforeMoney;
    }
    public BigDecimal getAfterDaynMoney(){
        return afterDaynMoney;
    }
    public void setAfterDaynMoney(BigDecimal afterDaynMoney){
        this.afterDaynMoney=afterDaynMoney;
    }
    public String getSubject(){
        return subject;
    }
    public void setSubject(String subject){
        this.subject=subject;
    }
    public String getPayBeforeStr(){
        return payBeforeStr;
    }
    public void setPayBeforeStr(String payBeforeStr){
        this.payBeforeStr=payBeforeStr;
    }
    public String getPayAfterStr(){
        return payAfterStr;
    }
    public void setPayAfterStr(String payAfterStr){
        this.payAfterStr=payAfterStr;
    }
    public String getPayAfterDaynStr(){
        return payAfterDaynStr;
    }
    public void setPayAfterDaynStr(String payAfterDaynStr){
        this.payAfterDaynStr=payAfterDaynStr;
    }
    public Long getUserId(){
        return userId;
    }
    public void setUserId(Long userId){
        this.userId=userId;
    }
    public String getAccountNo(){
        return accountNo;
    }
    public void setAccountNo(String accountNo){
        this.accountNo=accountNo;
    }

    public String getRemark(){
        return remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }
    @Enumerated(EnumType.STRING)
    public SourceType getSourceType(){
        return sourceType;
    }
    public void setSourceType(SourceType sourceType){
        this.sourceType=sourceType;
    }

    public String getOrderNo(){
        return orderNo;
    }
    public void setOrderNo(String orderNo){
        this.orderNo=orderNo;
    }
    public String getStatus(){
        return status;
    }
    public void setStatus(String status){
        this.status=status;
    }
    public enum SourceType{
        PC,APP
    }
}
