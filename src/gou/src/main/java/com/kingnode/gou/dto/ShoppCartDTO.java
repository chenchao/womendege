package com.kingnode.gou.dto;
/**
 * @author 58120775@qq.com (chenchao)
 */
public class ShoppCartDTO{
    private Long productId;//产品id
    private Integer quatity;//数量
    private Long userId;
    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;
    }
    public Integer getQuatity(){
        return quatity;
    }
    public void setQuatity(Integer quatity){
        this.quatity=quatity;
    }
    public Long getUserId(){
        return userId;
    }
    public void setUserId(Long userId){
        this.userId=userId;
    }
}
