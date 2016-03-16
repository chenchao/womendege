package com.kingnode.gou.service;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.google.common.collect.Lists;
import com.kingnode.gou.dao.ProductBrandDao;
import com.kingnode.gou.entity.ProductBrand;
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
@Service @Transactional(readOnly=true) public class ProductBrandService{
    @Autowired private ProductBrandDao brandDao;
    @Transactional(readOnly=false) public void saveProductBrand(ProductBrand brand){
        brandDao.save(brand);
    }
    public ProductBrand readProductBrand(Long id){
        return brandDao.findOne(id);
    }
    public DataTable<ProductBrand> pageProductBrand(DataTable<ProductBrand> dt,final Map<String,Object> searchParams){
        Sort.Direction d="asc".equals(dt.getsSortDir_0())?Sort.Direction.ASC:Sort.Direction.DESC;//升降序
        int index=Integer.parseInt(dt.getiSortCol_0());
        String[] column=new String[]{"brandCode","brandName","brandIcon","brandDesc"};
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(d,column[index]));
        Page<ProductBrand> page=brandDao.findAll(new Specification<ProductBrand>(){
            @Override public Predicate toPredicate(Root<ProductBrand> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                predicates.add(cb.equal(root.<Integer>get("removeTag"),0));
                for(String key : searchParams.keySet()){
                    if(key.contains("OR_brandCode|brandName")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.or(cb.like(root.<String>get("brandCode"),"%"+searchParams.get(key).toString().trim()+"%"),cb.like(root.<String>get("brandName"),"%"+searchParams.get(key).toString().trim()+"%")));
                    }
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        },pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
    public List<ProductBrand> listProductBrand(Map<String,Object> searchParams){
        String type="";
        String brandCode="";
        String brandName="";
        if(searchParams!=null&&searchParams.size()>0){
            if(searchParams.containsKey("EQ_type")&&!StringUtils.isBlank(searchParams.get("EQ_type").toString())){
                type=searchParams.get("EQ_type").toString().trim();
            }
            if(searchParams.containsKey("EQ_brandCode")&&!StringUtils.isBlank(searchParams.get("EQ_brandCode").toString())){
                brandCode=searchParams.get("EQ_brandCode").toString().trim();
            }
            if(searchParams.containsKey("EQ_brandName")&&!StringUtils.isBlank(searchParams.get("EQ_brandName").toString())){
                brandName=searchParams.get("EQ_brandName").toString().trim();
            }
        }
        if("brandCode".equals(type)){
            return brandDao.findByBrandCode(brandCode);
        }else if("brandName".equals(type)){
            return brandDao.findByBrandName(brandName);
        }
        return Lists.newArrayList();
    }
}
