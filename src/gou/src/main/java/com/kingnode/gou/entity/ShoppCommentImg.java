package com.kingnode.gou.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author 58120775@qq.com (chenchao)
 */

@Entity
@Table(name="shop_comment_img")
public class ShoppCommentImg extends AuditEntity{
    private Long commentId;//评论id
    private String imgPath;//图片路径
    public Long getCommentId(){
        return commentId;
    }
    public void setCommentId(Long commentId){
        this.commentId=commentId;
    }
    public String getImgPath(){
        return imgPath;
    }
    public void setImgPath(String imgPath){
        this.imgPath=imgPath;
    }
}
