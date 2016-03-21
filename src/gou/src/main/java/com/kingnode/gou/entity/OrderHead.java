package com.kingnode.gou.entity;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author 58120775@qq.com (chenchao)
 * 订单头表
 */

@Entity
@Table(name="order_head")
public class OrderHead extends AuditEntity{
    private Long userId;//用户id
    private String userName;//用户名
    @Enumerated(EnumType.STRING)
    private OrderStatus status;//订单状态，未付款，代发货，已发货，退货
    private BigDecimal money;//订单总金额
    private Long invoiceId;//收货地址id
    private String logisticsNo;//物流编号
    private String logisticsComp;//物流公司
    private String invoiceTimeDesc;//收货时间描述
    private String invoiceTimeType;//收货时间类型 工作日，周末，
    private String sourceFrom;//pc还是app
    private String remark;//备注
    private BigDecimal freight;//运费
    private Integer counts;//商品数量
    private String orderHeadNo;//订单头表编号

    public Integer getCounts(){
        return counts;
    }
    public void setCounts(Integer counts){
        this.counts=counts;
    }
    public String getUserName(){
        return userName;
    }
    public void setUserName(String userName){
        this.userName=userName;
    }
    public Long getUserId(){
        return userId;
    }
    public void setUserId(Long userId){
        this.userId=userId;
    }
    public Long getInvoiceId(){
        return invoiceId;
    }
    public void setInvoiceId(Long invoiceId){
        this.invoiceId=invoiceId;
    }
    public OrderStatus getStatus(){
        return status;
    }
    public void setStatus(OrderStatus status){
        this.status=status;
    }
    public BigDecimal getMoney(){
        return money;
    }
    public void setMoney(BigDecimal money){
        this.money=money;
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
    public String getInvoiceTimeDesc(){
        return invoiceTimeDesc;
    }
    public void setInvoiceTimeDesc(String invoiceTimeDesc){
        this.invoiceTimeDesc=invoiceTimeDesc;
    }
    public String getInvoiceTimeType(){
        return invoiceTimeType;
    }
    public void setInvoiceTimeType(String invoiceTimeType){
        this.invoiceTimeType=invoiceTimeType;
    }
    public String getSourceFrom(){
        return sourceFrom;
    }
    public void setSourceFrom(String sourceFrom){
        this.sourceFrom=sourceFrom;
    }
    public String getRemark(){
        return remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }

    public BigDecimal getFreight(){
        return freight;
    }
    public void setFreight(BigDecimal freight){
        this.freight=freight;
    }
    public String getOrderHeadNo(){
        return orderHeadNo;
    }
    public void setOrderHeadNo(String orderHeadNo){
        this.orderHeadNo=orderHeadNo;
    }
    public enum OrderStatus{
        daifukuan,daifahuo,daipingjia
    }
}
