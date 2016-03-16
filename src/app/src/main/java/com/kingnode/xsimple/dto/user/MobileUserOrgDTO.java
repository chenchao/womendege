package com.kingnode.xsimple.dto.user;
import java.util.List;
import java.util.Map;
import javax.xml.bind.annotation.XmlRootElement;

import com.kingnode.xsimple.dto.FullEmployeeDTO;
import com.kingnode.xsimple.rest.RestStatus;
/**
 * @author kongjiangwei@kingnode.com
 */
public class MobileUserOrgDTO extends VersionResponseDTO{
    //获取注册信息
    private Long regTime;//注册时间
    private String kimDomain;//kim
    private String kimHost;//kim
    private String cloudUrl;//云端地址
    private FullEmployeeDTO emp;//员工信息
    private List<RoleDTO> roles;//角色列表
    private List<ModuleDTO> modules;//模块列表
    private List<SimpleModuleDTO> smodules;
    private Map appFuns;//应用功能安装包信息
    public Map getAppFuns(){
        return appFuns;
    }
    public void setAppFuns(Map appFuns){
        this.appFuns=appFuns;
    }
    public List<SimpleModuleDTO> getSmodules(){
        return smodules;
    }
    public void setSmodules(List<SimpleModuleDTO> smodules){
        this.smodules=smodules;
    }
    public FullEmployeeDTO getEmp(){
        return emp;
    }
    public void setEmp(FullEmployeeDTO emp){
        this.emp=emp;
    }
    public List<RoleDTO> getRoles(){
        return roles;
    }
    public void setRoles(List<RoleDTO> roles){
        this.roles=roles;
    }
    public List<ModuleDTO> getModules(){
        return modules;
    }
    public void setModules(List<ModuleDTO> modules){
        this.modules=modules;
    }
    public Long getRegTime(){
        return regTime;
    }
    public void setRegTime(Long regTime){
        this.regTime=regTime;
    }
    public String getKimDomain(){
        return kimDomain;
    }
    public void setKimDomain(String kimDomain){
        this.kimDomain=kimDomain;
    }
    public String getKimHost(){
        return kimHost;
    }
    public void setKimHost(String kimHost){
        this.kimHost=kimHost;
    }
    public String getCloudUrl(){
        return cloudUrl;
    }
    public void setCloudUrl(String cloudUrl){
        this.cloudUrl=cloudUrl;
    }
}
