package com.kingnode.gou.rest;
import java.util.List;

import com.kingnode.diva.security.utils.Digests;
import com.kingnode.diva.utils.Encodes;
import com.kingnode.gou.entity.Address;
import com.kingnode.gou.entity.Collection;
import com.kingnode.gou.entity.Customer;
import com.kingnode.gou.entity.Footprint;
import com.kingnode.gou.service.CustomerService;
import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.dao.application.KnDownloadVersionInfoDao;
import com.kingnode.xsimple.entity.IdEntity;
import com.kingnode.xsimple.entity.application.KnDownloadVersionInfo;
import com.kingnode.xsimple.entity.system.KnUser;
import com.kingnode.xsimple.rest.DetailDTO;
import com.kingnode.xsimple.rest.ListDTO;
import com.kingnode.xsimple.rest.RestStatus;
import com.kingnode.xsimple.service.system.ResourceService;
import com.kingnode.xsimple.util.MSM.SMSUtil;
import com.kingnode.xsimple.util.Users;
import com.kingnode.xsimple.util.message.SendPhoneMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
@RestController @RequestMapping("/api/customer") public class CustomerRest{
    @Autowired private CustomerService customerService;
    @Autowired private KnDownloadVersionInfoDao knDownloadVersionInfoDao;
    @Autowired private ResourceService resourceService;

