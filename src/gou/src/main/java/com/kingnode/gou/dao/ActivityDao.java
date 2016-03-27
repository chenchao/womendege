package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.Activity;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
@SuppressWarnings("ALL") public interface ActivityDao extends PagingAndSortingRepository<Activity,Long>, JpaSpecificationExecutor<Activity>{
//    @Query("select u  from KnSalseActive u ") List<Activity> queryKnSalseActive();
//    @Query("select a from KnSalseActive a, KnActiveScope b where  a.id=b.activeId and  b.shopId=?1 group by b.activeId ") List<Activity> queryKnSalseActive(Long shopId);
//    @Query("select a from KnSalseActive a, KnActiveScope b where  a.id=b.activeId and  b.shopId in (?1) group by b.activeId ") List<Activity> queryKnSalseActive(List<Long> list);
}
