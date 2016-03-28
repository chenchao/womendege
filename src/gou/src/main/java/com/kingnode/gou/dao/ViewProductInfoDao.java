package com.kingnode.gou.dao;
import com.kingnode.gou.entity.ViewProductInfo;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author 58120775@qq.com (chenchao)
 */
public interface ViewProductInfoDao extends PagingAndSortingRepository<ViewProductInfo,Long>, JpaSpecificationExecutor<ViewProductInfo>{
    ViewProductInfo findByProductId(Long productId);
}
