package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品详情(子商品)
 */
@Entity @Table(name="product_detail") public class ProductDetail extends BaseEntity{
    private static final long serialVersionUID=-7194057601947627607L;
    private Long productId;//父商品id
    private Long catalogId;//目录组id
    private String productSubCode;//子商品编码
    private String productSubName;//子商品名称
    private String productUnit;//基础单位
    private Double productPrice;//基础单价
    private Double productStock;//商品库存
    private Integer productShelves;//上架标识
    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;
    }
    public Long getCatalogId(){
        return catalogId;
    }
    public void setCatalogId(Long catalogId){
        this.catalogId=catalogId;
    }
    public String getProductSubCode(){
        return productSubCode;
    }
    public void setProductSubCode(String productSubCode){
        this.productSubCode=productSubCode;
    }
    @Column(length=1000)
    public String getProductSubName(){
        return productSubName;
    }
    public void setProductSubName(String productSubName){
        this.productSubName=productSubName;
    }
    public String getProductUnit(){
        return productUnit;
    }
    public void setProductUnit(String productUnit){
        this.productUnit=productUnit;
    }
    public Double getProductPrice(){
        return productPrice;
    }
    public void setProductPrice(Double productPrice){
        this.productPrice=productPrice;
    }
    public Double getProductStock(){
        return productStock;
    }
    public void setProductStock(Double productStock){
        this.productStock=productStock;
    }
    public Integer getProductShelves(){
        return productShelves;
    }
    public void setProductShelves(Integer productShelves){
        this.productShelves=productShelves;
    }
}
