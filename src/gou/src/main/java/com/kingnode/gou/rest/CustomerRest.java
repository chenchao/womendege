package com.kingnode.gou.rest;
import java.io.File;
import java.util.List;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
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
import com.kingnode.xsimple.util.PathUtil;
import com.kingnode.xsimple.util.Users;
import com.kingnode.xsimple.util.file.FileUtil;
import com.kingnode.xsimple.util.message.SendPhoneMsg;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
@RestController @RequestMapping("/api/customer") public class CustomerRest{
    private static Logger logger=LoggerFactory.getLogger(CustomerRest.class);
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
    public RestStatus saveInfo(@RequestParam(value="babyBirthday") String babyBirthday,@RequestParam(value="babySex") String babySex,@RequestParam(value="sex",required=false) String sex,@RequestParam(value="nickName") String nickName,@RequestParam("imageFile") String imageFile){
        String imagePath=PathUtil.getRootPath()+Setting.BASEADDRESS;
        File savedir=new File(imagePath);
        if(!savedir.exists()){
            savedir.mkdirs();
        }
        String newImage=imageFile.replaceAll(" ","+");
        long name=DateTime.now().getMillis();
        FileUtil.getInstance().saveFileToDisk(newImage,imagePath+"/"+name+".jpg");
        String path=Setting.BASEADDRESS+"/"+name+".jpg";
        customerService.updateInfo(Users.id(),babyBirthday,babySex,sex,nickName,path);
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
//            List<KnDownloadVersionInfo> list=knDownloadVersionInfoDao.findCode(loginName,authCode);
//            if(list.isEmpty()){
//                return new RestStatus(false,"400","验证码无效");
//            }
//            KnDownloadVersionInfo info=list.get(0);
//            if(info.getOutTime()<System.currentTimeMillis()){
//                return new RestStatus(false,"400","验证码已过期");
//            }
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

    private String GetImageAddressByFile(MultipartFile file) throws Exception{
        StringBuffer imageAddress=new StringBuffer();
        try{
            if(null!=file&&!file.isEmpty()){
                throw new RuntimeException("文件不能为空");
            }
            WebApplicationContext webApplicationContext=ContextLoader.getCurrentWebApplicationContext();
            String fileExt=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1).toLowerCase();//扩展名
            if(!validateSuffix(fileExt)){
                throw new RuntimeException("格式错误");
            }
            if(!Strings.isNullOrEmpty(fileExt)){
                Long currentTime=System.currentTimeMillis();
                String filePath=Setting.BASEADDRESS+"/"+currentTime, backPath=filePath+"."+fileExt; //安装包存放路径前缀  没有后缀名
                File localFile=new File(webApplicationContext.getServletContext().getRealPath(backPath));
                if(!localFile.getParentFile().exists()){
                    localFile.getParentFile().mkdirs();
                }
                file.transferTo(localFile);
                imageAddress.append(backPath);
            }
        }catch(Exception e){
            logger.info("上传图片文件存储的路径 错误信息：{}",e);
        }
        return imageAddress.toString();
    }
    private boolean validateSuffix(String suffix){
        String[] suffixs=new String[]{"BMP","JPG","JPEG","PNG","GIF"};
        if(Lists.newArrayList(suffixs).contains(suffix.toUpperCase())){
            return true;
        }
        return false;
    }
}
