package com.kingnode.gou.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author 58120775@qq.com (chenchao)
 * 发票表
 */

@Entity
@Table(name="order_invoice")
public class OrderInvoice extends AuditEntity{
    private Long orderHeadId;//订单头表id
    private String companyName;//公司名称
    private String remark;//备注
    private String money;//金额

    public Long getOrderHeadId(){
        return orderHeadId;
    }
    public void setOrderHeadId(Long orderHeadId){
        this.orderHeadId=orderHeadId;
    }
    public String getCompanyName(){
        return companyName;
    }
    public void setCompanyName(String companyName){
        this.companyName=companyName;
    }
    public String getRemark(){
        return remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }
    public String getMoney(){
        return money;
    }
    public void setMoney(String money){
        this.money=money;
    }
}
