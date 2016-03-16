package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ProductClass;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * 商品分类Dao类
 */
@SuppressWarnings("ALL") public interface ProductClassDao extends PagingAndSortingRepository<ProductClass,Long>, JpaSpecificationExecutor<ProductClass>{
    @Query("select s from ProductClass s where s.removeTag=0 and s.parentClass=:parentClass") List<ProductClass> findByParentClass(@Param("parentClass") String parentClass);
    @Query("select s from ProductClass s where s.removeTag=0 and s.classCode=:classCode") List<ProductClass> findByClassCode(@Param("classCode") String classCode);
    @Query("select s from ProductClass s where s.removeTag=0 and s.className=:className") List<ProductClass> findByClassName(@Param("className") String className);
    @Query("select s from ProductClass s where s.removeTag=0 and s.path like:path") List<ProductClass> listProductClassLikePath(@Param("path") String path);
}
