package com.kingnode.gou.dto;
import java.util.List;
/**
 * @author 58120775@qq.com (chenchao)
 */
public class OrderSubmitDTO{
    private Long invoiceId;//收货地址id
    private String invoiceTimeDesc;//收货时间描述
    private String invoiceTimeType;//收货时间类型 工作日，周末，
    private String sourceFrom;//pc还是app
    private String remark;//备注
    private List<OrderProductDTO> productDTOs;//产品

    public List<OrderProductDTO> getProductDTOs(){
        return productDTOs;
    }
    public void setProductDTOs(List<OrderProductDTO> productDTOs){
        this.productDTOs=productDTOs;
    }
    public Long getInvoiceId(){
        return invoiceId;
    }
    public void setInvoiceId(Long invoiceId){
        this.invoiceId=invoiceId;
    }
    public String getInvoiceTimeDesc(){
        return invoiceTimeDesc;
    }
    public void setInvoiceTimeDesc(String invoiceTimeDesc){
        this.invoiceTimeDesc=invoiceTimeDesc;
    }
    public String getInvoiceTimeType(){
        return invoiceTimeType;
    }
    public void setInvoiceTimeType(String invoiceTimeType){
        this.invoiceTimeType=invoiceTimeType;
    }
    public String getSourceFrom(){
        return sourceFrom;
    }
    public void setSourceFrom(String sourceFrom){
        this.sourceFrom=sourceFrom;
    }
    public String getRemark(){
        return remark;
    }
    public void setRemark(String remark){
        this.remark=remark;
    }
}
