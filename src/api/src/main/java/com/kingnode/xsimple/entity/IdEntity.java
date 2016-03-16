package com.kingnode.xsimple.entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.validation.groups.Default;

import org.hibernate.annotations.GenericGenerator;
/**
 * 统一定义id的entity基类.
 * <p/>
 * 基类统一定义id的属性名称、数据类型、列名映射及生成策略.
 * Oracle需要每个Entity独立定义id的SEQUCENCE时，不继承于本类而改为实现一个Idable的接口。
 *
 * @author Chirs Chou(chirs@zhoujin.com)
 */
@MappedSuperclass public abstract class IdEntity implements java.io.Serializable{
    private static final long serialVersionUID=2498902831272177631L;
    protected Long id;
    @Id @GeneratedValue(generator="gvn") @GenericGenerator(name="gvn", strategy="native") public Long getId(){
        return id;
    }
    public void setId(Long id){
        this.id=id;
    }
    /** 设置数据有效性* */
    public enum ActiveType{
        DISABLE,ENABLE
    }
    public static abstract interface Update extends Default{
    }
    public static abstract interface Save extends Default{
    }
}