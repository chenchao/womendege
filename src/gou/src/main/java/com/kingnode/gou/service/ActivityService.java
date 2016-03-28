package com.kingnode.gou.service;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.kingnode.gou.dao.ActivityDao;
import com.kingnode.gou.dao.ActivityPositionDao;
import com.kingnode.gou.dao.ActivityProductDao;
import com.kingnode.gou.dao.ActivityProductViewDao;
import com.kingnode.gou.dao.PositionDao;
import com.kingnode.gou.entity.Activity;
import com.kingnode.gou.entity.ActivityPosition;
import com.kingnode.gou.entity.ActivityProduct;
import com.kingnode.gou.entity.ActivityProductView;
import com.kingnode.gou.entity.OrderHead;
import com.kingnode.gou.entity.OrderReturnDetail;
import com.kingnode.gou.entity.Position;
import com.kingnode.xsimple.api.common.DataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component @Transactional(readOnly=true) public class ActivityService{
    @Autowired private ActivityPositionDao activityPositionDao;
    @Autowired private ActivityProductViewDao activityProductViewDao;
    @Autowired private ActivityDao activityDao;
    @Autowired private PositionDao positionDao;
    @Autowired private ActivityProductDao activityProductDao;
    public Activity readActivity(long id){
        return activityDao.findOne(id);
    }
    public Activity saveActivity(Activity activity){
        if(activity.getId()!=null){
            Activity old=activityDao.findOne(activity.getId());
            activity.setCreateId(old.getCreateId());
            activity.setCreateTime(old.getCreateTime());
        }
        return activityDao.save(activity);
    }
    public void deleteActivity(long id){
        Activity activity=activityDao.findOne(id);
        activity.setState(Activity.ActivityState.delete);
        activityDao.save(activity);
    }
    public Page<ActivityProductView> findActivityProducts(final String activityCode,int pageNumber,int pageSize){
        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Specification<ActivityProductView> spec=new Specification<ActivityProductView>(){
            @Override public Predicate toPredicate(Root<ActivityProductView> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                predicates.add(cb.equal(root.<String>get("activityCode"),activityCode));
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        return activityProductViewDao.findAll(spec,pageRequest);
    }
    public ActivityPosition getActivityPosition(final String activityCode,final String positionCode){
        List<ActivityPosition> list=activityPositionDao.queryActivityPosition(activityCode,positionCode);
        if(!list.isEmpty()){
            return list.get(0);
        }
        return null;
    }
    public List<ActivityPosition> findActivityPositions(long activityId){
        List<ActivityPosition> list=activityPositionDao.findActivityPositions(activityId);
        Iterable<Position> positions=positionDao.findAll();
        for(Position p:positions){
            boolean exist=false;
            for(ActivityPosition at:list){
                if(p.getId()==at.getPosition().getId()){
                    exist=true;
                    continue;
                }
            }
            if(!exist){
                ActivityPosition activityPosition=new ActivityPosition();
                activityPosition.setPosition(p);
                list.add(activityPosition);
            }
        }
        return list;
    }
    public ActivityPosition saveActivityPosition(Long id,long activityId,long positionId,String imagePath){
        if(id!=null){
            ActivityPosition oldAp=activityPositionDao.findOne(id);
            oldAp.setImgPath(imagePath);
            return activityPositionDao.save(oldAp);
        }else{
            Activity activity=activityDao.findOne(activityId);
            Position position=positionDao.findOne(positionId);
            ActivityPosition activityPosition=new ActivityPosition(activity,position,imagePath);
            return activityPositionDao.save(activityPosition);
        }
    }

    public DataTable<Activity> PageActivities(final Map<String,Object> searchParams,DataTable<Activity> dt){
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(Sort.Direction.DESC,"id"));
        Specification<Activity> spec=new Specification<Activity>(){
            @Override public Predicate toPredicate(Root<Activity> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                if(searchParams.get("activityCode")!=null && !"".equals(searchParams.get("activityCode")) ){
                    predicates.add(cb.equal(root.<String>get("activityCode"),"%"+searchParams.get("activityCode")+"%"));
                }
                if(searchParams.get("name")!=null && !"".equals(searchParams.get("name")) ){
                    predicates.add(cb.equal(root.<String>get("name"),"%"+searchParams.get("name")+"%"));
                }
                if(searchParams.get("state")!=null && !"".equals(searchParams.get("state")) ){
                    predicates.add(cb.equal(root.<String>get("state"),searchParams.get("state")));
                }
                predicates.add(cb.notEqual(root.<String>get("state"),Activity.ActivityState.delete));
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        Page<Activity> page=activityDao.findAll(spec,pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }

    public DataTable<ActivityProductView> PageActivityProducts(final Long activityId,final Map<String,Object> searchParams,DataTable<ActivityProductView> dt){
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength());
        Specification<ActivityProductView> spec=new Specification<ActivityProductView>(){
            @Override public Predicate toPredicate(Root<ActivityProductView> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                if(searchParams.get("activityCode")!=null && !"".equals(searchParams.get("activityCode")) ){
                    predicates.add(cb.equal(root.<String>get("activityCode"),"%"+searchParams.get("activityCode")+"%"));
                }
                if(searchParams.get("name")!=null && !"".equals(searchParams.get("name")) ){
                    predicates.add(cb.equal(root.<String>get("name"),"%"+searchParams.get("name")+"%"));
                }
                if(searchParams.get("state")!=null && !"".equals(searchParams.get("state")) ){
                    predicates.add(cb.equal(root.<String>get("state"),searchParams.get("state")));
                }
                predicates.add(cb.notEqual(root.<String>get("state"),Activity.ActivityState.delete));
                predicates.add(cb.equal(root.<ActivityProduct>get("apId").<Long>get("activityId"),activityId));
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        Page<ActivityProductView> page=activityProductViewDao.findAll(spec,pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
    public void saveActivityProduct(long activityId,List<Long> productIds){
        for(Long productId:productIds){
            activityProductDao.save(new ActivityProduct(activityId,productId));
        }
    }
    public void deleteActivityProduct(List<Long> ids){
        for(Long id:ids){
            activityProductDao.delete(id);
        }
    }
}
