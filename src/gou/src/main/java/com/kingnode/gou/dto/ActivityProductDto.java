package com.kingnode.gou.dto;
import java.io.Serializable;
/**
 * 活动表
 *
 * @author
 */
public class ActivityProductDto implements Serializable{
    private String activityId;
    private String productId;
    private String productCode;
    private String productName;
    private String productImg;
    private String price;
    private String salePrice;
    private String unit;    //单位
    private int discount;   //折扣
    private String activityType;
    public String getActivityId(){
        return activityId;
    }
    public void setActivityId(String activityId){
        this.activityId=activityId;
    }
    public String getProductId(){
        return productId;
    }
    public void setProductId(String productId){
        this.productId=productId;
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
    public String getPrice(){
        return price;
    }
    public void setPrice(String price){
        this.price=price;
    }
    public String getSalePrice(){
        return salePrice;
    }
    public void setSalePrice(String salePrice){
        this.salePrice=salePrice;
    }
    public String getUnit(){
        return unit;
    }
    public void setUnit(String unit){
        this.unit=unit;
    }
    public int getDiscount(){
        return discount;
    }
    public void setDiscount(int discount){
        this.discount=discount;
    }
    public String getActivityType(){
        return activityType;
    }
    public void setActivityType(String activityType){
        this.activityType=activityType;
    }
}
