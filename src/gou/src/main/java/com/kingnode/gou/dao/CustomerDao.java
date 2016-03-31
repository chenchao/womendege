package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.Customer;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author ouyangshenguang@kingnode.com (segry ouyang)
 */
@SuppressWarnings("ALL") public interface CustomerDao extends PagingAndSortingRepository<Customer,Long>, JpaSpecificationExecutor<Customer>{
    @Query("select u from Customer u where u.phone=?1")
    List<Customer> findCustomerByPhone(String phone);
//    @Query("select u from Customer u where u.phone=?1 and u.id <> ?2")
//    List<Customer> queryCustomerByPhoneAndId(String phone,Long id);
//    List<Customer> queryCustomerList(Long userId,String pw,Integer p,Integer s);
//    List<Customer> customerIdDetail(Long customerId,Long userId);
//    @Query("select u from Customer u where u.id=?1") Customer queryCustomerById(Long id);
}
