package com.kingnode.gou.entity;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
/**
 * 活动表
 *
 * @author
 */
@Entity @Table(name="activity_product_view") public class ActivityProductView implements Serializable{
    @Id private ActivityProductId apId;
    private String productCode;
    private String productName;
    private String productImg;
    private BigDecimal price;
    private String unit;    //单位
    private Double discount;   //折扣
    private String activityCode;
    private String state;
    public ActivityProductId getApId(){
        return apId;
    }
    public void setApId(ActivityProductId apId){
        this.apId=apId;
    }
    public String getProductCode(){
        return productCode;
    }
    public void setProductCode(String productCode){
        this.productCode=productCode;
    }
    public String getProductName(){
        return productName;
    }
    public void setProductName(String productName){
        this.productName=productName;
    }
    public String getProductImg(){
        return productImg;
    }
    public void setProductImg(String productImg){
        this.productImg=productImg;
    }
    public String getUnit(){
        return unit;
    }
    public void setUnit(String unit){
        this.unit=unit;
    }
    public String getActivityCode(){
        return activityCode;
    }
    public void setActivityCode(String activityCode){
        this.activityCode=activityCode;
    }
    public BigDecimal getPrice(){
        return price;
    }
    public void setPrice(BigDecimal price){
        this.price=price;
    }
    @Transient
    public BigDecimal getSalePrice(){
        return price.multiply(BigDecimal.valueOf(discount));
    }
    public Double getDiscount(){
        return discount;
    }
    public void setDiscount(Double discount){
        this.discount=discount;
    }
    public String getState(){
        return state;
    }
    public void setState(String state){
        this.state=state;
    }
}
