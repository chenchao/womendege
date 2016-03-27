package com.kingnode.gou.controller;
import java.io.File;
import java.util.ArrayList;
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
import com.kingnode.gou.service.ActivityService;
import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.api.common.DataTable;
import com.kingnode.xsimple.rest.DetailDTO;
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
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@Controller @RequestMapping(value="/activity") public class ActivityController{
    private static Logger log=LoggerFactory.getLogger(ActivityController.class);
    @Autowired private ActivityService activityService;
    @RequestMapping(method=RequestMethod.GET) public String home(Model model){
        return "/activity/activityList";
    }
    @RequestMapping(value="list", method=RequestMethod.POST) @ResponseBody public DataTable<Activity> activityList(DataTable<Activity> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        return activityService.PageActivities(searchParams,dt);
    }
    @RequestMapping(value="activityProductList/{activityId}", method=RequestMethod.POST) @ResponseBody public DataTable<ActivityProductView> activityProductList(@PathVariable("activityId") Long activityId,DataTable<ActivityProductView> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        return activityService.PageActivityProducts(activityId,searchParams,dt);
    }
    @RequestMapping(value="deleteActivityProduct", method=RequestMethod.POST) public String deleteActivityProduct(@RequestParam(value="activityId") Long activityId,@RequestParam(value="activityProductIds") List<Long> activityProductIds,RedirectAttributes redirectAttributes){
        activityService.deleteActivityProduct(activityProductIds);
        redirectAttributes.addFlashAttribute("message","操作成功");
        return "redirect:/activity/detail/"+activityId;
    }
    @RequestMapping(value="saveActivityProduct", method=RequestMethod.POST) public String saveActivityProduct(@RequestParam(value="activityId") Long activityId,@RequestParam(value="activityProductIds") List<Long> activityProductIds,RedirectAttributes redirectAttributes){
        activityService.saveActivityProduct(activityId,activityProductIds);
        redirectAttributes.addFlashAttribute("message","操作成功");
        return "redirect:/activity/detail/"+activityId;
    }
    @RequestMapping(value="toAdd", method=RequestMethod.GET) public String add(Model model){
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
    @RequestMapping(value="save", method=RequestMethod.POST) public String save(Activity activity,@RequestParam(value="startTimeStr")String startTimeStr,@RequestParam(value="endTimeStr")String endTimeStr,RedirectAttributes redirectAttributes){
        Activity a=activityService.saveActivity(activity);
        redirectAttributes.addFlashAttribute("message","活动更新成功");
        return "redirect:/activity/update/"+a.getId();
    }
    @RequestMapping(value="delete/{id}", method=RequestMethod.POST) public String delete(@PathVariable("id") Long id,RedirectAttributes redirectAttributes){
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
