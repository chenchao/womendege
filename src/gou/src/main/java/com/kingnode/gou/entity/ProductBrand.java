package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品品牌
 */
@Entity @Table(name="product_brand") public class ProductBrand extends BaseEntity{
    private static final long serialVersionUID=4832990762676188092L;
    private String brandCode;//品牌代码
    private String brandName;//品牌名称
    private String brandDesc;//品牌描述
    private String brandIcon;//品牌图片
    public String getBrandCode(){
        return brandCode;
    }
    public void setBrandCode(String brandCode){
        this.brandCode=brandCode;
    }
    public String getBrandName(){
        return brandName;
    }
    public void setBrandName(String brandName){
        this.brandName=brandName;
    }
    @Column(length=2000)
    public String getBrandDesc(){
        return brandDesc;
    }
    public void setBrandDesc(String brandDesc){
        this.brandDesc=brandDesc;
    }
    @Column(length=1000)
    public String getBrandIcon(){
        return brandIcon;
    }
    public void setBrandIcon(String brandIcon){
        this.brandIcon=brandIcon;
    }
}
