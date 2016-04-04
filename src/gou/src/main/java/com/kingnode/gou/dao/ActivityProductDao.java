package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ActivityProduct;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
@SuppressWarnings("ALL") public interface ActivityProductDao extends PagingAndSortingRepository<ActivityProduct,Long>, JpaSpecificationExecutor<ActivityProduct>{
    @Query("select u  from ActivityProduct u where u.activity.id=?1") List<ActivityProduct> findActivityProduct(Long activityId);
    //    @Query("select a from KnSalseActive a, KnActiveScope b where  a.id=b.activeId and  b.shopId=?1 group by b.activeId ") List<Activity> queryKnSalseActive(Long shopId);
    //    @Query("select a from KnSalseActive a, KnActiveScope b where  a.id=b.activeId and  b.shopId in (?1) group by b.activeId ") List<Activity> queryKnSalseActive(List<Long> list);
}
