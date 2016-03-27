package com.kingnode.gou.rest;
import java.util.List;

import com.kingnode.gou.dto.ProductDto;
import com.kingnode.gou.entity.Address;
import com.kingnode.gou.entity.Collection;
import com.kingnode.gou.entity.Footprint;
import com.kingnode.gou.service.CustomerService;
import com.kingnode.xsimple.rest.ListDTO;
import com.kingnode.xsimple.rest.RestStatus;
import com.kingnode.xsimple.util.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController @RequestMapping("/api/v1/customer") public class CustomerRest{
    @Autowired private CustomerService customerService;
    /**
     * 获取活动商品
     *
     * @return
     */
    @RequestMapping(value="/addresses", method={RequestMethod.GET}) public ListDTO<Address> getAddresses(){
        List<Address> list=customerService.getAddresses(Users.id());
        return new ListDTO<>(true,list);
    }
    @RequestMapping(value="/address", method={RequestMethod.POST}) public RestStatus saveAddress(Address address){
        customerService.saveAddress(address);
        return new RestStatus(true);
    }
    @RequestMapping(value="/address/delete", method={RequestMethod.POST}) public RestStatus deleteAddress(@RequestParam(value="id")long id){
        customerService.deleteAddress(id);
        return new RestStatus(true);
    }
    @RequestMapping(value="/info", method={RequestMethod.POST})
    public RestStatus saveInfo(@RequestParam(value="babyBirthday") String babyBirthday,@RequestParam(value="babySex") String babySex,@RequestParam(value="nickName") String nickName){
        customerService.updateInfo(Users.id(),babyBirthday,babySex,nickName);
        return new RestStatus(true);
    }
    @RequestMapping(value="/collection", method={RequestMethod.POST}) public RestStatus saveCollection(@RequestParam(value="productId") long productId){
        customerService.saveCollection(productId,Users.id());
        return new RestStatus(true);
    }
    @RequestMapping(value="/collection/products", method={RequestMethod.GET})
    public ListDTO<Collection> getCollectionProducts(@RequestParam(value="p", defaultValue="0") Integer pageNo,@RequestParam(value="s", defaultValue="10") Integer pageSize){
        List<Collection> list=customerService.getCollections(Users.id(),pageNo,pageSize);
        return new ListDTO<>(true,list);
    }
    @RequestMapping(value="/footprint/products", method={RequestMethod.GET})
    public ListDTO<Footprint> getFootprintProducts(@RequestParam(value="p", defaultValue="0") Integer pageNo,@RequestParam(value="s", defaultValue="10") Integer pageSize){
        List<Footprint> list=customerService.getFootprints(Users.id(),pageNo,pageSize);
        return new ListDTO<>(true,list);
    }
}
