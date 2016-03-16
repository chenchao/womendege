package com.kingnode.xsimple.dto;
/**
 * 组织管理DTO
 * @author chirs@zhoujin.com (Chirs Chou)
 */
public class OrganizationDTO extends SimpleOrgDTO{
    private String code;
    private Long children;
    public OrganizationDTO(){

    }
    public OrganizationDTO(Long id,String code,String name,Long children){
        super.setId(id);
        super.setName(name);
        this.code=code;
        this.children=children;
    }
    public String getCode(){
        return code;
    }
    public void setCode(String code){
        this.code=code;
    }
    public Long getChildren(){
        return children;
    }
    public void setChildren(Long children){
        this.children=children;
    }
}
