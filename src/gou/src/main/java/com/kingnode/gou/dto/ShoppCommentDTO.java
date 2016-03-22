package com.kingnode.gou.dto;
import java.util.List;

import com.kingnode.gou.entity.ShoppCommentImg;
/**
 * @author 58120775@qq.com (chenchao)
 */
public class ShoppCommentDTO{
    private String content;//心得
    private String score;//评分
    private String label;//标签

    private List<ShoppCommentImg> commentImgs;
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
    public List<ShoppCommentImg> getCommentImgs(){
        return commentImgs;
    }
    public void setCommentImgs(List<ShoppCommentImg> commentImgs){
        this.commentImgs=commentImgs;
    }
}
