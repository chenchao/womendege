package com.kingnode.gou.service;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.google.common.collect.Lists;
import com.kingnode.gou.dao.ProductCatalogAttrDao;
import com.kingnode.gou.dao.ProductCatalogDao;
import com.kingnode.gou.entity.ProductCatalog;
import com.kingnode.gou.entity.ProductCatalogAttr;
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
@Service @Transactional(readOnly=true) public class ProductCatalogService{
    @Autowired private ProductCatalogDao catalogDao;
    @Autowired private ProductCatalogAttrDao catalogAttrDao;
    @Transactional(readOnly=false) public void saveProductCatalog(ProductCatalog catalog){
        catalogDao.save(catalog);
    }
    @Transactional(readOnly=false) public void saveProductCatalogAttr(ProductCatalogAttr catalogAttr){
        catalogAttrDao.save(catalogAttr);
    }
    @Transactional(readOnly=false) public void saveProductCatalogAttr(List<ProductCatalogAttr> productCatalogAttrList){
        catalogAttrDao.save(productCatalogAttrList);
    }
    public ProductCatalog readProductCatalog(Long id){
        return catalogDao.findOne(id);
    }
    public ProductCatalogAttr readProductCatalogAttr(Long id){
        return catalogAttrDao.findOne(id);
    }
    public String readProductCatalogAttrNames(Long catalogId){
        StringBuilder sb=new StringBuilder();
        List<ProductCatalogAttr> attrs=listProductCatalogAttrByCatalogId(catalogId);
        if(attrs!=null){
            for(ProductCatalogAttr attr:attrs){
                sb.append(attr.getCatalogAttrName()).append(",");
            }
        }
        return sb.length()>0?sb.toString().substring(0,sb.length()-1):"";
    }
    public DataTable<ProductCatalog> pageProductCatalog(DataTable<ProductCatalog> dt,final Map<String,Object> searchParams){
        Sort.Direction d="asc".equals(dt.getsSortDir_0())?Sort.Direction.ASC:Sort.Direction.DESC;//升降序
        int index=Integer.parseInt(dt.getiSortCol_0());
        String[] column=new String[]{"catalogName","catalogDesc"};
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(d,column[index]));
        Page<ProductCatalog> page=catalogDao.findAll(new Specification<ProductCatalog>(){
            @Override public Predicate toPredicate(Root<ProductCatalog> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                predicates.add(cb.equal(root.<Integer>get("removeTag"),0));
                for(String key : searchParams.keySet()){
                    if(key.contains("LIKE_catalogName")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.like(root.<String>get("catalogName"),"%"+searchParams.get(key).toString().trim()+"%"));
                    }
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        },pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
    public DataTable<ProductCatalogAttr> pageProductCatalogAttr(DataTable<ProductCatalogAttr> dt,final Map<String,Object> searchParams){
        Sort.Direction d="asc".equals(dt.getsSortDir_0())?Sort.Direction.ASC:Sort.Direction.DESC;//升降序
        int index=Integer.parseInt(dt.getiSortCol_0());
        String[] column=new String[]{"catalogAttrName","catalogAttrSort"};
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(d,column[index]));
        Page<ProductCatalogAttr> page=catalogAttrDao.findAll(new Specification<ProductCatalogAttr>(){
            @Override public Predicate toPredicate(Root<ProductCatalogAttr> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                predicates.add(cb.equal(root.<Integer>get("removeTag"),0));
                predicates.add(cb.equal(root.<Long>get("catalogId"),Long.valueOf(searchParams.get("EQ_catalogId").toString())));
                for(String key : searchParams.keySet()){
                    if(key.contains("LIKE_catalogAttrName")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.like(root.<String>get("catalogAttrName"),"%"+searchParams.get(key).toString().trim()+"%"));
                    }
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        },pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
    public List<ProductCatalog> listProductCatalog(Map<String,Object> searchParams){
        String type="";
        String catalogName="";
        if(searchParams!=null&&searchParams.size()>0){
            if(searchParams.containsKey("EQ_type")&&!StringUtils.isBlank(searchParams.get("EQ_type").toString())){
                type=searchParams.get("EQ_type").toString().trim();
            }
            if(searchParams.containsKey("EQ_catalogName")&&!StringUtils.isBlank(searchParams.get("EQ_catalogName").toString())){
                catalogName=searchParams.get("EQ_catalogName").toString().trim();
            }
        }
        if("catalogName".equals(type)){
            return catalogDao.findByCatalogName(catalogName);
        }
        return Lists.newArrayList();
    }
    public List<ProductCatalogAttr> listProductCatalogAttr(Map<String,Object> searchParams){
        String type="";
        String catalogAttrName="";
        Long catalogId=0l;
        if(searchParams!=null&&searchParams.size()>0){
            if(searchParams.containsKey("EQ_type")&&!StringUtils.isBlank(searchParams.get("EQ_type").toString())){
                type=searchParams.get("EQ_type").toString().trim();
            }
            if(searchParams.containsKey("EQ_catalogName")&&!StringUtils.isBlank(searchParams.get("EQ_catalogName").toString())){
                catalogAttrName=searchParams.get("EQ_catalogName").toString().trim();
            }
            if(searchParams.containsKey("EQ_catalogId")&&!StringUtils.isBlank(searchParams.get("EQ_catalogId").toString())){
                catalogId=Long.valueOf(searchParams.get("EQ_catalogId").toString().trim());
            }
        }
        if("catalogAttrName".equals(type)){
            return catalogAttrDao.findByCatalogAttrName(catalogAttrName,catalogId);
        }
        return Lists.newArrayList();
    }
    public List<ProductCatalogAttr> listProductCatalogAttrByCatalogId(Long catalogId){
        return catalogAttrDao.findByCatalogId(catalogId);
    }
}
