package com.kingnode.gou.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

import com.kingnode.xsimple.entity.EmployeeAuditEntity;
import org.hibernate.validator.constraints.NotBlank;
/**
 * @author segry ouyang(328361257@qq.com)
 */
@Entity
@Table(name="customer")
public class Customer extends EmployeeAuditEntity implements java.io.Serializable{
    private Long id;
    private String loginName;
    private String userName;
    private String nickName;
    private Gender sex=Gender.NONE;//性别
    private Gender babySex=Gender.NONE;//性别
    private Long babyBirthday;
    private String imageAddress;//用户图像
    private String phone;//手机
    private String telephone;//座机
    private String email;//员工邮箱
    private int integral;//积分
    private Identity identity;
    private RegisteredModel registeredModel;
    @Id public Long getId(){
        return id;
    }
    public void setId(Long id){
        this.id=id;
    }
    @NotBlank @Column(name="login_name", nullable=false, unique=true, length=100) public String getLoginName(){
        return loginName;
    }
    public void setLoginName(String loginName){
        this.loginName=loginName;
    }
    @Column(name="user_name", length=40) public String getUserName(){
        return userName;
    }
    public void setUserName(String userName){
        this.userName=userName;
    }
    @Column(name="image_address", length=100) public String getImageAddress(){
        return imageAddress;
    }
    public void setImageAddress(String imageAddress){
        this.imageAddress=imageAddress;
    }
    @Column(length=50) public String getPhone(){
        return phone;
    }
    public void setPhone(String phone){
        this.phone=phone;
    }
    @Column(length=100) public String getTelephone(){
        return telephone;
    }
    public void setTelephone(String telephone){
        this.telephone=telephone;
    }
    @Column(length=100) public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email=email;
    }
    @Enumerated(EnumType.STRING) @Column(length=10) public Gender getSex(){
        return sex;
    }
    public void setSex(Gender sex){
        this.sex=sex;
    }
    public String getNickName(){
        return nickName;
    }
    public void setNickName(String nickName){
        this.nickName=nickName;
    }
    @Enumerated(EnumType.STRING) @Column(length=10) public Gender getBabySex(){
        return babySex;
    }
    public void setBabySex(Gender babySex){
        this.babySex=babySex;
    }
    public Long getBabyBirthday(){
        return babyBirthday;
    }
    public void setBabyBirthday(Long babyBirthday){
        this.babyBirthday=babyBirthday;
    }
    public int getIntegral(){
        return integral;
    }
    public void setIntegral(int integral){
        this.integral=integral;
    }
    @Enumerated(EnumType.STRING) @Column(length=30) public Identity getIdentity(){
        return identity;
    }
    public void setIdentity(Identity identity){
        this.identity=identity;
    }
    @Enumerated(EnumType.STRING) @Column(length=10) public RegisteredModel getRegisteredModel(){
        return registeredModel;
    }
    public void setRegisteredModel(RegisteredModel registeredModel){
        this.registeredModel=registeredModel;
    }
    public enum Gender{
        MAN("男"),WOMEN("女"),NONE("无");
        private final String s_type;
        private Gender(final String s_type){
            this.s_type=s_type;
        }
        public String getTypeName(){
            return s_type;
        }
    }
    public enum Identity{
        dad("爸爸"),mom("妈妈"),aunt("阿姨"),other("其它");
        private final String identityStr;
        private Identity(final String identityStr){
            this.identityStr=identityStr;
        }
        public String getIdentityStr(){
            return identityStr;
        }
    }
    public enum RegisteredModel{
        android,ios,pc
    }
    public enum UserType{
        employee,supplier
    }
}
