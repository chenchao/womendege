package com.kingnode.gou.dto;
/**
 * @author 58120775@qq.com (chenchao)
 */
public class OrderProductDTO{
    private Long productId;//产品id
    private int count;//数量
    private String guige;//规格
    public String getGuige(){
        return guige;
    }
    public void setGuige(String guige){
        this.guige=guige;
    }
    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;
    }
    public int getCount(){
        return count;
    }
    public void setCount(int count){
        this.count=count;
    }
}
