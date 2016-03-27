package com.kingnode.gou.dao;
import com.kingnode.gou.entity.Activity;
import com.kingnode.gou.entity.ActivityProductView;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
@SuppressWarnings("ALL") public interface ActivityProductViewDao extends PagingAndSortingRepository<ActivityProductView,Long>, JpaSpecificationExecutor<ActivityProductView>{
//    @Query("select u  from KnSalseActive u ") List<Activity> queryKnSalseActive();
//    @Query("select a from KnSalseActive a, KnActiveScope b where  a.id=b.activeId and  b.shopId=?1 group by b.activeId ") List<Activity> queryKnSalseActive(Long shopId);
//    @Query("select a from KnSalseActive a, KnActiveScope b where  a.id=b.activeId and  b.shopId in (?1) group by b.activeId ") List<Activity> queryKnSalseActive(List<Long> list);
}
