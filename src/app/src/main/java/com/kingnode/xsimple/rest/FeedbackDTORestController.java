package com.kingnode.xsimple.rest;
import java.util.List;

import com.google.common.collect.Lists;
import com.kingnode.diva.mapper.BeanMapper;
import com.kingnode.xsimple.dto.opinion.CustomServiceDTO;
import com.kingnode.xsimple.dto.opinion.FeedbackOpinionDTO;
import com.kingnode.xsimple.dto.opinion.SystemAttributeDTO;
import com.kingnode.xsimple.entity.system.KnCustomServiceInfo;
import com.kingnode.xsimple.entity.system.KnSystemPropertieInfo;
import com.kingnode.xsimple.service.system.CustomService;
import com.kingnode.xsimple.service.system.IdeaFeedbackService;
import com.kingnode.xsimple.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
/**
 * 反馈意见DTO接口的控制器入口
 * @author cici
 */
@RestController @RequestMapping({"/api/v1/opinion"})
public class FeedbackDTORestController{
    @Autowired
    private CustomService cs;
    @Autowired
    private IdeaFeedbackService fs;
    /**
     * 获取系统属性信息
     * @return
     */
    @RequestMapping(value="sys",method={RequestMethod.GET})
    public DetailDTO<SystemAttributeDTO> SystemAttribute(){
        List<KnSystemPropertieInfo> syss = cs.ReadSystemPropertieInfo();
        DetailDTO<SystemAttributeDTO> dto = new DetailDTO<>();
        dto.setStatus(true);
        if(  !Utils.isEmpityCollection(syss) ) {
            SystemAttributeDTO sysdto=BeanMapper.map( syss.get(0),SystemAttributeDTO.class);
            dto.setDetail(sysdto);
        }else{
            dto.setDetail(new SystemAttributeDTO());
        }
        return dto;
    }

    /**
     * 获取系统中的客服人员信息
     */
    @RequestMapping(value="customer",method={RequestMethod.GET})
    public ListDTO<CustomServiceDTO> CustomerEmployee(){
        List<CustomServiceDTO> list=Lists.newArrayList();
        List<KnCustomServiceInfo> customServiceInfoList = cs.FindCustomServices();
        for(KnCustomServiceInfo e : customServiceInfoList){
            CustomServiceDTO dto=BeanMapper.map(e,CustomServiceDTO.class);
            list.add(dto);
        }
        return new ListDTO<>(true,list);
    }


    /**
     * 保存意见反馈信息
     */
    @RequestMapping(value="save",method={RequestMethod.POST})
    public RestStatus saveFeedbackOpinion(FeedbackOpinionDTO feedbackOpinionDTO){
        return fs.saveFeedback(feedbackOpinionDTO);
    }

}
