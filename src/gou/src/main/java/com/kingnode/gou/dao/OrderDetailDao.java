package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@SuppressWarnings("ALL")
public interface OrderDetailDao extends PagingAndSortingRepository<OrderDetail,Long>, JpaSpecificationExecutor<OrderDetail>{
    List<OrderDetail> findByOrderNo(String orderNo);
}
