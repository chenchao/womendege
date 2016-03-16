package com.kingnode.gou.dao;
import com.kingnode.gou.entity.Product;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * 商品Dao类
 */
public interface ProductDao extends PagingAndSortingRepository<Product,Long>, JpaSpecificationExecutor<Product>{
}
