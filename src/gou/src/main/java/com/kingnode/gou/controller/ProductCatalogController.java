package com.kingnode.gou.controller;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;

import com.kingnode.diva.web.Servlets;
import com.kingnode.gou.entity.ProductCatalog;
import com.kingnode.gou.entity.ProductCatalogAttr;
import com.kingnode.gou.service.ProductCatalogService;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 * 商品分类控制器
 */
@Controller @RequestMapping(value="/product/catalog") public class ProductCatalogController{
    private static Logger log=LoggerFactory.getLogger(ProductCatalogController.class);
    @Autowired private ProductCatalogService catalogService;
    /**
     * 进入列表页面
     */
    @RequestMapping(method=RequestMethod.GET) public String list(){
        return "product/catalogList";
    }
    /**
     * 列表分页数据
     */
    @RequestMapping(method=RequestMethod.POST) @ResponseBody public DataTable<ProductCatalog> list(DataTable<ProductCatalog> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        dt=catalogService.pageProductCatalog(dt,searchParams);
        List<ProductCatalog> catalogs=dt.getAaData();
        if(catalogs!=null){
            for(ProductCatalog catalog:catalogs){
                catalog.setCatalogAttrNames(catalogService.readProductCatalogAttrNames(catalog.getId()));
            }
        }
        return dt;
    }
    @RequestMapping(value="attr", method=RequestMethod.POST) @ResponseBody public DataTable<ProductCatalogAttr> listAttr(DataTable<ProductCatalogAttr> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        dt=catalogService.pageProductCatalogAttr(dt,searchParams);
        return dt;
    }
    /**
     * 进入新增页面
     */
    @RequestMapping(value="create", method=RequestMethod.GET) public String createForm(Model model){
        model.addAttribute("action","create");
        return "product/catalogForm";
    }
    @RequestMapping(value="create-attr/{catalogId}", method=RequestMethod.GET) public String createAttrForm(@PathVariable("catalogId") Long catalogId,Model model){
        model.addAttribute("action","create");
        ProductCatalog catalog=catalogService.readProductCatalog(catalogId);
        model.addAttribute("catalogId",catalog.getId());
        model.addAttribute("catalogName",catalog.getCatalogName());
        return "product/catalogAttrForm";
    }
    /**
     * 进入查看页面
     */
    @RequestMapping(value="view/{id}") public String viewForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("action","view");
        model.addAttribute("d",catalogService.readProductCatalog(id));
        return "product/catalogForm";
    }
    @RequestMapping(value="view-attr/{id}") public String viewAttrForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("action","view");
        ProductCatalogAttr catalogAttr=catalogService.readProductCatalogAttr(id);
        model.addAttribute("d",catalogAttr);
        ProductCatalog catalog=catalogService.readProductCatalog(catalogAttr.getCatalogId());
        model.addAttribute("catalogId",catalog.getId());
        model.addAttribute("catalogName",catalog.getCatalogName());
        return "product/catalogAttrForm";
    }
    /**
     * 进入编辑子集页面
     */
    @RequestMapping(value="sub-view/{id}") public String subViewForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("d",catalogService.readProductCatalog(id));
        return "product/catalogView";
    }
    /**
     * 进入修改页面
     */
    @RequestMapping(value="update/{id}") public String updateForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("action","update");
        model.addAttribute("d",catalogService.readProductCatalog(id));
        return "product/catalogForm";
    }
    @RequestMapping(value="update-attr/{id}") public String updateAttrForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("action","update");
        ProductCatalogAttr catalogAttr=catalogService.readProductCatalogAttr(id);
        model.addAttribute("d",catalogAttr);
        ProductCatalog catalog=catalogService.readProductCatalog(catalogAttr.getCatalogId());
        model.addAttribute("catalogId",catalog.getId());
        model.addAttribute("catalogName",catalog.getCatalogName());
        return "product/catalogAttrForm";
    }
    /**
     * 保存信息
     */
    @RequestMapping(value="create", method=RequestMethod.POST) public String create(ProductCatalog catalog,RedirectAttributes redirectAttributes){
        //数据项去空格
        catalog.setCatalogName(catalog.getCatalogName().trim());
        catalogService.saveProductCatalog(catalog);
        redirectAttributes.addFlashAttribute("message","保存数据成功!");
        return "redirect:/product/catalog";
    }
    @RequestMapping(value="create-attr/{catalogId}", method=RequestMethod.POST)
    public String createAttr(@PathVariable("catalogId") Long catalogId,ProductCatalogAttr catalogAttr,RedirectAttributes redirectAttributes){
        //数据项去空格
        catalogAttr.setCatalogAttrName(catalogAttr.getCatalogAttrName().trim());
        catalogService.saveProductCatalogAttr(catalogAttr);
        redirectAttributes.addFlashAttribute("message","保存数据成功!");
        return "redirect:/product/catalog/sub-view/"+catalogId;
    }
    /**
     * 检查唯一性
     */
    @RequestMapping(value="checkDataExists") @ResponseBody public String checkDictionaryExists(ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        long id=0l;
        if(searchParams.containsKey("EQ_id")&&!StringUtils.isBlank(searchParams.get("EQ_id").toString())){
            id=Long.parseLong(searchParams.get("EQ_id").toString().trim());
        }
        String result="notExists";
        List<ProductCatalog> list=catalogService.listProductCatalog(searchParams);
        if(list!=null&&list.size()>1){
            result="exists";
        }else if(list!=null&&list.size()>0){
            ProductCatalog obj=list.get(0);
            if(id!=obj.getId()){
                result="exists";
            }
        }
        return "{\"result\":\""+result+"\"}";
    }
    @RequestMapping(value="checkDataExists-attr") @ResponseBody public String checkDictionaryExistsAttr(ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        long id=0l;
        if(searchParams.containsKey("EQ_id")&&!StringUtils.isBlank(searchParams.get("EQ_id").toString())){
            id=Long.parseLong(searchParams.get("EQ_id").toString().trim());
        }
        String result="notExists";
        List<ProductCatalogAttr> list=catalogService.listProductCatalogAttr(searchParams);
        if(list!=null&&list.size()>1){
            result="exists";
        }else if(list!=null&&list.size()>0){
            ProductCatalogAttr obj=list.get(0);
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
            List<ProductCatalogAttr> attrs=catalogService.listProductCatalogAttrByCatalogId(id);
            if(attrs!=null&&attrs.size()>0){
                for(ProductCatalogAttr attr : attrs){
                    attr.setRemoveTag(1);
                }
                catalogService.saveProductCatalogAttr(attrs);
            }
            ProductCatalog catalog=catalogService.readProductCatalog(id);
            catalog.setRemoveTag(1);
            catalogService.saveProductCatalog(catalog);
        }catch(Exception e){
            result="failure";
            log.info("删除数据异常！",e);
        }
        return "{\"result\":\""+result+"\"}";
    }
    @RequestMapping(value="delete-attr/{id}", method=RequestMethod.POST) @ResponseBody public String deleteAttr(@PathVariable("id") Long id){
        String result="success";
        try{
            ProductCatalogAttr catalogAttr=catalogService.readProductCatalogAttr(id);
            catalogAttr.setRemoveTag(1);
            catalogService.saveProductCatalogAttr(catalogAttr);
        }catch(Exception e){
            result="failure";
            log.info("删除数据异常！",e);
        }
        return "{\"result\":\""+result+"\"}";
    }
}
