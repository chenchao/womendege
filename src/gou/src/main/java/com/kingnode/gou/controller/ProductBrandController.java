package com.kingnode.gou.controller;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;

import com.kingnode.diva.web.Servlets;
import com.kingnode.gou.entity.ProductBrand;
import com.kingnode.gou.service.ProductBrandService;
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
 * 商品品牌控制类
 */
@Controller @RequestMapping(value="/product/brand") public class ProductBrandController{
    private static Logger log=LoggerFactory.getLogger(ProductBrandController.class);
    @Autowired private ProductBrandService brandService;
    /**
     * 进入列表页面
     */
    @RequestMapping(method=RequestMethod.GET) public String list(){
        return "product/brandList";
    }
    /**
     * 列表分页数据
     */
    @RequestMapping(method=RequestMethod.POST) @ResponseBody public DataTable<ProductBrand> list(DataTable<ProductBrand> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        dt=brandService.pageProductBrand(dt,searchParams);
        return dt;
    }
    /**
     * 进入新增页面
     */
    @RequestMapping(value="create", method=RequestMethod.GET) public String createForm(Model model){
        model.addAttribute("action","create");
        return "product/brandForm";
    }
    /**
     * 进入查看页面
     */
    @RequestMapping(value="view/{id}") public String viewForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("action","view");
        model.addAttribute("d",brandService.readProductBrand(id));
        return "product/brandForm";
    }
    /**
     * 进入修改页面
     */
    @RequestMapping(value="update/{id}") public String updateForm(@PathVariable("id") Long id,Model model){
        model.addAttribute("action","update");
        model.addAttribute("d",brandService.readProductBrand(id));
        return "product/brandForm";
    }
    /**
     * 保存信息
     */
    @RequestMapping(value="create", method=RequestMethod.POST) public String create(ProductBrand brand,RedirectAttributes redirectAttributes){
        //数据项去空格
        brand.setBrandCode(brand.getBrandCode().trim());
        brand.setBrandName(brand.getBrandName().trim());
        brandService.saveProductBrand(brand);
        redirectAttributes.addFlashAttribute("message","保存数据成功!");
        return "redirect:/product/brand";
    }
    /**
     * 删除数据
     */
    @RequestMapping(value="delete/{id}", method=RequestMethod.POST) @ResponseBody public String delete(@PathVariable("id") Long id){
        String result="success";
        try{
            ProductBrand brand=brandService.readProductBrand(id);
            brand.setRemoveTag(1);
            brandService.saveProductBrand(brand);
        }catch(Exception e){
            result="failure";
            log.info("删除问题类型异常！",e);
        }
        return "{\"result\":\""+result+"\"}";
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
        List<ProductBrand> list=brandService.listProductBrand(searchParams);
        if(list!=null&&list.size()>1){
            result="exists";
        }else if(list!=null&&list.size()>0){
            ProductBrand obj=list.get(0);
            if(id!=obj.getId()){
                result="exists";
            }
        }
        return "{\"result\":\""+result+"\"}";
    }
}
