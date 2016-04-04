package com.kingnode.gou.rest;
import com.kingnode.gou.dto.ActivityDto;
import com.kingnode.gou.dto.ActivityProductDto;
import com.kingnode.gou.entity.Activity;
import com.kingnode.gou.entity.ActivityPosition;
import com.kingnode.gou.entity.ActivityProductView;
import com.kingnode.gou.service.ActivityService;
import com.kingnode.xsimple.dao.system.KnEmployeeDao;
import com.kingnode.xsimple.rest.DetailDTO;
import com.kingnode.xsimple.rest.ListDTO;
import com.kingnode.xsimple.service.system.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
/**
 * 活动
 * Created by admin on 2015/6/2.
 */
@RestController
@RequestMapping("/api/activity")
public class ActivityRest{
    @Autowired
    private ActivityService activityService;

    /**
     * 获取活动商品
     * @return
     */
    @ResponseBody @RequestMapping(value="/activityProducts", method={RequestMethod.GET})
    public ListDTO<ActivityProductView> getActivityList(@RequestParam(value="activityCode") String activityCode,@RequestParam(value="p", defaultValue="0") Integer pageNo,@RequestParam(value="s", defaultValue="10") Integer pageSize){
        Page<ActivityProductView> page=activityService.findActivityProducts(activityCode,pageNo,pageSize);
        return new ListDTO<>(true,page.getContent());
    }
    @ResponseBody @RequestMapping(value="/activities", method={RequestMethod.GET})
    public DetailDTO<ActivityDto> getActivityList(@RequestParam(value="positionCode") String positionCode){
        ActivityPosition activityPosition=activityService.getActivityPosition(positionCode);
        ActivityDto activityDto=null;
        if(activityPosition!=null){
            activityDto=new ActivityDto();
            activityDto.setName(activityPosition.getActivity().getName());
            activityDto.setActivityCode(activityPosition.getActivity().getActivityCode());
            activityDto.setContent(activityPosition.getActivity().getContent());
            activityDto.setDiscount(activityPosition.getActivity().getDiscount());
            activityDto.setEndTime(activityPosition.getActivity().getEndTimeStr());
            activityDto.setStartTime(activityPosition.getActivity().getStartTimeStr());
            activityDto.setImgPath(activityPosition.getImgPath());
            activityDto.setPri(activityPosition.getActivity().getPri());
        }
        return new DetailDTO<>(true,activityDto);
    }

}
