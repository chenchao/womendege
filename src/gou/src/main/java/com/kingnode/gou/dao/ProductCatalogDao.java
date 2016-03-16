package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ProductCatalog;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * 商品目录组Dao类
 */
@SuppressWarnings("ALL") public interface ProductCatalogDao extends PagingAndSortingRepository<ProductCatalog,Long>, JpaSpecificationExecutor<ProductCatalog>{
    @Query("select s from ProductCatalog s where s.removeTag=0 and s.catalogName=:catalogName") List<ProductCatalog> findByCatalogName(@Param("catalogName") String catalogName);
}
