package com.kingnode.gou.dao;
import com.kingnode.gou.entity.OrderHead;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@SuppressWarnings("ALL")
public interface OrderHeadDao extends PagingAndSortingRepository<OrderHead,Long>, JpaSpecificationExecutor<OrderHead>{
    OrderHead findByOrderHeadNo(String orderNo);
}
