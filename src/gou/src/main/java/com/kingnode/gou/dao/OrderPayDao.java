package com.kingnode.gou.dao;
import com.kingnode.gou.entity.OrderPay;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@SuppressWarnings("ALL")
public interface OrderPayDao extends PagingAndSortingRepository<OrderPay,Long>, JpaSpecificationExecutor<OrderPay>{
}
