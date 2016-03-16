package com.kingnode.xsimple.dto.application;
import java.util.List;
/**
 * 移动模块,功能DTO
 * @author 448778074@qq.com (cici)
 */
public class DragModuleFunctionDTO{
    private Long rid;
    private List<Long> arrMID;
    private List<Long> arrMSort;
    private List<List<Long>> arrAllFID;
    private List<List<Long>> arrFSort;
    public Long getRid(){
        return rid;
    }
    public void setRid(Long rid){
        this.rid=rid;
    }
    public List<Long> getArrMID(){
        return arrMID;
    }
    public void setArrMID(List<Long> arrMID){
        this.arrMID=arrMID;
    }
    public List<Long> getArrMSort(){
        return arrMSort;
    }
    public void setArrMSort(List<Long> arrMSort){
        this.arrMSort=arrMSort;
    }
    public List<List<Long>> getArrAllFID(){
        return arrAllFID;
    }
    public void setArrAllFID(List<List<Long>> arrAllFID){
        this.arrAllFID=arrAllFID;
    }
    public List<List<Long>> getArrFSort(){
        return arrFSort;
    }
    public void setArrFSort(List<List<Long>> arrFSort){
        this.arrFSort=arrFSort;
    }
}
