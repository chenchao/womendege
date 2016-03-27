package com.kingnode.gou.service;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.google.common.collect.Lists;
import com.kingnode.gou.dao.ProductBrandDao;
import com.kingnode.gou.dao.ProductCatalogAttrValDao;
import com.kingnode.gou.dao.ProductCatalogDao;
import com.kingnode.gou.dao.ProductClassDao;
import com.kingnode.gou.dao.ProductDao;
import com.kingnode.gou.dao.ProductDetailDao;
import com.kingnode.gou.dao.ProductPictureDao;
import com.kingnode.gou.entity.Product;
import com.kingnode.gou.entity.ProductBrand;
import com.kingnode.gou.entity.ProductCatalog;
import com.kingnode.gou.entity.ProductCatalogAttrVal;
import com.kingnode.gou.entity.ProductClass;
import com.kingnode.gou.entity.ProductDetail;
import com.kingnode.gou.entity.ProductPicture;
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
@Service @Transactional(readOnly=true) public class ProductDetailService{
    @Autowired private ProductDao productDao;
    @Autowired private ProductDetailDao productDetailDao;
    @Autowired private ProductPictureDao pictureDao;
    @Autowired private ProductCatalogAttrValDao attrValDao;
    @Autowired private ProductCatalogDao catalogDao;
    @Autowired private ProductBrandDao brandDao;
    @Autowired private ProductClassDao classDao;

