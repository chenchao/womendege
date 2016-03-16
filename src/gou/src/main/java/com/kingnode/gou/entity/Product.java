package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品
 */
@Entity @Table(name="product") public class Product extends BaseEntity{
    private static final long serialVersionUID=-4198353563861387224L;
    private Long catalogId;//目录组id
    private String productBrand;//所属品牌
    private String productClass;//产品分类
    private String productName;//商品名称
    private String productCode;//产品编码
    private String productShortName;//商品简称
    private String productDesc;//商品描述
    public Long getCatalogId(){
        return catalogId;
    }
    public void setCatalogId(Long catalogId){
        this.catalogId=catalogId;
    }
    public String getProductBrand(){
        return productBrand;
    }
    public void setProductBrand(String productBrand){
        this.productBrand=productBrand;
    }
    public String getProductClass(){
        return productClass;
    }
    public void setProductClass(String productClass){
        this.productClass=productClass;
    }
    @Column(length=1000)
    public String getProductName(){
        return productName;
    }
    public void setProductName(String productName){
        this.productName=productName;
    }
    public String getProductCode(){
        return productCode;
    }
    public void setProductCode(String productCode){
        this.productCode=productCode;
    }
    public String getProductShortName(){
        return productShortName;
    }
    public void setProductShortName(String productShortName){
        this.productShortName=productShortName;
    }
    @Column(length=4000)
    public String getProductDesc(){
        return productDesc;
    }
    public void setProductDesc(String productDesc){
        this.productDesc=productDesc;
    }
}
