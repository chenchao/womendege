package com.kingnode.gou.service;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.SetJoin;
import javax.persistence.criteria.Subquery;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.kingnode.gou.dao.ActivityDao;
import com.kingnode.gou.dao.ActivityPositionDao;
import com.kingnode.gou.dao.ActivityProductDao;
import com.kingnode.gou.dao.ActivityProductViewDao;
import com.kingnode.gou.dao.PositionDao;
import com.kingnode.gou.dao.ProductDao;
import com.kingnode.gou.entity.Activity;
import com.kingnode.gou.entity.ActivityPosition;
import com.kingnode.gou.entity.ActivityProduct;
import com.kingnode.gou.entity.ActivityProductView;
import com.kingnode.gou.entity.OrderHead;
import com.kingnode.gou.entity.OrderReturnDetail;
import com.kingnode.gou.entity.Position;
import com.kingnode.gou.entity.Product;
import com.kingnode.xsimple.api.common.DataTable;
import org.apache.commons.lang3.StringUtils;
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
    @Autowired private ProductDao productDao;
    @Autowired private ProductDetailService productDetailService;
    public Activity readActivity(long id){
        return activityDao.findOne(id);
    }
    @Transactional(readOnly=false)
    public Activity saveActivity(Activity activity,Map<String,Object> imgPaths){
        if(activity.getId()!=null&& activity.getId()!=0){
            Activity old=activityDao.findOne(activity.getId());
            activity.setCreateId(old.getCreateId());
            activity.setCreateTime(old.getCreateTime());
            deleteActivityPosition(activity.getId());
        }
        Activity resultActivity=activityDao.save(activity);
        for(String id:imgPaths.keySet()){
            ActivityPosition activityPosition=new ActivityPosition(resultActivity,positionDao.findOne(Long.valueOf(id)),imgPaths.get(id)==null?"":imgPaths.get(id).toString());
            activityPositionDao.save(activityPosition);
        }
        return resultActivity;
    }
    @Transactional(readOnly=false)
    private void deleteActivityPosition(long activityId){
        List<ActivityPosition> list=activityPositionDao.findActivityPositions(activityId);
        activityPositionDao.delete(list);
    }
    @Transactional(readOnly=false)
    public void deleteActivity(long id){
        Activity activity=activityDao.findOne(id);
        activity.setState(Activity.ActivityState.delete);
        activityDao.save(activity);
    }
    public Page<ActivityProductView> findActivityProducts(final String activityCode,int pageNumber,int pageSize){
        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"productCode"));
        Specification<ActivityProductView> spec=new Specification<ActivityProductView>(){
            @Override public Predicate toPredicate(Root<ActivityProductView> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                predicates.add(cb.equal(root.<String>get("activityCode"),activityCode));
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        return activityProductViewDao.findAll(spec,pageRequest);
    }
    public ActivityPosition getActivityPosition(final String positionCode){
        List<ActivityPosition> list=activityPositionDao.queryActivityPosition(positionCode);
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
    public List<ActivityPosition> findAllActivityPositions(){
        List<ActivityPosition> list=new ArrayList<>();
        Iterable<Position> positions=positionDao.findAll();
        for(Position p:positions){
            ActivityPosition activityPosition=new ActivityPosition();
            activityPosition.setPosition(p);
            list.add(activityPosition);
        }
        return list;
    }
    @Transactional(readOnly=false)
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

    public DataTable<ActivityProduct> PageActivityProducts(final Long activityId,DataTable<ActivityProduct> dt){
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength());
        Specification<ActivityProduct> spec=new Specification<ActivityProduct>(){
            @Override public Predicate toPredicate(Root<ActivityProduct> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                predicates.add(cb.equal(root.<Activity>get("activity").<Long>get("id"),activityId));
//                predicates.add(cb.equal(root.<Product>get("product").<Integer>get("ifSub"),1));
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        Page<ActivityProduct> page=activityProductDao.findAll(spec,pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
    public DataTable<Product> pageProduct(DataTable<Product> dt,final Map<String,Object> searchParams,final Long activityId){
        Sort.Direction d="asc".equals(dt.getsSortDir_0())?Sort.Direction.ASC:Sort.Direction.DESC;//升降序
        int index=Integer.parseInt(dt.getiSortCol_0());
        String[] column=new String[]{"productCode","productName","productShortName","productBrand","productClass","id"};
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(d,column[index]));
        Page<Product> page=productDao.findAll(new Specification<Product>(){
            @Override public Predicate toPredicate(Root<Product> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                Subquery subquery=query.subquery(ActivityProduct.class);
                Root<ActivityProduct> subRoot=subquery.from(ActivityProduct.class);
                subquery.select(subRoot.<Product>get("product").<Long>get("id"));
                subquery.where(cb.equal(subRoot.<Activity>get("activity").get("id"),activityId));
                predicates.add(root.get("id").in(subquery).not());
                predicates.add(cb.equal(root.<Integer>get("removeTag"),0));
                for(String key : searchParams.keySet()){
                    if(key.contains("LIKE_code")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.like(root.<String>get("productCode"),"%"+searchParams.get(key).toString().trim()+"%"));
                    }
                    if(key.contains("LIKE_name")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.like(root.<String>get("productName"),"%"+searchParams.get(key).toString().trim()+"%"));
                    }
                    if(key.contains("LIKE_shortName")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.like(root.<String>get("productShortName"),"%"+searchParams.get(key).toString().trim()+"%"));
                    }
                    if(key.contains("LIKE_brand")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        List<String> brandCodes=productDetailService.listBrandCode(searchParams.get(key).toString().trim());
                        if(brandCodes.size()<=0){
                            brandCodes.add("0");
                        }
                        predicates.add(root.<String>get("productBrand").in(brandCodes));
                    }
                    if(key.contains("LIKE_class")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        List<String> classCodes=productDetailService.listClassCode(searchParams.get(key).toString().trim());
                        if(classCodes.size()<=0){
                            classCodes.add("0");
                        }
                        predicates.add(root.<String>get("productClass").in(classCodes));
                    }
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        },pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
    @Transactional(readOnly=false)
    public void saveActivityProduct(long activityId,List<Long> productIds){
        Activity activity=activityDao.findOne(activityId);
        Iterable<Product> products=productDao.findAll(productIds);
        for(Product product:products){
            activityProductDao.save(new ActivityProduct(activity,product));
        }
    }
    @Transactional(readOnly=false)
    public void deleteActivityProduct(String[] ids){
        for(String id:ids){
            activityProductDao.delete(Long.valueOf(id));
        }
    }
}
