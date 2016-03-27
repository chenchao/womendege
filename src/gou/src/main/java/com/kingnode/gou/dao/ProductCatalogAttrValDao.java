package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ProductCatalogAttrVal;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * 商品目录组属性值Dao类
 */
@SuppressWarnings("ALL")
public interface ProductCatalogAttrValDao extends PagingAndSortingRepository<ProductCatalogAttrVal,Long>, JpaSpecificationExecutor<ProductCatalogAttrVal>{
    @Query("select s from ProductCatalogAttrVal s where s.removeTag=0 and s.productId=:productId and s.catalogId=:catalogId")
    List<ProductCatalogAttrVal> findByProductIdAndCatalogId(@Param("productId") Long productId,@Param("catalogId") Long catalogId);
    @Query("select s from ProductCatalogAttrVal s where s.removeTag=0 and s.productSubId=:productSubId and s.catalogId=:catalogId")
    List<ProductCatalogAttrVal> findByProductSubIdAndCatalogId(@Param("productSubId") Long productSubId,@Param("catalogId") Long catalogId);
}
