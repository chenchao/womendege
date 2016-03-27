package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.Address;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author ouyangshenguang@kingnode.com (segry ouyang)
 */
@SuppressWarnings("ALL") public interface AddressDao extends PagingAndSortingRepository<Address,Long>, JpaSpecificationExecutor<Address>{
    @Query("select u from Address u where u.userId=?1") List<Address> findAddress(long customerId);
//
//
//
//    @Query("select u from Address u where u.phone=?1 and u.id <> ?2") List<Address> queryCustomerByPhoneAndId(String phone,Long id);
//    List<Address> queryCustomerList(Long userId,String pw,Integer p,Integer s);
//    List<Address> customerIdDetail(Long customerId,Long userId);
//    @Query("select u from Address u where u.id=?1") Address queryCustomerById(Long id);
}
