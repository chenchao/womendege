package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
/**
 * 商品目录组
 */
@Entity @Table(name="product_catalog") public class ProductCatalog extends BaseEntity{
    private static final long serialVersionUID=2753416710803050072L;
    private String catalogName;//目录组名称
    private String catalogDesc;//目录组备注
    private String catalogAttrNames;//目录组属性名称
    private String catalogType;//目录组类型
    private String catalogTypeName;//目录组名称
    public String getCatalogName(){
        return catalogName;
    }
    public void setCatalogName(String catalogName){
        this.catalogName=catalogName;
    }
    @Column(length=2000) public String getCatalogDesc(){
        return catalogDesc;
    }
    public void setCatalogDesc(String catalogDesc){
        this.catalogDesc=catalogDesc;
    }
    @Transient public String getCatalogAttrNames(){
        return catalogAttrNames;
    }
    public void setCatalogAttrNames(String catalogAttrNames){
        this.catalogAttrNames=catalogAttrNames;
    }
    public String getCatalogType(){
        return catalogType;
    }
    public void setCatalogType(String catalogType){
        this.catalogType=catalogType;
    }
    @Transient
    public String getCatalogTypeName(){
        if("SHOP".equals(this.catalogType)){
            return "商品属性";
        }
        if("SPEC".equals(this.catalogType)){
            return "商品规格";
        }
        return catalogTypeName;
    }
    public void setCatalogTypeName(String catalogTypeName){
        this.catalogTypeName=catalogTypeName;
    }
}
