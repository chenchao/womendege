package com.kingnode.gou.dao;
import com.kingnode.gou.entity.OrderReturnDetail;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@SuppressWarnings("ALL")
public interface OrderReturnDetailDao extends PagingAndSortingRepository<OrderReturnDetail,Long>, JpaSpecificationExecutor<OrderReturnDetail>{
}
