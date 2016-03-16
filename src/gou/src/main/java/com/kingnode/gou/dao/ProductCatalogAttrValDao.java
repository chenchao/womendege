package com.kingnode.gou.dao;
import com.kingnode.gou.entity.ProductCatalogAttrVal;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * 商品目录组属性值Dao类
 */
public interface ProductCatalogAttrValDao extends PagingAndSortingRepository<ProductCatalogAttrVal,Long>, JpaSpecificationExecutor<ProductCatalogAttrVal>{
}
