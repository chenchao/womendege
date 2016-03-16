package com.kingnode.xsimple.dto.user;
import java.util.List;
/**
 * @author kongjiangwei@kingnode.com
 */
public class SimpleModuleDTO{
    private Long mid;
    private Long msid;
    private List<SimpleFunctionDTO> funcs;
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
    public List<SimpleFunctionDTO> getFuncs(){
        return funcs;
    }
    public void setFuncs(List<SimpleFunctionDTO> funcs){
        this.funcs=funcs;
    }
}
