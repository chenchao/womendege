package com.kingnode.gou.controller;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;

import com.kingnode.gou.entity.ProductClass;
import com.kingnode.gou.service.ProductClassService;
import com.kingnode.diva.web.Servlets;
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
@Controller @RequestMapping(value="/product/class") public class ProductClassController{
    private static Logger log=LoggerFactory.getLogger(ProductClassController.class);
    @Autowired private ProductClassService classService;
    /**
     * 进入列表页面
     */
    @RequestMapping(method=RequestMethod.GET) public String list(){
        return "product/classList";
    }
    /**
     * 列表分页数据
     */
    @RequestMapping(method=RequestMethod.POST) @ResponseBody public DataTable<ProductClass> list(DataTable<ProductClass> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        dt=classService.pageProductClass(dt,searchParams);
        return dt;
    }
    /**
     * 进入新增页面
     */
    @RequestMapping(value="create/{parent}", method=RequestMethod.GET) public String createForm(@PathVariable("parent") String parent,Model model){
        model.addAttribute("action","create");
        model.addAttribute("parent",parent);
        return "product/classForm";
    }
    /**
     * 进入查看页面
     */
    @RequestMapping(value="view/{id}/{parent}") public String viewForm(@PathVariable("id") Long id,@PathVariable("parent") String parent,Model model){
        model.addAttribute("action","view");
        model.addAttribute("d",classService.readProductClass(id));
        model.addAttribute("parent",parent);
        return "product/classForm";
    }
    /**
     * 进入编辑子集页面
     */
    @RequestMapping(value="sub-view/{classCode}") public String subViewForm(@PathVariable("classCode") String classCode,Model model){
        model.addAttribute("d",classService.readProductClassByCode(classCode));
        return "product/classView";
    }
    /**
     * 进入修改页面
     */
    @RequestMapping(value="update/{id}/{parent}") public String updateForm(@PathVariable("id") Long id,@PathVariable("parent") String parent,Model model){
        model.addAttribute("action","update");
        model.addAttribute("d",classService.readProductClass(id));
        model.addAttribute("parent",parent);
        return "product/classForm";
    }
    /**
     * 保存信息
     */
    @RequestMapping(value="create/{parent}", method=RequestMethod.POST)
    public String create(@PathVariable("parent") String parent,ProductClass productClass,RedirectAttributes redirectAttributes){
        //数据项去空格
        productClass.setClassCode(productClass.getClassCode().trim());
        productClass.setClassName(productClass.getClassName().trim());
        classService.saveProductClass(productClass);
        //path的保存
        if("ROOT".equals(productClass.getParentClass())){
            productClass.setPath(productClass.getId()+".");
        }else{
            ProductClass parentClass=classService.readProductClassByCode(parent);
            productClass.setPath(parentClass.getPath()+productClass.getId()+".");
        }
        //保存depth
        String[] temp=productClass.getPath().split("\\.");
        productClass.setDepth(temp.length);
        classService.saveProductClass(productClass);
        redirectAttributes.addFlashAttribute("message","保存数据成功!");
        if(!"ROOT".equals(parent)){
            return "redirect:/product/class/sub-view/"+parent;
        }
        return "redirect:/product/class";
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
        List<ProductClass> list=classService.listProductClass(searchParams);
        if(list!=null&&list.size()>1){
            result="exists";
        }else if(list!=null&&list.size()>0){
            ProductClass obj=list.get(0);
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
            List<ProductClass> subList=classService.subProductClass(id,true);
            if(subList!=null&&subList.size()>0){
                for(ProductClass sub : subList){
                    sub.setRemoveTag(1);
                }
                classService.saveProductClass(subList);
            }
        }catch(Exception e){
            result="failure";
            log.info("删除数据异常！",e);
        }
        return "{\"result\":\""+result+"\"}";
    }
}
