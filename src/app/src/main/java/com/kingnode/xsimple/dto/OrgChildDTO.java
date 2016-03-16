package com.kingnode.xsimple.dto;
import java.util.List;
/**
 * @author kongjiangwei@kingnode.com
 */
public class OrgChildDTO extends SimpleOrgDTO{
    private List<OrganizationDTO> orgs;
    private List<SimpleEmployeeDTO> emps;
    public List<SimpleEmployeeDTO> getEmps(){
        return emps;
    }
    public void setEmps(List<SimpleEmployeeDTO> emps){
        this.emps=emps;
    }
    public List<OrganizationDTO> getOrgs(){
        return orgs;
    }
    public void setOrgs(List<OrganizationDTO> orgs){
        this.orgs=orgs;
    }
}
