package com.kingnode.gou.entity;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * @author 58120775@qq.com (chenchao)
 */

@Entity
@Table(name="shop_comment_img")
public class ShoppCommentImg extends AuditEntity{
    private ShoppComment shoppComment;//评论对象
    private String imgPath;//图片路径
    @ManyToOne
    @JoinColumn(nullable=false, name="comment_id") @Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
    public ShoppComment getShoppComment(){
        return shoppComment;
    }
    public void setShoppComment(ShoppComment shoppComment){
        this.shoppComment=shoppComment;
    }
    public String getImgPath(){
        return imgPath;
    }
    public void setImgPath(String imgPath){
        this.imgPath=imgPath;
    }
}
