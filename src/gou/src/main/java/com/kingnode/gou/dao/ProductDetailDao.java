package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ProductDetail;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * 商品详情(子商品)Dao类
 */
@SuppressWarnings("ALL")
public interface ProductDetailDao extends PagingAndSortingRepository<ProductDetail,Long>, JpaSpecificationExecutor<ProductDetail>{
    @Query("select s from ProductDetail s where s.removeTag=0 and s.productSubCode=:productSubCode")
    List<ProductDetail> findByProductSubCode(@Param("productSubCode") String productSubCode);
    @Query("select s from ProductDetail s where s.removeTag=0 and s.productSubName=:productSubName")
    List<ProductDetail> findByProductSubName(@Param("productSubName") String productSubName);
    @Query("select s from ProductDetail s where s.removeTag=0 and s.productId=:productId")
    List<ProductDetail> findByProductId(@Param("productId") Long productId);
}
