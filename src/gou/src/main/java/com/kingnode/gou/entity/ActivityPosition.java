package com.kingnode.gou.entity;
/**
 * @author segry ouyang(328361257@qq.com)
 */
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.kingnode.xsimple.entity.AuditEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
@Entity @Table(name="activity_position")
public class ActivityPosition  extends AuditEntity{
    private Activity activity;
    private Position position;
    private String imgPath;
    public ActivityPosition(){}
    public ActivityPosition(Activity activity,Position position,String imgPath){
        this.activity=activity;
        this.position=position;
        this.imgPath=imgPath;
    }
    @NotNull @ManyToOne @JoinColumn(name="activity_id") @Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
    public Activity getActivity(){
        return activity;
    }
    public void setActivity(Activity activity){
        this.activity=activity;
    }
    @NotNull @ManyToOne @JoinColumn(name="position_id") @Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
    public Position getPosition(){
        return position;
    }
    public void setPosition(Position position){
        this.position=position;
    }
    public String getImgPath(){
        return imgPath;
    }
    public void setImgPath(String imgPath){
        this.imgPath=imgPath;
    }
}
