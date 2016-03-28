package com.kingnode.gou.controller;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;

import com.kingnode.diva.mapper.JsonMapper;
import com.kingnode.diva.web.Servlets;
import com.kingnode.gou.entity.Product;
import com.kingnode.gou.entity.ProductBrand;
import com.kingnode.gou.entity.ProductCatalog;
import com.kingnode.gou.entity.ProductCatalogAttr;
import com.kingnode.gou.entity.ProductClass;
import com.kingnode.gou.entity.ProductDetail;
import com.kingnode.gou.entity.ProductPicture;
import com.kingnode.gou.service.ProductBrandService;
import com.kingnode.gou.service.ProductCatalogService;
import com.kingnode.gou.service.ProductClassService;
import com.kingnode.gou.service.ProductDetailService;
import com.kingnode.xsimple.api.common.DataTable;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 商品分类控制器
 */
@Controller @RequestMapping(value="/product/detail") public class ProductDetailController{
    private static Logger log=LoggerFactory.getLogger(ProductDetailController.class);
    @Autowired private ProductClassService classService;
    @Autowired private ProductDetailService detailService;
    @Autowired private ProductBrandService brandService;
    @Autowired private ProductCatalogService catalogService;
    /**
     * 进入列表页面
     */
    @RequestMapping(method=RequestMethod.GET) public String list(){
        return "product/productList";
    }
    /**
     * 列表分页数据
     */
    @RequestMapping(method=RequestMethod.POST) @ResponseBody public DataTable<Product> list(DataTable<Product> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        dt=detailService.pageProduct(dt,searchParams);
        if(dt.getAaData()!=null){
            for(Product product:dt.getAaData()){
                ProductBrand brand=brandService.readProductBrandByCode(product.getProductBrand());
                product.setBrandName(brand!=null?brand.getBrandName():"");
                ProductClass productClass=classService.readProductClassByCode(product.getProductClass());
                product.setFullClassName(classService.createParentName(productClass));
            }
        }
        return dt;
    }
    /**
     * 进入新增页面
     */
    @RequestMapping(value="create", method=RequestMethod.GET) public String createForm(Model model){
        model.addAttribute("action","create");
        return "product/productForm";
    }
    /**
     * 保存信息
     */
    @RequestMapping(value="create", method=RequestMethod.POST)
    public String create(Product product,String[] fileAddress,Long[] catalogAttrId,String[] catalogAttrVal){
        boolean isNew=(product.getId()==null||product.getId()<=0);
        //数据项去空格
        product.setProductCode(product.getProductCode().trim());
        product.setProductName(product.getProductName().trim());
        if(StringUtils.isNotBlank(product.getProductShortName())){
            product.setProductShortName(product.getProductShortName().trim());
        }
        if(product.getIfSub()==null){
            product.setIfSub(1);
        }
        detailService.saveProduct(product);
        //删除并保存附件
        detailService.deleteProductPicture("1",product.getId());
        if(fileAddress!=null&&fileAddress.length>0){
            detailService.saveProductPicture(fileAddress,"1",product.getId());
        }
        //删除并保存目录组属性值
        detailService.deleteProductCatalogAttrVal("1",product.getId(),product.getCatalogId());
        if(catalogAttrId!=null&&catalogAttrId.length>0){
            detailService.saveProductCatalogAttrVal(catalogAttrId,catalogAttrVal,product.getId(),product.getCatalogId(),"1");
        }
        if(isNew&&product.getIfSub()==1){
            return "redirect:/product/detail/create-sub/"+product.getId();
        }
        return "redirect:/product/detail/sub-view/"+product.getId();
    }
    @RequestMapping(value="update/{id}") public String updateForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("action","update");
        Product product=detailService.readProduct(id);
        model.addAttribute("d",product);
        if(product.getCatalogId()!=null&&product.getCatalogId()>0){
            ProductCatalog catalog=detailService.readProductCatalog(product.getCatalogId());
            model.addAttribute("catalog",catalog);
        }
        ProductBrand brand=brandService.readProductBrandByCode(product.getProductBrand());
        model.addAttribute("brandName",brand.getBrandName());
        ProductClass productClass=classService.readProductClassByCode(product.getProductClass());
        model.addAttribute("parentName",classService.createParentName(productClass));
        return "product/productForm";
    }
    @RequestMapping(value="get-attachment/{id}/{type}", method=RequestMethod.POST) @ResponseBody public String getAttachment(@PathVariable("id") Long id,@PathVariable("type") String type){
        List<ProductPicture> pictures=detailService.listProductPicture(id,type);
        return JsonMapper.nonDefaultMapper().toJson(pictures);
    }
    @RequestMapping(value="create-sub/{productId}", method=RequestMethod.GET) public String createDetailForm(@PathVariable("productId") Long productId,Model model){
        model.addAttribute("action","create");
        Product product=detailService.readProduct(productId);
        model.addAttribute("productId",product.getId());
        model.addAttribute("productCode",product.getProductCode());
        model.addAttribute("productName",product.getProductName());
        model.addAttribute("ifSub",product.getIfSub()==null?1:product.getIfSub());
        return "product/detailForm";
    }
    @RequestMapping(value="create-sub", method=RequestMethod.POST)
    public String createSub(ProductDetail detail,String[] fileAddress,Long[] catalogAttrId,String[] catalogAttrVal){
        //数据项去空格
        detail.setProductSubCode(detail.getProductSubCode().trim());
        detail.setProductSubName(detail.getProductSubName().trim());
        detail.setProductUnit(detail.getProductUnit().trim());
        detailService.saveProductDetail(detail);
        //删除并保存附件
        detailService.deleteProductPicture("2",detail.getId());
        if(fileAddress!=null&&fileAddress.length>0){
            detailService.saveProductPicture(fileAddress,"2",detail.getId());
        }
        //删除并保存目录组属性值
        detailService.deleteProductCatalogAttrVal("2",detail.getId(),detail.getCatalogId());
        if(catalogAttrId!=null&&catalogAttrId.length>0){
            detailService.saveProductCatalogAttrVal(catalogAttrId,catalogAttrVal,detail.getId(),detail.getCatalogId(),"2");
        }
        return "redirect:/product/detail/sub-view/"+detail.getProductId();
    }
    @RequestMapping(value="update-sub/{id}") public String updateSubForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("action","update");
        ProductDetail detail=detailService.readProductDetail(id);
        model.addAttribute("d",detail);
        Product product=detailService.readProduct(detail.getProductId());
        model.addAttribute("productId",product.getId());
        model.addAttribute("productCode",product.getProductCode());
        model.addAttribute("productName",product.getProductName());
        ProductCatalog catalog=detailService.readProductCatalog(detail.getCatalogId()!=null?detail.getCatalogId():0);
        model.addAttribute("catalogName",catalog!=null?catalog.getCatalogName():"");
        model.addAttribute("ifSub",product.getIfSub()==null?1:product.getIfSub());
        return "product/detailForm";
    }
    @RequestMapping(value="sub-view/{id}") public String subViewForm(@PathVariable("id") Long id,Model model){
        Product product=detailService.readProduct(id);
        model.addAttribute("d",product);
        ProductCatalog catalog=detailService.readProductCatalog(product.getCatalogId()!=null?product.getCatalogId():0l);
        model.addAttribute("catalogName",catalog!=null?catalog.getCatalogName():"无");
        List<ProductCatalogAttr> attrs=catalogService.listProductCatalogAttrByCatalogId(product.getCatalogId(),product.getId(),"1");
        model.addAttribute("attrs",attrs);
        model.addAttribute("attrs_length",attrs!=null?attrs.size():0);
        ProductBrand brand=brandService.readProductBrandByCode(product.getProductBrand());
        model.addAttribute("brandName",brand.getBrandName());
        ProductClass productClass=classService.readProductClassByCode(product.getProductClass());
        model.addAttribute("parentName",classService.createParentName(productClass));
        List<ProductDetail> details=detailService.listProductDetail(product.getId());
        if(details!=null&&details.size()>0){
            for(ProductDetail detail:details){
                if(detail.getCatalogId()!=null&&detail.getCatalogId()>0){
                    ProductCatalog subCatalog=detailService.readProductCatalog(detail.getCatalogId());
                    detail.setCatalogName(subCatalog!=null?subCatalog.getCatalogName():"无");
                    detail.setSubAttrs(catalogService.listProductCatalogAttrByCatalogId(detail.getCatalogId(),detail.getId(),"2"));
                }
                detail.setPictures(detailService.listProductPicture(detail.getId(),"2"));
            }
        }
        model.addAttribute("details",details);
        Integer addDetailFlag=1;
        if(product.getIfSub()==1&&details!=null&&details.size()>0){
            addDetailFlag=0;
        }
        model.addAttribute("addDetailFlag",addDetailFlag);
        return "product/productView";
    }
    @RequestMapping(value="checkDataExists") @ResponseBody public String checkDictionaryExists(ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        long id=0l;
        if(searchParams.containsKey("EQ_id")&&!StringUtils.isBlank(searchParams.get("EQ_id").toString())){
            id=Long.parseLong(searchParams.get("EQ_id").toString().trim());
        }
        String result="notExists";
        List<Product> list=detailService.listProduct(searchParams);
        if(list!=null&&list.size()>1){
            result="exists";
        }else if(list!=null&&list.size()>0){
            Product obj=list.get(0);
            if(id!=obj.getId()){
                result="exists";
            }
        }
        return "{\"result\":\""+result+"\"}";
    }
    @RequestMapping(value="checkDataExists-sub") @ResponseBody public String checkDictionaryExistsSub(ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        long id=0l;
        if(searchParams.containsKey("EQ_id")&&!StringUtils.isBlank(searchParams.get("EQ_id").toString())){
            id=Long.parseLong(searchParams.get("EQ_id").toString().trim());
        }
        String result="notExists";
        List<ProductDetail> list=detailService.listProductDetail(searchParams);
        if(list!=null&&list.size()>1){
            result="exists";
        }else if(list!=null&&list.size()>0){
            ProductDetail obj=list.get(0);
            if(id!=obj.getId()){
                result="exists";
            }
        }
        return "{\"result\":\""+result+"\"}";
    }
    /**
     * 删除数据
     */
    @RequestMapping(value="delete/{id}", method=RequestMethod.POST) @ResponseBody public String delete(@PathVariable("id") Long id){
        String result="success";
        try{
            Product product=detailService.readProduct(id);
            product.setRemoveTag(1);
            detailService.saveProduct(product);
            List<ProductDetail> details=detailService.listProductDetail(id);
            if(details!=null&&details.size()>0){
                for(ProductDetail detail:details){
                    detail.setRemoveTag(1);
                }
                detailService.saveProductDetail(details);
            }
        }catch(Exception e){
            result="failure";
            log.info("删除数据异常！",e);
        }
        return "{\"result\":\""+result+"\"}";
    }
    @RequestMapping(value="delete-sub/{id}", method=RequestMethod.POST) @ResponseBody public String deleteSub(@PathVariable("id") Long id){
        String result="success";
        try{
            ProductDetail detail=detailService.readProductDetail(id);
            detail.setRemoveTag(1);
            detailService.saveProductDetail(detail);
        }catch(Exception e){
            result="failure";
            log.info("删除数据异常！",e);
        }
        return "{\"result\":\""+result+"\"}";
    }
}
