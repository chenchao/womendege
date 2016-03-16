package com.kingnode.xsimple.dto.user;
import javax.xml.bind.annotation.XmlRootElement;
/**
 * @author kongjiangwei@kingnode.com
 */
public class MobileRegisterDTO{
    private String xtype;
    private String id;//用户的第三方系统id userId-->id
    private String usys;//用户来自系统userSystem-->usys
    private String key;//appKey-->key
    private String token;//设备标示 ，不能为空
    private String plat;//设备来自平台，不能为空"IPHONE","Android"  plateform-->plat
    private String ver;//版本号  version-->ver
    private String tname;//设备名称  userPhoneName-->tname
    private String vtype;//版本的状态 versionType-->vtype
    private String phone;//手机号码 userPhone-->phone
    private String time;//最后登录时间  regTime-->time
    private String from;//设备来自平台如eam,不能为空  fromSys-->from
    private String login;//登录账号,不能为空  loginName-->login
    private Object modules;//用来存放移动端的工作区菜单
    public static boolean sendOffmessage=false;//是否需要发送离线消息 开关
    public String getXtype(){
        return xtype;
    }
    public void setXtype(String xtype){
        this.xtype=xtype;
    }
    public String getId(){
        return id;
    }
    public void setId(String id){
        this.id=id;
    }
    public String getUsys(){
        return usys;
    }
    public void setUsys(String usys){
        this.usys=usys;
    }
    public String getKey(){
        return key;
    }
    public void setKey(String key){
        this.key=key;
    }
    public String getToken(){
        return token;
    }
    public void setToken(String token){
        this.token=token;
    }
    public String getPlat(){
        return plat;
    }
    public void setPlat(String plat){
        this.plat=plat;
    }
    public String getVer(){
        return ver;
    }
    public void setVer(String ver){
        this.ver=ver;
    }
    public String getTname(){
        return tname;
    }
    public void setTname(String tname){
        this.tname=tname;
    }
    public String getVtype(){
        return vtype;
    }
    public void setVtype(String vtype){
        this.vtype=vtype;
    }
    public String getPhone(){
        return phone;
    }
    public void setPhone(String phone){
        this.phone=phone;
    }
    public String getTime(){
        return time;
    }
    public void setTime(String time){
        this.time=time;
    }
    public String getFrom(){
        return from;
    }
    public void setFrom(String from){
        this.from=from;
    }
    public String getLogin(){
        return login;
    }
    public void setLogin(String login){
        this.login=login;
    }
    public void setModules(Object modules){
        this.modules=modules;
    }
    public Object getModules(){
        return modules;
    }
}
