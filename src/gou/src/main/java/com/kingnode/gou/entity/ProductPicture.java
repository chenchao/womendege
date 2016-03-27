package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品图片
 */
@Entity @Table(name="product_picture") public class ProductPicture extends BaseEntity{
    private static final long serialVersionUID=7729773785078498063L;
    private Long productId;//商品id
    private String productType;//商品类型 1.表示商品，2.表示商品详情
    private String pictureLocation;//图片位置
    private Integer pictureSort;//图片排序
    private String pictureName;//图片名称
    private String pictureType;//图片类型
    private String pictureUrl;//图片URL
    private Long pictureSize;//图片大小
    public Long getProductId(){
        return productId;
    }
    public String getProductType(){
        return productType;
    }
    public void setProductType(String productType){
        this.productType=productType;
    }
    public void setProductId(Long productId){
        this.productId=productId;
    }
    public String getPictureLocation(){
        return pictureLocation;
    }
    public void setPictureLocation(String pictureLocation){
        this.pictureLocation=pictureLocation;
    }
    public Integer getPictureSort(){
        return pictureSort;
    }
    public void setPictureSort(Integer pictureSort){
        this.pictureSort=pictureSort;
    }
    public String getPictureName(){
        return pictureName;
    }
    public void setPictureName(String pictureName){
        this.pictureName=pictureName;
    }
    public String getPictureType(){
        return pictureType;
    }
    public void setPictureType(String pictureType){
        this.pictureType=pictureType;
    }
    @Column(length=1000) public String getPictureUrl(){
        return pictureUrl;
    }
    public void setPictureUrl(String pictureUrl){
        this.pictureUrl=pictureUrl;
    }
    public Long getPictureSize(){
        return pictureSize;
    }
    public void setPictureSize(Long pictureSize){
        this.pictureSize=pictureSize;
    }
}
