package com.kingnode.gou.entity;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
/**
 * @author 58120775@qq.com (chenchao)
 */
@Entity
@Table(name="view_product_info")
public class ViewProductInfo implements Serializable{
    @Id private Long productId;
    private String productCode;
    private String productName;
    private String productImg;
    @Transient
    private BigDecimal orgPrice;
    private BigDecimal price;
    private String unit;

    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
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
    public BigDecimal getOrgPrice(){
        return orgPrice;
    }
    public void setOrgPrice(BigDecimal orgPrice){
        this.orgPrice=orgPrice;
    }
    public BigDecimal getPrice(){
        return price;
    }
    public void setPrice(BigDecimal price){
        this.price=price;
    }
    public String getUnit(){
        return unit;
    }
    public void setUnit(String unit){
        this.unit=unit;
    }
}
