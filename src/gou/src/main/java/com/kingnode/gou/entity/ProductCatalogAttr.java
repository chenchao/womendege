package com.kingnode.gou.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品目录组属性
 */
@Entity @Table(name="product_catalog_attr") public class ProductCatalogAttr extends BaseEntity{
    private static final long serialVersionUID=8775449235406406854L;
    private Long catalogId;//目录组id
    private String catalogAttrName;//规格属性名称
    private Integer catalogAttrSort;//排序
    public Long getCatalogId(){
        return catalogId;
    }
    public void setCatalogId(Long catalogId){
        this.catalogId=catalogId;
    }
    public String getCatalogAttrName(){
        return catalogAttrName;
    }
    public void setCatalogAttrName(String catalogAttrName){
        this.catalogAttrName=catalogAttrName;
    }
    public Integer getCatalogAttrSort(){
        return catalogAttrSort;
    }
    public void setCatalogAttrSort(Integer catalogAttrSort){
        this.catalogAttrSort=catalogAttrSort;
    }
}
