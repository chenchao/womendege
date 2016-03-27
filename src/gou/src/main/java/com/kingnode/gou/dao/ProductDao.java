package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.Product;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * 商品Dao类
 */
@SuppressWarnings("ALL")
public interface ProductDao extends PagingAndSortingRepository<Product,Long>, JpaSpecificationExecutor<Product>{
    @Query("select s from Product s where s.removeTag=0 and s.productCode=:productCode")
    List<Product> findByProductCode(@Param("productCode") String productCode);
    @Query("select s from Product s where s.removeTag=0 and s.productName=:productName")
    List<Product> findByProductName(@Param("productName") String productName);
}
