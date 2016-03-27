package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.ActivityPosition;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
@SuppressWarnings("ALL") public interface ActivityPositionDao extends PagingAndSortingRepository<ActivityPosition,Long>, JpaSpecificationExecutor<ActivityPosition>{
    @Query("select u  from ActivityPosition u where u.activity.activityCode =?1 and u.position.code =?2") List<ActivityPosition> queryActivityPosition(String activityCode,String positionCode);
    @Query("select u  from ActivityPosition u where u.activity.id =?1")
    public List<ActivityPosition> findActivityPositions(long activityId);
    //    @Query("select a from KnSalseActive a, KnActiveScope b where  a.id=b.activeId and  b.shopId=?1 group by b.activeId ") List<Activity> queryKnSalseActive(Long shopId);
    //    @Query("select a from KnSalseActive a, KnActiveScope b where  a.id=b.activeId and  b.shopId in (?1) group by b.activeId ") List<Activity> queryKnSalseActive(List<Long> list);
}
