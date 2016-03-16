package com.kingnode.xsimple.dto.user;
import java.util.List;
/**
 * @author kongjiangwei@kingnode.com
 */
public class ModuleDTO{
    private Long mid;
    private Long msid;
    private String mtitle;
    private String k1;
    private List<FunctionDTO> funcs;
    public String getK1(){
        return k1;
    }
    public void setK1(String k1){
        this.k1=k1;
    }
    public String getMtitle(){
        return mtitle;
    }
    public void setMtitle(String mtitle){
        this.mtitle=mtitle;
    }
    public List<FunctionDTO> getFuncs(){
        return funcs;
    }
    public void setFuncs(List<FunctionDTO> funcs){
        this.funcs=funcs;
    }
    public Long getMid(){
        return mid;
    }
    public void setMid(Long mid){
        this.mid=mid;
    }
    public Long getMsid(){
        return msid;
    }
    public void setMsid(Long msid){
        this.msid=msid;
    }
}
