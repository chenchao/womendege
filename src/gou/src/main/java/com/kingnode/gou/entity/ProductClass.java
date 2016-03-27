package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
/**
 * 商品分类
 */
@Entity @Table(name="product_class") public class ProductClass extends BaseEntity{
    private static final long serialVersionUID=8001067583981417901L;
    private String classCode;//分类代码
    private String className;//分类名称
    private String classKeyword;//关键字
    private String parentClass;//上级分类
    private String classDesc;//分类描述
    private String path;//路径
    private Integer classSort;//分类排序
    private Integer depth;//深度
    private String parentName;//上级分类名称
    public String getClassCode(){
        return classCode;
    }
    public void setClassCode(String classCode){
        this.classCode=classCode;
    }
    public String getClassName(){
        return className;
    }
    public void setClassName(String className){
        this.className=className;
    }
    @Column(length=1000)
    public String getClassKeyword(){
        return classKeyword;
    }
    public void setClassKeyword(String classKeyword){
        this.classKeyword=classKeyword;
    }
    public String getParentClass(){
        return parentClass;
    }
    public void setParentClass(String parentClass){
        this.parentClass=parentClass;
    }
    @Column(length=2000)
    public String getClassDesc(){
        return classDesc;
    }
    public void setClassDesc(String classDesc){
        this.classDesc=classDesc;
    }
    @Column(length=500)
    public String getPath(){
        return path;
    }
    public void setPath(String path){
        this.path=path;
    }
    public Integer getClassSort(){
        return classSort;
    }
    public void setClassSort(Integer classSort){
        this.classSort=classSort;
    }
    public Integer getDepth(){
        return depth;
    }
    public void setDepth(Integer depth){
        this.depth=depth;
    }
    @Transient
    public String getParentName(){
        return parentName;
    }
    public void setParentName(String parentName){
        this.parentName=parentName;
    }
}
