package com.kingnode.xsimple.dto.application;
import com.kingnode.xsimple.Setting.WorkStatusType;
/**
 * 应用信息表的DTO
 *
 * @author cici
 */
public class ApplicationDTO {
    private String title;// 应用名称
    private String enTitle;// 英文名称
    private String icon;// 应用图标
    private String apiKey;// API Key类似于用户名
    private String forFirm;// 所属企业
    private String downLoadUrl;//下载地址
    private WorkStatusType workStatus;//应用的状态
    public String getTitle(){
        return title;
    }
    public void setTitle(String title){
        this.title=title;
    }
    public String getEnTitle(){
        return enTitle;
    }
    public void setEnTitle(String enTitle){
        this.enTitle=enTitle;
    }
    public String getIcon(){
        return icon;
    }
    public void setIcon(String icon){
        this.icon=icon;
    }
    public String getApiKey(){
        return apiKey;
    }
    public void setApiKey(String apiKey){
        this.apiKey=apiKey;
    }
    public String getForFirm(){
        return forFirm;
    }
    public void setForFirm(String forFirm){
        this.forFirm=forFirm;
    }
    public String getDownLoadUrl(){
        return downLoadUrl;
    }
    public void setDownLoadUrl(String downLoadUrl){
        this.downLoadUrl=downLoadUrl;
    }
    public WorkStatusType getWorkStatus(){
        return workStatus;
    }
    public void setWorkStatus(WorkStatusType workStatus){
        this.workStatus=workStatus;
    }
}