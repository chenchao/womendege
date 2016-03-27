package com.kingnode.gou.service;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.google.common.collect.Lists;
import com.kingnode.gou.dao.AddressDao;
import com.kingnode.gou.dao.CollectionDao;
import com.kingnode.gou.dao.CustomerDao;
import com.kingnode.gou.dao.FootprintDao;
import com.kingnode.gou.entity.Activity;
import com.kingnode.gou.entity.Address;
import com.kingnode.gou.entity.Collection;
import com.kingnode.gou.entity.Customer;
import com.kingnode.gou.entity.Footprint;
import com.kingnode.gou.entity.ProductCatalog;
import com.kingnode.xsimple.api.common.DataTable;
import com.kingnode.xsimple.util.dete.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service @Transactional(readOnly=true) public class CustomerService{
    @Autowired private CustomerDao customerDao;
    @Autowired private AddressDao addressDao;
    @Autowired private CollectionDao collectionDao;
    @Autowired private FootprintDao footprintDao;
    public Customer readCustomer(long id){
        return customerDao.findOne(id);
    }
    public void updateInfo(long customerId,String babyBirthday,String babySex,String nickName){
        Customer customer=customerDao.findOne(customerId);
        customer.setBabyBirthday(DateUtil.getDate(babyBirthday));
        customer.setBabySex(Customer.Gender.valueOf(babySex));
        customer.setNickName(nickName);
        customerDao.save(customer);
    }
    public List<Address> getAddresses(long customerId){
        return addressDao.findAddress(customerId);
    }
    public void saveAddress(Address address){
        if(address.getId()==null){
            addressDao.save(address);
        }else{
            Address oldAddress=addressDao.findOne(address.getId());
            oldAddress.setAddress(address.getAddress());
            oldAddress.setAddressee(address.getAddressee());
            oldAddress.setPhone(address.getPhone());
            oldAddress.setZipCode(address.getZipCode());
            addressDao.save(oldAddress);
        }
    }
    public void deleteAddress(long id){
        addressDao.delete(id);
    }
    public void saveCollection(long productId,long customerId){
        Collection collection=new Collection(customerId,productId);
        collectionDao.save(collection);
    }
    public List<Collection> getCollections(final long customerId,Integer pageNo,Integer pageSize){
        PageRequest pageRequest=new PageRequest(pageNo,pageSize,new Sort(Sort.Direction.DESC,"createTime"));
        Page<Collection> page=collectionDao.findAll(new Specification<Collection>(){
            @Override public Predicate toPredicate(Root<Collection> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                return cb.equal(root.<Long>get("customerId"),customerId);
            }
        },pageRequest);
        return page.getContent();
    }
    public void saveFootprint(Footprint footprint){
        footprintDao.save(footprint);
    }
    public List<Footprint> getFootprints(final long customerId,Integer pageNo,Integer pageSize){
        PageRequest pageRequest=new PageRequest(pageNo,pageSize,new Sort(Sort.Direction.DESC,"createTime"));
        Page<Footprint> page=footprintDao.findAll(new Specification<Footprint>(){
            @Override public Predicate toPredicate(Root<Footprint> root,CriteriaQuery<?> query,CriteriaBuilder cb){
                return cb.equal(root.<Long>get("customerId"),customerId);
            }
        },pageRequest);
        return page.getContent();
    }
    public DataTable<Customer> PageCustomers(final Map<String,Object> searchParams,DataTable<Customer> dt){
        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),new Sort(Sort.Direction.DESC,"id"));
        Specification<Customer> spec=new Specification<Customer>(){
            @Override public Predicate toPredicate(Root<Customer> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                if(searchParams.get("loginName")!=null && !"".equals(searchParams.get("loginName")) ){
                    predicates.add(cb.equal(root.<String>get("loginName"),"%"+searchParams.get("loginName")+"%"));
                }
                if(searchParams.get("userName")!=null && !"".equals(searchParams.get("userName")) ){
                    predicates.add(cb.equal(root.<String>get("userName"),"%"+searchParams.get("userName")+"%"));
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        Page<Customer> page=customerDao.findAll(spec,pageRequest);
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }
}
