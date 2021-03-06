package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ShoppCart;
import com.kingnode.xsimple.entity.IdEntity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@SuppressWarnings("ALL")
public interface ShoppCartDao extends PagingAndSortingRepository<ShoppCart,Long>, JpaSpecificationExecutor<ShoppCart>{
    List<ShoppCart> findByUserIdAndProductIdAndStatus(Long userId,Long productId,IdEntity.ActiveType status);
}
