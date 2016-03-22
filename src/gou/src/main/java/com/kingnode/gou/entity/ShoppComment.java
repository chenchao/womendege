package com.kingnode.gou.entity;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author 58120775@qq.com (chenchao)
 */

@Entity
@Table(name="shop_comment")
public class ShoppComment extends AuditEntity{
    private Long productId;//商品id
    private Long userId;//用户id
    @Lob
    private String content;//心得
    private String score;//评分
    private String label;//标签
    @OneToMany(fetch=FetchType.LAZY,cascade={CascadeType.MERGE,CascadeType.REMOVE})
    @JoinColumn(name = "teacher_id")
    private List<ShoppCommentImg> commentImgs;//评论图片
    public List<ShoppCommentImg> getCommentImgs(){
        return commentImgs;
    }
    public void setCommentImgs(List<ShoppCommentImg> commentImgs){
        this.commentImgs=commentImgs;
    }
    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;
    }
    public Long getUserId(){
        return userId;
    }
    public void setUserId(Long userId){
        this.userId=userId;
    }
    public String getContent(){
        return content;
    }
    public void setContent(String content){
        this.content=content;
    }
    public String getScore(){
        return score;
    }
    public void setScore(String score){
        this.score=score;
    }
    public String getLabel(){
        return label;
    }
    public void setLabel(String label){
        this.label=label;
    }
}
