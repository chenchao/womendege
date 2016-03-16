package com.kingnode.xsimple.dto.user;
import com.kingnode.xsimple.rest.RestStatus;
/**
 * @author kongjiangwei@kingnode.com
 */
public class DeviceResponseDTO extends RestStatus{
    private Long time;
    private String dName;
    private String type;
    public String getType(){
        return type;
    }
    public void setType(String type){
        this.type=type;
    }
    public Long getTime(){
        return time;
    }
    public void setTime(Long time){
        this.time=time;
    }
    public String getdName(){
        return dName;
    }
    public void setdName(String dName){
        this.dName=dName;
    }
}