    @ResponseBody @RequestMapping(value="/addresses", method={RequestMethod.GET}) public ListDTO<Address> getAddresses(){
        List<Address> list=customerService.getAddresses(Users.id());
        return new ListDTO<>(true,list);
    }
    @ResponseBody @RequestMapping(value="/address", method={RequestMethod.POST}) public RestStatus saveAddress(Address address){
        try{
            customerService.saveAddress(address);
        }catch(Exception e){
            e.printStackTrace();
            return new RestStatus(false,"500","操作失败");
        }
        return new RestStatus(true);
    }
    @ResponseBody @RequestMapping(value="/address/delete", method={RequestMethod.POST}) public RestStatus deleteAddress(@RequestParam(value="id") long id){
        try{
            customerService.deleteAddress(id);
        }catch(Exception e){
            e.printStackTrace();
            return new RestStatus(false,"500","操作失败");
        }
        return new RestStatus(true);
    }
    @ResponseBody @RequestMapping(value="/info", method={RequestMethod.POST})
    public RestStatus saveInfo(@RequestParam(value="babyBirthday") String babyBirthday,@RequestParam(value="babySex") String babySex,@RequestParam(value="sex") String sex,@RequestParam(value="nickName") String nickName,@RequestParam(value="imageAddress") String imageAddress){
        customerService.updateInfo(Users.id(),babyBirthday,babySex,sex,nickName,imageAddress);
        return new RestStatus(true);
    }
    @ResponseBody @RequestMapping(value="/collection", method={RequestMethod.POST}) public RestStatus saveCollection(@RequestParam(value="productId") long productId){
        customerService.saveCollection(productId,Users.id());
        return new RestStatus(true);
    }
    @ResponseBody @RequestMapping(value="/collection/products", method={RequestMethod.GET})
    public ListDTO<Collection> getCollectionProducts(@RequestParam(value="p", defaultValue="0") Integer pageNo,@RequestParam(value="s", defaultValue="10") Integer pageSize){
        List<Collection> list=customerService.getCollections(Users.id(),pageNo,pageSize);
        return new ListDTO<>(true,list);
    }
    @ResponseBody @RequestMapping(value="/collection/delete", method={RequestMethod.POST}) public RestStatus deleteCollection(@RequestParam(value="id") long id){
        try{
            customerService.deleteCollection(id);
        }catch(Exception e){
            e.printStackTrace();
            return new RestStatus(false,"500","操作失败");
        }
        return new RestStatus(true);
    }
    @ResponseBody @RequestMapping(value="/collection/clear", method={RequestMethod.POST}) public RestStatus clearCollection(){
        try{
            customerService.clearCollection(Users.id());
        }catch(Exception e){
            e.printStackTrace();
            return new RestStatus(false,"500","操作失败");
        }
        return new RestStatus(true);
    }
    @ResponseBody @RequestMapping(value="/footprint/products", method={RequestMethod.GET})
    public ListDTO<Footprint> getFootprintProducts(@RequestParam(value="p", defaultValue="0") Integer pageNo,@RequestParam(value="s", defaultValue="10") Integer pageSize){
        List<Footprint> list=customerService.getFootprints(Users.id(),pageNo,pageSize);
        return new ListDTO<>(true,list);
    }
    @ResponseBody @RequestMapping(value="/register", method=RequestMethod.POST)
    public RestStatus register(@RequestParam(value="loginName") String loginName,@RequestParam(value="authCode") String authCode,@RequestParam(value="password") String password){
        try{
            Customer c=customerService.readByPhone(loginName);
            if(c!=null){
                return new RestStatus(false,"400","手机号码已被注册");
            }
            List<KnDownloadVersionInfo> list=knDownloadVersionInfoDao.findCode(loginName,authCode);
            if(list.isEmpty()){
                return new RestStatus(false,"400","验证码无效");
            }
            KnDownloadVersionInfo info=list.get(0);
            if(info.getOutTime()<System.currentTimeMillis()){
                return new RestStatus(false,"400","验证码已过期");
            }
            KnUser user=new KnUser();
            user.setLoginName(loginName);
            user.setPassword(password);
            user.setPlainPassword(password);
            user.setSalt(Encodes.encodeHex(Digests.generateSalt(ResourceService.SALT_SIZE)));
            user.setStatus(IdEntity.ActiveType.ENABLE);
            Customer customer=new Customer();
            customer.setLoginName(loginName);
            customer.setPhone(loginName);
            customerService.register(user,customer);
        }catch(Exception e){
            e.printStackTrace();
            return new DetailDTO(false,"注册失败");
        }
        return new DetailDTO(true);
    }
    @ResponseBody @RequestMapping(value="/setPassword", method=RequestMethod.POST)
    public RestStatus setPassword(@RequestParam(value="loginName") String loginName,@RequestParam(value="authCode") String authCode,@RequestParam(value="newPassword") String newPassword){
        List<KnDownloadVersionInfo> list=knDownloadVersionInfoDao.findCode(loginName,authCode);
        if(list.isEmpty()){
            return new RestStatus(false,"400","验证码无效");
        }
        KnDownloadVersionInfo info=list.get(0);
        if(info.getOutTime()<System.currentTimeMillis()){
            return new RestStatus(false,"400","验证码已过期");
        }
        try{
            resourceService.ChangePwd(loginName,newPassword);
        }catch(Exception e){
            return new RestStatus(false,"500","系统异常");
        }
        return new DetailDTO(true);
    }
    @ResponseBody @RequestMapping(value="/auth-code", method=RequestMethod.GET) public RestStatus sendAuthCode(@RequestParam(value="loginName") String loginName){
        try{
            Customer customer=customerService.readByPhone(loginName);
            if(customer!=null){
                return new RestStatus(false,"400","手机号码已被注册");
            }
            int code=createAuthCode();
            KnDownloadVersionInfo dvi=new KnDownloadVersionInfo();
            dvi.setCodeNum(code+"");
            dvi.setPhoneNum(loginName);
            dvi.setOutTime(System.currentTimeMillis()+SendPhoneMsg.codeValid);
            dvi.setLikeStatus(Setting.LikeStatusType.codeNum);
            knDownloadVersionInfoDao.save(dvi);
            SMSUtil.getInstall().sendAuthCode(loginName,code+"");
        }catch(Exception e){
            e.printStackTrace();
            return new DetailDTO(false,"发送失败");
        }
        return new DetailDTO(true);
    }
    private int createAuthCode(){
        return 1+(int)(Math.random()*9999);
    }
}
