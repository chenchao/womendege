package com.kingnode.gou.dto;
import java.io.Serializable;
import java.math.BigDecimal;
/**
 * 活动范围表
 *
 * @author rascal
 */
public class ProductDto implements Serializable{
    private long productId;
    private String productName;
    private double discount;
    private BigDecimal price;
    private BigDecimal salePrice;
    private String imgPath;
    public ProductDto(long productId,String productName,double discount,BigDecimal price,BigDecimal salePrice,String imgPath){
        this.productId=productId;
        this.productName=productName;
        this.discount=discount;
        this.price=price;
        this.salePrice=salePrice;
        this.imgPath=imgPath;
    }
    public long getProductId(){
        return productId;
    }
    public void setProductId(long productId){
        this.productId=productId;
    }
    public String getProductName(){
        return productName;
    }
    public void setProductName(String productName){
        this.productName=productName;
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
    public String getImgPath(){
        return imgPath;
    }
    public void setImgPath(String imgPath){
        this.imgPath=imgPath;
    }
    public double getDiscount(){
        return discount;
    }
    public void setDiscount(double discount){
        this.discount=discount;
    }
}
