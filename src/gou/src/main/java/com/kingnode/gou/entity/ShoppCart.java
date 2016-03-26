package com.kingnode.gou.entity;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author 58120775@qq.com (chenchao)
 *
 */

@Entity
@Table(name="shopp_cart")
public class ShoppCart extends AuditEntity{
    private Long userId;//用户id
    private ActiveType status;//状态，有效，无效
    private Long productId;//产品id
    private Integer quatity;//数量

    public Long getUserId(){
        return userId;
    }
    public void setUserId(Long userId){
        this.userId=userId;
    }
    @Enumerated(EnumType.STRING)
    public ActiveType getStatus(){
        return status;
    }
    public void setStatus(ActiveType status){
        this.status=status;
    }
    public Integer getQuatity(){
        return quatity;
    }
    public void setQuatity(Integer quatity){
        this.quatity=quatity;
    }
    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;

    }

}
