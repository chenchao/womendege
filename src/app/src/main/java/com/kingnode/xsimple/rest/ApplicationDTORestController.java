package com.kingnode.xsimple.rest;
import java.util.List;

import com.google.common.collect.Lists;
import com.kingnode.diva.mapper.BeanMapper;
import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.dto.application.ApplicationDTO;
import com.kingnode.xsimple.entity.application.KnApplicationInfo;
import com.kingnode.xsimple.service.application.ApplicationDTOService;
import com.kingnode.xsimple.util.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
/**
 * 关于应用接口的DTO形式的controller改造
 * @author cici
 */
@RestController @RequestMapping(value="/api/v1/app")
public class ApplicationDTORestController{
    private static Logger logger=LoggerFactory.getLogger(ApplicationDTORestController.class);
    @Autowired private ApplicationDTOService applicationDTOService;
    /**
     * 应用描述接口
     *
     * @param key 应用的标识
     */
    @RequestMapping(value="info", method=RequestMethod.POST)
    public DetailDTO applicationInfo(@RequestParam(value="key") String key){
        DetailDTO detailDTO = new DetailDTO(true);
        KnApplicationInfo app = applicationDTOService.FindByApiKey(key);
        if(app==null){
            detailDTO.setDetail("");
        }else{
            detailDTO.setDetail(app.getRemark());
        }
        return detailDTO;
    }
    /**
     * 更多应用接口
     *
     * @param key 应用的标识
     */
    @RequestMapping(value="more", method=RequestMethod.POST)
    public ListDTO<ApplicationDTO> applicationInfo(@RequestParam(value="key") String key,@RequestParam(value="status") Setting.WorkStatusType status){
        List<Setting.WorkStatusType> workStatusTypes =Lists.newArrayList();
        workStatusTypes.add(status);
        List<KnApplicationInfo> apps = applicationDTOService.FindMoreAppByApiKey(key,workStatusTypes);
        ListDTO<ApplicationDTO> listDTO= null;
        if(Utils.isEmpityCollection(apps)){
            listDTO = new ListDTO<>(true,null);
        }else{
            List<ApplicationDTO> list=Lists.newArrayList();
            for(KnApplicationInfo e : applicationDTOService.FindMoreAppByApiKey(key,workStatusTypes)){
                ApplicationDTO dto=BeanMapper.map(e,ApplicationDTO.class);
                list.add(dto);
            }
            listDTO=new ListDTO<>(true,list);
        }
        return listDTO;
    }
}
