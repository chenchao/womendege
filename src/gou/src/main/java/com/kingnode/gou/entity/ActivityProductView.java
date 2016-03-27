package com.kingnode.gou.entity;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 活动表
 *
 * @author
 */
@Entity @Table(name="activity_product_view") public class ActivityProductView implements Serializable{
    @Id private ActivityProduct apId;
    private String productCode;
    private String productName;
    private String productImg;
    private BigDecimal price;
    private BigDecimal salePrice;
    private String unit;    //单位
    private Double discount;   //折扣
    private String activityCode;
    private Activity.ActivityState state;
    public ActivityProduct getApId(){
        return apId;
    }
    public void setApId(ActivityProduct apId){
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
    public BigDecimal getSalePrice(){
        return salePrice;
    }
    public void setSalePrice(BigDecimal salePrice){
        this.salePrice=salePrice;
    }
    public Double getDiscount(){
        return discount;
    }
    public void setDiscount(Double discount){
        this.discount=discount;
    }
    @Enumerated(EnumType.STRING)
    public Activity.ActivityState getState(){
        return state;
    }
    public void setState(Activity.ActivityState state){
        this.state=state;
    }
}
