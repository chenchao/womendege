package com.kingnode.gou.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.AuditEntity;
/**
 * @author segry ouyang(328361257@qq.com)
 */
@Entity @Table(name="address")
public class Address extends AuditEntity{
    private long userId;
    private String addressee;
    private String zipCode;
    private String phone;
    private String address;
    public long getUserId(){
        return userId;
    }
    public void setUserId(long userId){
        this.userId=userId;
    }
    public String getAddressee(){
        return addressee;
    }
    public void setAddressee(String addressee){
        this.addressee=addressee;
    }
    public String getZipCode(){
        return zipCode;
    }
    public void setZipCode(String zipCode){
        this.zipCode=zipCode;
    }
    public String getPhone(){
        return phone;
    }
    public void setPhone(String phone){
        this.phone=phone;
    }
    public String getAddress(){
        return address;
    }
    public void setAddress(String address){
        this.address=address;
    }
}
