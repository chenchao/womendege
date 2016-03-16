package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ProductCatalogAttr;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * 商品目录组属性Dao类
 */
@SuppressWarnings("ALL") public interface ProductCatalogAttrDao extends PagingAndSortingRepository<ProductCatalogAttr,Long>, JpaSpecificationExecutor<ProductCatalogAttr>{
    @Query("select s from ProductCatalogAttr s where s.removeTag=0 and s.catalogId=:catalogId and s.catalogAttrName=:catalogAttrName")
    List<ProductCatalogAttr> findByCatalogAttrName(@Param("catalogAttrName") String catalogAttrName,@Param("catalogId") Long catalogId);
    @Query("select s from ProductCatalogAttr s where s.removeTag=0 and s.catalogId=:catalogId order by s.catalogAttrSort asc")
    List<ProductCatalogAttr> findByCatalogId(@Param("catalogId") Long catalogId);
}
