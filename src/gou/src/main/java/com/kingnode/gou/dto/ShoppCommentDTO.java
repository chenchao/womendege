package com.kingnode.gou.dto;
import java.util.List;
/**
 * @author 58120775@qq.com (chenchao)
 */
public class ShoppCommentDTO{
    private Long productId;//商品id
    private String content;//心得
    private String score;//评分
    private String label;//标签
    private List<ShoppCommentImgDTO> commentImgs;

    public Long getProductId(){
        return productId;
    }
    public void setProductId(Long productId){
        this.productId=productId;
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
    public List<ShoppCommentImgDTO> getCommentImgs(){
        return commentImgs;
    }
    public void setCommentImgs(List<ShoppCommentImgDTO> commentImgs){
        this.commentImgs=commentImgs;
    }
}
