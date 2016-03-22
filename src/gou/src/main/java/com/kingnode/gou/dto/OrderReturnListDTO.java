package com.kingnode.gou.dto;
import java.math.BigDecimal;

import com.kingnode.gou.entity.OrderHead;

/**
 * @author 58120775@qq.com (chenchao)
 * 订单返回列表
 */
public class OrderReturnListDTO{
    private long productId;//产品id
    private String orderNo;//订单编号
    private BigDecimal price;//价格
    private BigDecimal orgPrice;//原始价格
    private Integer quatity;//数量
    private OrderHead.OrderStatus status;//订单状态，未付款，代发货，已发货，退货
    private String imgPath;//商品图片
    private String productName;//商品名称
    private String guige;//规格
    public long getProductId(){
        return productId;
    }
    public void setProductId(long productId){
        this.productId=productId;
    }
    public String getGuige(){
        return guige;
    }
    public void setGuige(String guige){
        this.guige=guige;
    }
    public String getProductName(){
        return productName;
    }
    public void setProductName(String productName){
        this.productName=productName;
    }
    public String getImgPath(){
        return imgPath;
    }
    public void setImgPath(String imgPath){
        this.imgPath=imgPath;
    }
    public OrderHead.OrderStatus getStatus(){
        return status;
    }
    public void setStatus(OrderHead.OrderStatus status){
        this.status=status;
    }
    public String getOrderNo(){
        return orderNo;
    }
    public void setOrderNo(String orderNo){
        this.orderNo=orderNo;
    }
    public BigDecimal getPrice(){
        return price;
    }
    public void setPrice(BigDecimal price){
        this.price=price;
    }
    public BigDecimal getOrgPrice(){
        return orgPrice;
    }
    public void setOrgPrice(BigDecimal orgPrice){
        this.orgPrice=orgPrice;
    }
    public Integer getQuatity(){
        return quatity;
    }
    public void setQuatity(Integer quatity){
        this.quatity=quatity;
    }
}
