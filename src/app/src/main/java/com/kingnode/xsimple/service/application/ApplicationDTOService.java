package com.kingnode.xsimple.service.application;
import java.util.List;

import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.dao.application.KnApplicationInfoDao;
import com.kingnode.xsimple.entity.application.KnApplicationInfo;
import com.kingnode.xsimple.util.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
/**
 * 应用管理DTOservice,专门用于ApplicationDTORestController使用
 * @author cici
 */
@Component @Transactional(readOnly=true)
public class ApplicationDTOService{
    private static Logger logger=LoggerFactory.getLogger(ApplicationDTOService.class);
    private KnApplicationInfoDao knApplicationInfoDao;
    @Autowired public void setKnApplicationInfoDao(KnApplicationInfoDao knApplicationInfoDao){
        this.knApplicationInfoDao=knApplicationInfoDao;
    }
    /**
     * 根据应用的appkey获取应用的信息
     * @param key
     * @return
     */
    public KnApplicationInfo FindByApiKey(String key){
        List<KnApplicationInfo> list = knApplicationInfoDao.findApplicationByAppkey(key);
        if(Utils.isEmpityCollection(list)){
            return null;
        }
        return list.get(0);
    }
    /**
     * 根据应用的appkey获取除了本应用外的应用信息
     * @param key
     * @return
     */
    public List<KnApplicationInfo> FindMoreAppByApiKey(String key, List<Setting.WorkStatusType> workStatList){
        return  knApplicationInfoDao.findApplicationByAppkeyAndStats(key,workStatList);
    }
}
