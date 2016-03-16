package com.kingnode.xsimple.dto.user;
import org.hibernate.validator.constraints.NotBlank;
/**
 * @author kongjiangwei@kingnode.com
 */
public class RegisterRequestDTO{
    private String key;//appKey-->key
    private String token;//设备标示 ，不能为空
    private String plat;//设备来自平台，不能为空"IPHONE","Android"  plateform-->plat
    private String ver;//版本号  version-->ver
    private String tname;//设备名称  userPhoneName-->tname
    private String vtype;//版本的状态 versionType-->vtype
    private String phone;//手机号码 userPhone-->phone
    private String from;//设备来自平台如eam,不能为空  fromSys-->from
    private String login;//登录账号,不能为空  loginName-->login
    private Object modules;//用来存放移动端的工作区菜单
    @NotBlank(message="应用的appkey不能为空")//加入非空验证
    public String getKey(){
        return key;
    }
    public void setKey(String key){
        this.key=key;
    }
    @NotBlank(message="设备token不能为空")
    public String getToken(){
        return token;
    }
    public void setToken(String token){
        this.token=token;
    }
    @NotBlank(message="设备来自平台不能为空")
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
    @NotBlank(message="设备来自系统平台不能为空")
    public String getFrom(){
        return from;
    }
    public void setFrom(String from){
        this.from=from;
    }
    @NotBlank(message="用户名不能为空")
    public String getLogin(){
        return login;
    }
    public void setLogin(String login){
        this.login=login;
    }
    public Object getModules(){
        return modules;
    }
    public void setModules(Object modules){
        this.modules=modules;
    }
}
