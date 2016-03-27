package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.Footprint;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author ouyangshenguang@kingnode.com (segry ouyang)
 */
@SuppressWarnings("ALL") public interface FootprintDao extends PagingAndSortingRepository<Footprint,Long>, JpaSpecificationExecutor<Footprint>{
    @Query("select u from Footprint u where u.customerId=?1")
    public List<Footprint> findFootprints(long customerId);
//    @Query("select u from Footprint u where u.phone=?1") List<Footprint> findFootprintByPhone(String phone);
//    @Query("select u from Footprint u where u.phone=?1 and u.id <> ?2") List<Footprint> queryFootprintByPhoneAndId(String phone,Long id);
//    List<Footprint> queryFootprintList(Long userId,String pw,Integer p,Integer s);
//    List<Footprint> FootprintIdDetail(Long FootprintId,Long userId);
//    @Query("select u from Footprint u where u.id=?1") Footprint queryFootprintById(Long id);
}