    public List<Product> listProduct(Map<String,Object> searchParams){
        String type="";
        String productCode="";
        String productName="";
        if(searchParams!=null&&searchParams.size()>0){
            if(searchParams.containsKey("EQ_type")&&!StringUtils.isBlank(searchParams.get("EQ_type").toString())){
                type=searchParams.get("EQ_type").toString().trim();
            }
            if(searchParams.containsKey("EQ_productCode")&&!StringUtils.isBlank(searchParams.get("EQ_productCode").toString())){
                productCode=searchParams.get("EQ_productCode").toString().trim();
            }
            if(searchParams.containsKey("EQ_productName")&&!StringUtils.isBlank(searchParams.get("EQ_productName").toString())){
                productName=searchParams.get("EQ_productName").toString().trim();
            }
        }
        if("productCode".equals(type)){
            return productDao.findByProductCode(productCode);
        }else if("productName".equals(type)){
            return productDao.findByProductName(productName);
        }
        return Lists.newArrayList();
    }
    @Transactional(readOnly=false)
    public void saveProduct(Product product){
        productDao.save(product);
    }
    public void saveProductPicture(String[] fileAddress,String productType,Long productId){
        if(StringUtils.isBlank(productType)||productId==null||productId<=0){
            return;
        }
        List<ProductPicture> pictures=Lists.newArrayList();
        int sort=1;
        for(String file:fileAddress){
            if(StringUtils.isBlank(file)){
                continue;
            }
            ProductPicture picture=new ProductPicture();
            picture.setRemoveTag(0);
            picture.setProductType(productType);
            picture.setProductId(productId);
            picture.setPictureUrl(file);
            picture.setPictureName(file.substring(file.lastIndexOf("/")+1,file.lastIndexOf(".")));
            picture.setPictureType(file.substring(file.lastIndexOf(".")+1,file.length()));
            picture.setPictureSort(sort);
            pictures.add(picture);
            sort++;
        }
        saveProductPicture(pictures);
    }
    @Transactional(readOnly=false)
    public void saveProductPicture(List<ProductPicture> pictures){
        pictureDao.save(pictures);
    }
    public void saveProductCatalogAttrVal(Long[] catalogAttrId,String[] catalogAttrVal,Long productId,Long catalogId,String productType){
        if(productId==null||productId<=0||catalogId==null||catalogId<=0){
            return;
        }
        List<ProductCatalogAttrVal> catalogAttrValues=Lists.newArrayList();
        for(int i=0;i<catalogAttrId.length;i++){
            Long attrId=catalogAttrId[i];
            if(attrId==null||attrId<=0){
                continue;
            }
            String attrVal=catalogAttrVal[i];
            if(StringUtils.isBlank(attrVal)){
                continue;
            }
            ProductCatalogAttrVal catalogAttrValue=new ProductCatalogAttrVal();
            catalogAttrValue.setRemoveTag(0);
            if("1".equals(productType)){
                catalogAttrValue.setProductId(productId);
            }else{
                catalogAttrValue.setProductSubId(productId);
            }
            catalogAttrValue.setCatalogId(catalogId);
            catalogAttrValue.setCatalogAttrId(attrId);
            catalogAttrValue.setCatalogAttrVal(attrVal);
            catalogAttrValues.add(catalogAttrValue);
        }
        saveProductCatalogAttrVal(catalogAttrValues);
    }
    @Transactional(readOnly=false)
    private void saveProductCatalogAttrVal(List<ProductCatalogAttrVal> catalogAttrValues){
        attrValDao.save(catalogAttrValues);
    }
    public Product readProduct(Long id){
        return productDao.findOne(id);
    }
    public ProductCatalog readProductCatalog(Long id){
        return catalogDao.findOne(id);
    }
    public List<ProductPicture> listProductPicture(Long productId,String type){
        return pictureDao.findByProductIdAndType(productId,type);
    }
    @Transactional(readOnly=false)
    public void deleteProductPicture(String type,Long productId){
        List<ProductPicture> pictures=listProductPicture(productId,type);
        if(pictures!=null&&pictures.size()>0){
            pictureDao.delete(pictures);
        }
    }
    @Transactional(readOnly=false)
    public void deleteProductCatalogAttrVal(String type,Long productId,Long catalogId){
        List<ProductCatalogAttrVal> vals=null;
        if("1".equals(type)){
            vals=attrValDao.findByProductIdAndCatalogId(productId,catalogId);
        }else if("2".equals(type)){
            vals=attrValDao.findByProductSubIdAndCatalogId(productId,catalogId);
        }
        if(vals!=null&&vals.size()>0){
            attrValDao.delete(vals);
        }
    }
    public List<ProductDetail> listProductDetail(Map<String,Object> searchParams){
        String type="";
        String productSubCode="";
        String productSubName="";
        if(searchParams!=null&&searchParams.size()>0){
            if(searchParams.containsKey("EQ_type")&&!StringUtils.isBlank(searchParams.get("EQ_type").toString())){
                type=searchParams.get("EQ_type").toString().trim();
            }
            if(searchParams.containsKey("EQ_productSubCode")&&!StringUtils.isBlank(searchParams.get("EQ_productSubCode").toString())){
                productSubCode=searchParams.get("EQ_productSubCode").toString().trim();
            }
            if(searchParams.containsKey("EQ_productSubName")&&!StringUtils.isBlank(searchParams.get("EQ_productSubName").toString())){
                productSubName=searchParams.get("EQ_productSubName").toString().trim();
            }
        }
        if("productSubCode".equals(type)){
            return productDetailDao.findByProductSubCode(productSubCode);
        }else if("productSubName".equals(type)){
            return productDetailDao.findByProductSubName(productSubName);
        }
        return Lists.newArrayList();
    }
    @Transactional(readOnly=false)
    public void saveProductDetail(ProductDetail detail){
        productDetailDao.save(detail);
    }
    @Transactional(readOnly=false)
    public void saveProductDetail(List<ProductDetail> details){
        productDetailDao.save(details);
    }
    public ProductDetail readProductDetail(Long id){
        return productDetailDao.findOne(id);
    }
    public List<ProductDetail> listProductDetail(Long productId){
        return productDetailDao.findByProductId(productId);
    }
    public DataTable<Product> pageProduct(DataTable<Product> dt,final Map<String,Object> searchParams){
        Sort.Direction d="asc".equals(dt.getsSortDir_0())?Sort.Direction.ASC:Sort.Direction.DESC;//升降序
        int index=Integer.parseInt(dt.getiSortCol_0());
        String[] column=new String[]{"productCode","productName","productShortName","productBrand","productClass","id"};
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(d,column[index]));
        Page<Product> page=productDao.findAll(new Specification<Product>(){
            @Override public Predicate toPredicate(Root<Product> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
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
                        List<String> brandCodes=listBrandCode(searchParams.get(key).toString().trim());
                        if(brandCodes.size()<=0){
                            brandCodes.add("0");
                        }
                        predicates.add(root.<String>get("productBrand").in(brandCodes));
                    }
                    if(key.contains("LIKE_class")&&StringUtils.isNotEmpty(searchParams.get(key).toString())){
                        List<String> classCodes=listClassCode(searchParams.get(key).toString().trim());
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

    public List<String> listBrandCode(String brandName){
        List<String> list=Lists.newArrayList();
        if(StringUtils.isBlank(brandName)){
            return list;
        }
        List<ProductBrand> brands=brandDao.findLikeBrandCode("%"+brandName+"%");
        if(brands!=null&&brands.size()>0){
            for(ProductBrand brand:brands){
                if(StringUtils.isBlank(brand.getBrandCode())){
                    continue;
                }
                list.add(brand.getBrandCode());
            }
        }
        return list;
    }
    public List<String> listClassCode(String className){
        List<String> list=Lists.newArrayList();
        if(StringUtils.isBlank(className)){
            return list;
        }
        List<ProductClass> classList=classDao.findLikeClassCode("%"+className+"%");
        if(classList!=null&&classList.size()>0){
            for(ProductClass cls:classList){
                if(StringUtils.isBlank(cls.getClassCode())){
                    continue;
                }
                list.add(cls.getClassCode());
            }
        }
        return list;
    }

}
