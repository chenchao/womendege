package com.kingnode.gou.dao;
import com.kingnode.gou.entity.ProductDetail;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * 商品详情(子商品)Dao类
 */
public interface ProductDetailDao extends PagingAndSortingRepository<ProductDetail,Long>, JpaSpecificationExecutor<ProductDetail>{
}
