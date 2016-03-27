package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ProductBrand;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * 商品Dao类
 */
@SuppressWarnings("ALL") public interface ProductBrandDao extends PagingAndSortingRepository<ProductBrand,Long>, JpaSpecificationExecutor<ProductBrand>{
    @Query("select s from ProductBrand s where s.removeTag=0 and s.brandName=:brandName") List<ProductBrand> findByBrandName(@Param("brandName") String brandName);
    @Query("select s from ProductBrand s where s.removeTag=0 and s.brandCode=:brandCode") List<ProductBrand> findByBrandCode(@Param("brandCode") String brandCode);
    @Query("select s from ProductBrand s where s.removeTag=0 and s.brandName like:brandName")
    List<ProductBrand> findLikeBrandCode(@Param("brandName") String brandName);
}
