package com.kingnode.gou.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.google.common.collect.Lists;
import com.kingnode.diva.mapper.JsonMapper;
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
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 商品管理的品牌逻辑类
 */
@Service @Transactional(readOnly=true) public class ProductCatalogService{
    @Autowired private ProductCatalogDao catalogDao;
    @Autowired private ProductCatalogAttrDao catalogAttrDao;
    @Autowired private JdbcTemplate jdbcTemplate;
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
            for(ProductCatalogAttr attr : attrs){
                sb.append(attr.getCatalogAttrName()).append(",");
            }
        }
        return sb.length()>0?sb.toString().substring(0,sb.length()-1):"";
    }
    public DataTable<ProductCatalog> pageProductCatalog(DataTable<ProductCatalog> dt,final Map<String,Object> searchParams){
        Sort.Direction d="asc".equals(dt.getsSortDir_0())?Sort.Direction.ASC:Sort.Direction.DESC;//升降序
        int index=Integer.parseInt(dt.getiSortCol_0());
        String[] column=new String[]{"catalogName","catalogType","catalogDesc"};
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(d,column[index]));
        Page<ProductCatalog> page=catalogDao.findAll(new Specification<ProductCatalog>(){
            @Override public Predicate toPredicate(Root<ProductCatalog> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                predicates.add(cb.equal(root.<Integer>get("removeTag"),0));
                for(String key : searchParams.keySet()){
                    if(key.contains("LIKE_catalogName")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.like(root.<String>get("catalogName"),"%"+searchParams.get(key).toString().trim()+"%"));
                    }
                    if(key.contains("EQ_catalogType")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        predicates.add(cb.equal(root.<String>get("catalogType"),searchParams.get(key).toString().trim()));
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
    public List<ProductCatalogAttr> listProductCatalogAttrByCatalogId(Long catalogId,Long productId,String type){
        String sql="select a.*,b.catalog_attr_val from product_catalog_attr a left join product_catalog_attr_val b on a.id=b.catalog_attr_id and "+("1".equals(type)?"b.product_id=?":"b.product_sub_id=?")+" where a.catalog_id=? order by a.catalog_attr_sort asc";
        List<Object> params=Lists.newArrayList();
        params.add(productId);
        params.add(catalogId);
        System.out.println("==========================>sql="+sql+";params="+JsonMapper.nonDefaultMapper().toJson(params));
        List<Map<String,Object>> mapList=jdbcTemplate.queryForList(sql,params.toArray());
        List<ProductCatalogAttr> list=Lists.newArrayList();
        if(mapList!=null&&mapList.size()>0){
            for(Map<String,Object> map : mapList){
                ProductCatalogAttr attr=new ProductCatalogAttr();
                attr.setId(map.get("id")!=null?Long.valueOf(map.get("id").toString()):0l);
                attr.setCatalogId(map.get("catalog_id")!=null?Long.valueOf(map.get("catalog_id").toString()):0l);
                attr.setCatalogAttrSort(map.get("catalog_attr_sort")!=null?Integer.valueOf(map.get("catalog_attr_sort").toString()):0);
                attr.setCatalogAttrName(map.get("catalog_attr_name")!=null?map.get("catalog_attr_name").toString():"");
                attr.setCatalogAttrVal(map.get("catalog_attr_val")!=null?map.get("catalog_attr_val").toString():"");
                list.add(attr);
            }
        }
        return list;
    }
}
