package com.kingnode.gou.controller;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;

import com.google.common.base.Strings;
import com.kingnode.diva.mapper.BeanMapper;
import com.kingnode.diva.web.Servlets;
import com.kingnode.gou.entity.Activity;
import com.kingnode.gou.entity.ActivityPosition;
import com.kingnode.gou.entity.ActivityProduct;
import com.kingnode.gou.entity.ActivityProductView;
import com.kingnode.gou.entity.Collection;
import com.kingnode.gou.entity.Product;
import com.kingnode.gou.entity.ProductBrand;
import com.kingnode.gou.entity.ProductClass;
import com.kingnode.gou.service.ActivityService;
import com.kingnode.gou.service.ProductBrandService;
import com.kingnode.gou.service.ProductCatalogService;
import com.kingnode.gou.service.ProductClassService;
import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.api.common.DataTable;
import com.kingnode.xsimple.rest.DetailDTO;
import com.kingnode.xsimple.rest.RestStatus;
import com.kingnode.xsimple.util.dete.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 * 活动管理
 *
 */
@Controller @RequestMapping(value="/activity") public class ActivityController{
    private static Logger log=LoggerFactory.getLogger(ActivityController.class);
    @Autowired private ActivityService activityService;
    @Autowired private ProductBrandService brandService;
    @Autowired private ProductClassService classService;
    @RequestMapping(method=RequestMethod.GET) public String home(Model model){
        return "/activity/activityList";
    }
    @RequestMapping(value="list", method=RequestMethod.POST) @ResponseBody public DataTable<Activity> activityList(DataTable<Activity> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        return activityService.PageActivities(searchParams,dt);
    }
    @RequestMapping(value="activityProductList/{activityId}", method=RequestMethod.POST) @ResponseBody public DataTable<ActivityProduct> activityProductList(@PathVariable("activityId") Long activityId,DataTable<ActivityProduct> dt){
        DataTable dataTable=activityService.PageActivityProducts(activityId,dt);
        if(dt.getAaData()!=null){
            for(ActivityProduct activityProduct:dt.getAaData()){
                ProductBrand brand=brandService.readProductBrandByCode(activityProduct.getProduct().getProductBrand());
                activityProduct.getProduct().setBrandName(brand!=null?brand.getBrandName():"");
                ProductClass productClass=classService.readProductClassByCode(activityProduct.getProduct().getProductClass());
                activityProduct.getProduct().setFullClassName(classService.createParentName(productClass));
            }
        }
        return dataTable;
    }
    @RequestMapping(value="products",method=RequestMethod.POST) @ResponseBody public DataTable<Product> list(DataTable<Product> dt,ServletRequest request,@RequestParam(value="activityId")Long activityId){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        dt=activityService.pageProduct(dt,searchParams,activityId);
        if(dt!=null && dt.getAaData()!=null){
            for(Product product:dt.getAaData()){
                ProductBrand brand=brandService.readProductBrandByCode(product.getProductBrand());
                product.setBrandName(brand!=null?brand.getBrandName():"");
                ProductClass productClass=classService.readProductClassByCode(product.getProductClass());
                product.setFullClassName(classService.createParentName(productClass));
            }
        }
        return dt;
    }
    @ResponseBody @RequestMapping(value="deleteActivityProduct", method=RequestMethod.POST) public RestStatus deleteActivityProduct(@RequestParam(value="activityProductIds") String[] activityProductIds){
        try{
            activityService.deleteActivityProduct(activityProductIds);
        }catch(Exception e){
            e.printStackTrace();
            return new RestStatus(false);
        }
        return new RestStatus(true);
    }
    @ResponseBody @RequestMapping(value="saveActivityProduct", method=RequestMethod.POST) public RestStatus saveActivityProduct(@RequestParam(value="activityId") Long activityId,@RequestParam(value="activityProductIds") List<Long> activityProductIds,RedirectAttributes redirectAttributes){
        try{
            activityService.saveActivityProduct(activityId,activityProductIds);
        }catch(Exception e){
            e.printStackTrace();
            return new RestStatus(false);
        }
        return new RestStatus(true);
    }
    @RequestMapping(value="toAdd", method=RequestMethod.GET) public String add(Model model){
        model.addAttribute("activityPositions",activityService.findAllActivityPositions());
        return "activity/activityForm";
    }
    @RequestMapping(value="detail/{id}", method=RequestMethod.GET) public String detail(@PathVariable("id") Long id,Model model){
        model.addAttribute("activity",activityService.readActivity(id));
        model.addAttribute("activityPositions",activityService.findActivityPositions(id));
        return "activity/activityView";
    }
    @RequestMapping(value="update/{id}", method=RequestMethod.GET) public String update(@PathVariable("id") Long id,Model model){
        model.addAttribute("activity",activityService.readActivity(id));
        model.addAttribute("activityPositions",activityService.findActivityPositions(id));
        return "activity/activityForm";
    }
    @RequestMapping(value="save", method=RequestMethod.POST) public String save(Activity activity,@RequestParam(value="imgPaths")String[] imgPaths,@RequestParam(value="startTimeStr")String startTimeStr,@RequestParam(value="endTimeStr")String endTimeStr,RedirectAttributes redirectAttributes){
        Map<String,Object> map=new HashMap<>();
        for(String imgPath:imgPaths){
            if(imgPath.indexOf("_")==-1){
                continue;
            }
            String[] args=imgPath.split("_");
            if(args.length==2){
                map.put(args[0],args[1]);
            }
        }
        activity.setStartTime(DateUtil.getDate(startTimeStr));
        activity.setEndTime(DateUtil.getDate(endTimeStr));
        Activity a=activityService.saveActivity(activity,map);
        redirectAttributes.addFlashAttribute("message","活动更新成功");
        return "redirect:/activity/update/"+a.getId();
    }
    @RequestMapping(value="delete/{id}", method=RequestMethod.GET) public String delete(@PathVariable("id") Long id,RedirectAttributes redirectAttributes){
        activityService.deleteActivity(id);
        redirectAttributes.addFlashAttribute("message","操作成功");
        return "redirect:/activity";
    }
    @ResponseBody @RequestMapping(value="/saveImg", method=RequestMethod.POST)
    public DetailDTO saveImg(@RequestParam(value="id",required=false)Long id,@RequestParam("activityId")Long activityId,@RequestParam("positionId")Long positionId,@RequestParam("imageFile") MultipartFile imageFile){
        String imgPath=GetImageAddressByFile(imageFile);
        ActivityPosition activityPosition=activityService.saveActivityPosition(id,activityId,positionId,imgPath);
        return new DetailDTO(true,activityPosition);
    }

    private String GetImageAddressByFile(MultipartFile file){
        StringBuffer imageAddress=new StringBuffer();
        try{
            if(null!=file&&file.getSize()!=0){//上传文件不为空
                WebApplicationContext webApplicationContext=ContextLoader.getCurrentWebApplicationContext();
                String fileExt=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1).toLowerCase();//扩展名
                if(!Strings.isNullOrEmpty(fileExt)){
                    Long currentTime=System.currentTimeMillis();
                    String filePath=Setting.BASEADDRESS+"/"+currentTime, backPath=filePath+"."+fileExt; //安装包存放路径前缀  没有后缀名
                    File localFile=new File(webApplicationContext.getServletContext().getRealPath(backPath));
                    if(!localFile.getParentFile().exists()){
                        localFile.getParentFile().mkdirs();
                    }
                    file.transferTo(localFile);
                    imageAddress.append(backPath);
                }
            }
        }catch(Exception e){
            log.info("上传图片文件存储的路径 错误信息：{}",e);
        }
        return imageAddress.toString();
    }
}
