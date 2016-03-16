package com.kingnode.xsimple.service.system;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.kingnode.diva.mapper.BeanMapper;
import com.kingnode.diva.mapper.JsonMapper;
import com.kingnode.diva.persistence.DynamicSpecifications;
import com.kingnode.diva.persistence.SearchFilter;
import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.api.common.DataTable;
import com.kingnode.xsimple.dao.system.KnFeedProblemDao;
import com.kingnode.xsimple.dao.system.KnIdeaFeedbackDao;
import com.kingnode.xsimple.dto.application.ScoreDto;
import com.kingnode.xsimple.dto.opinion.FeedProblemDTO;
import com.kingnode.xsimple.dto.opinion.FeedbackOpinionDTO;
import com.kingnode.xsimple.entity.system.KnFeedProblem;
import com.kingnode.xsimple.entity.system.KnIdeaFeedback;
import com.kingnode.xsimple.rest.RestStatus;
import com.kingnode.xsimple.util.PathUtil;
import com.kingnode.xsimple.util.Utils;
import com.kingnode.xsimple.util.excel.DownExcel;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
/**
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@Component @Transactional(readOnly=true)
public class IdeaFeedbackService{
    private KnIdeaFeedbackDao fb;
    private KnFeedProblemDao knFeedProblemDao ;
    @Autowired
    public void setFb(KnIdeaFeedbackDao fb){
        this.fb=fb;
    }
    @Autowired
    public void setKnFeedProblemDao(KnFeedProblemDao knFeedProblemDao){
        this.knFeedProblemDao=knFeedProblemDao;
    }
    @Transactional(readOnly=false)
    public void Delete(Long id){
        fb.delete(id);
    }
    @Transactional(readOnly=false)
    public void DeleteAll(Long[] ids){
        for(Long id : ids){
            fb.delete(id);
        }
    }

    /**
     * 用于被接口调用
     * @param params
     * @return
     */
    @Transactional(readOnly=false)
    public boolean saveFeedback(String params){
        try{
            if(params==null||"".equals(params.trim()))
                return false;
            FeedbackOpinionDTO dto = JsonMapper.nonDefaultMapper().fromJson(params, FeedbackOpinionDTO.class)  ;
            KnIdeaFeedback feedback=BeanMapper.map(dto,KnIdeaFeedback.class);
            fb.save(feedback);
        }catch(Exception e){
            return false ;
        }
        return true;
    }
    /**
     * 保存意见反馈
     * @param dto
     * @return
     */
    @Transactional(readOnly=false)
    public RestStatus saveFeedback(FeedbackOpinionDTO dto){
        RestStatus status = new RestStatus(false);
        KnIdeaFeedback feedback=BeanMapper.map(dto,KnIdeaFeedback.class);
        fb.save(feedback);
        return status;
    }

    public DataTable<KnIdeaFeedback> PageIdeaFeedbacks(Map<String,Object> searchParams,DataTable<KnIdeaFeedback> dt){
        Sort sort=getSort(dt);
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),sort);
        Map<String,SearchFilter> filters=SearchFilter.parse(searchParams);
        Specification<KnIdeaFeedback> spec=DynamicSpecifications.bySearchFilter(filters.values());
        Page<KnIdeaFeedback> page=fb.findAll(spec,pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
    /**
     *
     * @param response
     * @param ids
     * @param tip  0: 全部导出 ,  1: 选择导出 ,  2: 查询导出
     * @param paramMap
     * @throws ParseException
     */
    public void ExportExcel(HttpServletResponse response,List<Long> ids,String tip ,Map<String,Object> paramMap) throws ParseException{
        List<KnIdeaFeedback> ideaFeedbackList=new ArrayList<>();
        if("0".equals(tip)){
            ideaFeedbackList = (List<KnIdeaFeedback>)fb.findAll();
        }else if("1".equals(tip)){
            ideaFeedbackList = (List<KnIdeaFeedback>)fb.findAll(ids);
        }else if("2".equals(tip)){
            Map<String,SearchFilter> filters=SearchFilter.parse(paramMap);
            Specification<KnIdeaFeedback> spec=DynamicSpecifications.bySearchFilter(filters.values());
            ideaFeedbackList=fb.findAll(spec);
        }
        List<String[]> arrayList=new ArrayList<>();
        arrayList.add(new String[]{"序号","联系人","系统来源","联系电话","应用包名","反馈内容","反馈时间"}); //列头
        if(!Utils.isEmpityCollection(ideaFeedbackList)){
            int j=0;
            for(KnIdeaFeedback ideaFeedback : ideaFeedbackList){
                j++;
                String createTime=Utils.isEmptyStr(ideaFeedback.getCreateTime())?"":new DateTime(ideaFeedback.getCreateTime()).toString("yyyy-MM-dd HH:mm:ss");
                arrayList.add(new String[]{String.valueOf(j),ideaFeedback.getLinkPerop(),ideaFeedback.getFromSys(),ideaFeedback.getPhone(),ideaFeedback.getPackageName(),ideaFeedback.getContent(),createTime});
            }
        }
        Map<String,List<String[]>> map=new HashMap();//导出excel 内容
        String excelTitle="系统反馈意见导出信息";
        map.put(excelTitle,arrayList);
        DownExcel downExcel=DownExcel.getInstall();
        downExcel.downLoadFile(response,downExcel.exportXlsExcel(map, PathUtil.getRootPath()+Setting.BASEADDRESS+Setting.excelAddress
                  ,String.valueOf(System.currentTimeMillis())),excelTitle,true); //导出2003 excel
    }
    /**
     * 问题反馈中 问题及答案列表
     * @param searchParams
     * @param dt
     * @return
     */
    public DataTable<KnFeedProblem> PageFeedProblem(Map<String,Object> searchParams,DataTable<KnFeedProblem> dt){
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength());
        Map<String,SearchFilter> filters=SearchFilter.parse(searchParams);
        Specification<KnFeedProblem> spec=DynamicSpecifications.bySearchFilter(filters.values());
        Page<KnFeedProblem> page= knFeedProblemDao.findAll(spec,pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }

    public List<FeedProblemDTO> FindFeedProblemList(){
        List<FeedProblemDTO> list=Lists.newArrayList();
        List<KnFeedProblem> knFeedProblemList = (List<KnFeedProblem>)knFeedProblemDao.findAll();
        for(KnFeedProblem ke : knFeedProblemList){
            list.add(BeanMapper.map(ke,FeedProblemDTO.class));
        }
        return list;
    }

    public KnFeedProblem FindoneKnFeedProblem(Long id){
        return knFeedProblemDao.findOne(id) ;
    }

    public List FindListByType(Setting.FeedProblenType feedProblenType){
       return knFeedProblemDao.findListByType(feedProblenType) ;
    }
    @Transactional(readOnly=false)
    public boolean SaveKnFeedProblem(KnFeedProblem knFeedProblem){
        try{
            knFeedProblemDao.save(knFeedProblem) ;
        }catch(Exception e){
            return false ;
        }
        return true;
    }

    @Transactional(readOnly=false)
    public void DeleteProblem(List<Long> ids){
        List<KnFeedProblem> list=(List<KnFeedProblem>)knFeedProblemDao.findAll(ids);
        knFeedProblemDao.delete(list);
    }

    private Sort getSort(DataTable<KnIdeaFeedback> dt){
        Sort.Direction d=Sort.Direction.DESC;
        if("asc".equals(dt.getsSortDir_0())){
            d=Sort.Direction.ASC;
        }
        String[] column=new String[]{"id","linkPerop","fromSys","phone","packageName","content","createTime"};
        return new Sort(d,column[Integer.parseInt(dt.getiSortCol_0())]);
    }

}
