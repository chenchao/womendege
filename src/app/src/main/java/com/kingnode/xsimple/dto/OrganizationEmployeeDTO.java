package com.kingnode.xsimple.dto;
import java.util.List;

import com.kingnode.xsimple.rest.RestStatus;
/**
 * 组织底下的子组织和组织下的员工列表
 * @author cici
 */
public class OrganizationEmployeeDTO extends RestStatus{
    private List<OrganizationDTO> org;
    private List<SimpleEmployeeDTO> emp;
    public List<OrganizationDTO> getOrg(){
        return org;
    }
    public void setOrg(List<OrganizationDTO> org){
        this.org=org;
    }
    public List<SimpleEmployeeDTO> getEmp(){
        return emp;
    }
    public void setEmp(List<SimpleEmployeeDTO> emp){
        this.emp=emp;
    }
}
