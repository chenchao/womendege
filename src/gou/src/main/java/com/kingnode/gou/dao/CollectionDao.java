package com.kingnode.gou.dao;
import java.util.List;

import com.kingnode.gou.entity.Collection;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author ouyangshenguang@kingnode.com (segry ouyang)
 */
@SuppressWarnings("ALL")
public interface CollectionDao extends PagingAndSortingRepository<Collection,Long>, JpaSpecificationExecutor<Collection>{
    @Query("select u from Collection u where u.customerId=?1")
    public List<Collection> findCollections(long customerId);
//    @Query("select u from Collection u where u.phone=?1")
//    List<Collection> findCustomerByPhone(String phone);
//
//    @Query("select u from Collection u where u.phone=?1 and u.id <> ?2")
//    List<Collection> queryCustomerByPhoneAndId(String phone,Long id);
//
//    List<Collection> queryCustomerList(Long userId,String pw,Integer p,Integer s);
//    List<Collection> customerIdDetail(Long customerId,Long userId);
//    @Query("select u from Collection u where u.id=?1")
//    Collection queryCustomerById(Long id);

}
