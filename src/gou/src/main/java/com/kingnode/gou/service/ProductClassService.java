package com.kingnode.gou.service;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.google.common.collect.Lists;
import com.kingnode.gou.dao.ProductClassDao;
import com.kingnode.gou.entity.ProductClass;
import com.kingnode.xsimple.api.common.DataTable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 商品管理的品牌逻辑类
 */
@Service @Transactional(readOnly=true) public class ProductClassService{
    @Autowired private ProductClassDao classDao;
    @Transactional(readOnly=false) public void saveProductClass(ProductClass cls){
        classDao.save(cls);
    }
    @Transactional(readOnly=false) public void saveProductClass(List<ProductClass> productClassList){
        classDao.save(productClassList);
    }
    public ProductClass readProductClass(Long id){
        return classDao.findOne(id);
    }
    public ProductClass readProductClassByCode(String classCode){
        List<ProductClass> list=classDao.findByClassCode(classCode);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }
    public DataTable<ProductClass> pageProductClass(DataTable<ProductClass> dt,final Map<String,Object> searchParams){
        Sort.Direction d="asc".equals(dt.getsSortDir_0())?Sort.Direction.ASC:Sort.Direction.DESC;//升降序
        int index=Integer.parseInt(dt.getiSortCol_0());
        String[] column=new String[]{"classCode","className","classKeyword","classDesc"};
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(d,column[index]));
        Page<ProductClass> page=classDao.findAll(new Specification<ProductClass>(){
            @Override public Predicate toPredicate(Root<ProductClass> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                predicates.add(cb.equal(root.<Integer>get("removeTag"),0));
                for(String key : searchParams.keySet()){
                    if(key.contains("EQ_parentClass")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.equal(root.<String>get("parentClass"),searchParams.get(key).toString().trim()));
                    }
                    if(key.contains("OR_classCode|className")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.or(cb.like(root.<String>get("classCode"),"%"+searchParams.get(key).toString().trim()+"%"),cb.like(root.<String>get("className"),"%"+searchParams.get(key).toString().trim()+"%")));
                    }
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        },pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
    public List<ProductClass> subProductClass(Long id,boolean containSelf){
        List<ProductClass> list=Lists.newArrayList();
        ProductClass productClass=readProductClass(id);
        if(productClass==null){
            return list;
        }
        if(containSelf){
            list.add(productClass);
        }
        List<ProductClass> subList=classDao.listProductClassLikePath(productClass.getPath()+"%");
        if(subList!=null&&subList.size()>0){
            for(ProductClass temp : subList){
                if(temp.getId().longValue()==productClass.getId()){
                    continue;
                }
                list.add(temp);
            }
        }
        return list;
    }
    public List<ProductClass> listProductClass(Map<String,Object> searchParams){
        String type="";
        String classCode="";
        String className="";
        if(searchParams!=null&&searchParams.size()>0){
            if(searchParams.containsKey("EQ_type")&&!StringUtils.isBlank(searchParams.get("EQ_type").toString())){
                type=searchParams.get("EQ_type").toString().trim();
            }
            if(searchParams.containsKey("EQ_classCode")&&!StringUtils.isBlank(searchParams.get("EQ_classCode").toString())){
                classCode=searchParams.get("EQ_classCode").toString().trim();
            }
            if(searchParams.containsKey("EQ_className")&&!StringUtils.isBlank(searchParams.get("EQ_className").toString())){
                className=searchParams.get("EQ_className").toString().trim();
            }
        }
        if("classCode".equals(type)){
            return classDao.findByClassCode(classCode);
        }else if("className".equals(type)){
            return classDao.findByClassName(className);
        }
        return Lists.newArrayList();
    }
}
