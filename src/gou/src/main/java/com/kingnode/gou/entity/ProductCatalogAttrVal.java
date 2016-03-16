package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品目录组属性值
 */
@Entity @Table(name="product_catalog_attr_val") public class ProductCatalogAttrVal extends BaseEntity{
    private static final long serialVersionUID=2920363390565682222L;
    private Long catalogId;//目录组id
    private Long catalogAttrId;//目录组属性id
    private Long productId;//父商品id
    private Long productSubId;//子商品id
    private String catalogAttrVal;//目录组属性值
    public Long getCatalogId(){
        return catalogId;
    }
    public void setCatalogId(Long catalogId){
        this.catalogId=catalogId;
    }
    public Long getCatalogAttrId(){
        return catalogAttrId;
    }
    public void setCatalogAttrId(Long catalogAttrId){
        this.catalogAttrId=catalogAttrId;
    }
    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;
    }
    public Long getProductSubId(){
        return productSubId;
    }
    public void setProductSubId(Long productSubId){
        this.productSubId=productSubId;
    }
    @Column(length=2000)
    public String getCatalogAttrVal(){
        return catalogAttrVal;
    }
    public void setCatalogAttrVal(String catalogAttrVal){
        this.catalogAttrVal=catalogAttrVal;
    }
}
