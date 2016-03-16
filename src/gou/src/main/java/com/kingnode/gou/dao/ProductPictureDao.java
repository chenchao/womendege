package com.kingnode.gou.dao;
import com.kingnode.gou.entity.ProductPicture;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * 商品图片Dao类
 */
public interface ProductPictureDao extends PagingAndSortingRepository<ProductPicture,Long>, JpaSpecificationExecutor<ProductPicture>{
}
