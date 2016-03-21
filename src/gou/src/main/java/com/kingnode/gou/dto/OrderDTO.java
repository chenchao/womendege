package com.kingnode.gou.dto;
import java.math.BigDecimal;

import com.kingnode.gou.entity.OrderDetail;

/**
 * @author 58120775@qq.com (chenchao)
 */
public class OrderDTO extends OrderDetail{
    private Long invoiceId;//收货地址id
    private String status;//订单状态，未付款，代发货，已发货，退货
    private BigDecimal money;//订单总金额
    private String logisticsNo;//物流编号
    private String logisticsComp;//物流公司
    private String invoiceTimeDesc;//收货时间描述
    private String invoiceTimeType;//收货时间类型 工作日，周末，

    public Long getInvoiceId(){
        return invoiceId;
    }
    public void setInvoiceId(Long invoiceId){
        this.invoiceId=invoiceId;
    }
    public String getStatus(){
        return status;
    }
    public void setStatus(String status){
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
}
