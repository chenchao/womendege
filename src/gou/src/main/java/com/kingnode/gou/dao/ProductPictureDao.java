package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ProductPicture;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * 商品图片Dao类
 */
@SuppressWarnings("ALL")
public interface ProductPictureDao extends PagingAndSortingRepository<ProductPicture,Long>, JpaSpecificationExecutor<ProductPicture>{
    @Query("select s from ProductPicture s where s.removeTag=0 and s.productId=:productId and s.productType=:productType order by s.pictureSort asc")
    List<ProductPicture> findByProductIdAndType(@Param("productId") Long productId,@Param("productType") String productType);
}
