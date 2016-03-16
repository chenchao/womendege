package com.kingnode.xsimple.rest;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;

import com.fasterxml.jackson.databind.JavaType;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.kingnode.diva.mapper.BeanMapper;
import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.dto.user.DeviceRequestDTO;
import com.kingnode.xsimple.dto.user.DeviceResponseDTO;
import com.kingnode.xsimple.dto.user.LogOutRequestDTO;
import com.kingnode.xsimple.dto.user.MobileRegisterDTO;
import com.kingnode.xsimple.dto.user.MobileUserOrgDTO;
import com.kingnode.xsimple.dto.user.ModuleDTO;
import com.kingnode.xsimple.dto.user.RegisterRequestDTO;
import com.kingnode.xsimple.dto.user.VersionRequestDTO;
import com.kingnode.xsimple.dto.user.VersionResponseDTO;
import com.kingnode.xsimple.service.mobile.MobileRestService;
import com.kingnode.xsimple.util.Users;
import com.kingnode.xsimple.util.Utils;
import com.kingnode.xsimple.util.xml.ObjectMapperUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
@RestController @RequestMapping(value="/api/v1/device")
public class MobileDTORestController{
    private static Logger logger=LoggerFactory.getLogger(MobileDTORestController.class);
    @Autowired
    private MobileRestService mobileRestService;
    /**
     * **********
     * 设备注册，获取用户信息，获取工作区
     *
     * @param mrd 设备注册信息
     *
     * @return
     *
     * @throws java.io.IOException
     */
    @RequestMapping(value="user-info", method={RequestMethod.POST})
    public Object UserInfo(MobileRegisterDTO mrd){
        Object obj=null;
        RestStatus status=new RestStatus();
        status.setStatus(false);
        status.setErrorCode(Setting.FAIURESTAT);
        try{
            List<ModuleDTO> clientModuleList=Lists.newArrayList();
            if(!Utils.isEmptyString(mrd.getModules())){
                ObjectMapperUtil mapper=new ObjectMapperUtil();
                JavaType javaType=mapper.getCollectionType(ArrayList.class,ModuleDTO.class);
                clientModuleList=(List<ModuleDTO>)mapper.getMapper().readValue(mrd.getModules().toString(),javaType);
            }
            String xtype=mrd.getXtype();
            //设备注册
            if("mdmRegister".equals(xtype)){
                MobileUserOrgDTO muodto=mobileRestService.MdmRegisterInfo(mrd);
                if(muodto.getStatus()){
                    //获取用户信息,kim信息,云端访问地址
                    muodto=mobileRestService.GetUserInfo(Users.id(),mrd.getKey(),muodto);
                    //工作区（根据模块功能的jsonparm获取用户下的登录用户的模块和功能信息 ）
                    if(muodto.getStatus()){
                        muodto=mobileRestService.GetModuleFunctionByUserId(Users.id(),mrd.getKey(),clientModuleList,muodto,false);
                    }
                }
                obj=muodto;
            }else if("logOut".equals(xtype)){//设备注销
                if(Strings.isNullOrEmpty(mrd.getPlat())){
                    status.setErrorMessage("设备来自的平台为空");
                    obj=status;
                }else if(Strings.isNullOrEmpty(mrd.getToken())){
                    status.setErrorMessage("设备totken为空");
                    obj=status;
                }else{
                    obj=mobileRestService.UpdateKnChannelStat(mrd.getPlat(),mrd.getToken());
                    Subject s=SecurityUtils.getSubject();
                    s.logout();
                }
            }else if("checkVersion".equals(xtype)){//检查版本
                if(Strings.isNullOrEmpty(mrd.getKey())){
                    status.setErrorMessage("应用标识为空");
                    obj=status;
                }else if(Strings.isNullOrEmpty(mrd.getVtype())){
                    status.setErrorMessage("版本的状态为空");
                    obj=status;
                }else if(Strings.isNullOrEmpty(mrd.getPlat())){
                    status.setErrorMessage("设备来自的平台为空");
                    obj=status;
                }else if(Strings.isNullOrEmpty(mrd.getVer())){
                    status.setErrorMessage("应用的版本号为空");
                    obj=status;
                }else{
                    obj=mobileRestService.CheckVersion(mrd.getKey(),mrd.getVtype(),mrd.getPlat(),mrd.getVer());
                }
            }else if("checkDevice".equals(xtype)){
                if(Strings.isNullOrEmpty(mrd.getKey())){
                    status.setErrorMessage("应用的标示为空");
                    obj=status;
                }else if(Strings.isNullOrEmpty(mrd.getToken())){
                    status.setErrorMessage("设备token为空");
                    obj=status;
                }else{
                    obj=mobileRestService.CheckDeviceOnLine(mrd.getKey(),mrd.getToken());
                }
            }else{
                status.setStatus(false);
                status.setErrorCode(Setting.FAIURESTAT);
                status.setErrorMessage("没有相应的请求,请检查后,再请求");
                obj=status;
            }
        }catch(Exception e){
            e.printStackTrace();
            status.setStatus(false);
            status.setErrorCode(Setting.FAIURESTAT);
            status.setErrorMessage("后台异常,稍后尝试");
            obj=status;
        }finally{
            return obj;
        }
    }
    /**
     * ***
     * 注册
     *
     * @param mrd
     *
     * @return
     */
    @RequestMapping(value="register", method={RequestMethod.POST})
    public Object RegisterInfo(RegisterRequestDTO mrd){
        Object obj=null;
        RestStatus status=new RestStatus();
        try{
            List<ModuleDTO> clientModuleList=Lists.newArrayList();
            if(!Utils.isEmptyString(mrd.getModules())){
                ObjectMapperUtil mapper=new ObjectMapperUtil();
                JavaType javaType=mapper.getCollectionType(ArrayList.class,ModuleDTO.class);
                clientModuleList=(List<ModuleDTO>)mapper.getMapper().readValue(mrd.getModules().toString(),javaType);
            }
            //设备注册
            MobileRegisterDTO registerDTO=BeanMapper.map(mrd,MobileRegisterDTO.class);
            MobileUserOrgDTO muodto=mobileRestService.MdmRegisterInfo(registerDTO);
            if(muodto.getStatus()){
                //获取用户信息,kim信息,云端访问地址
                muodto=mobileRestService.GetUserInfo(Users.id(),mrd.getKey(),muodto);
                //工作区（根据模块功能的jsonparm获取用户下的登录用户的模块和功能信息 ）
                if(muodto.getStatus()){
                    muodto=mobileRestService.GetModuleFunctionByUserId(Users.id(),mrd.getKey(),clientModuleList,muodto,false);
                }
            }
            obj=muodto;
        }catch(Exception e){
            status.setStatus(false);
            status.setErrorCode(Setting.FAIURESTAT);
            status.setErrorMessage("后台异常,稍后尝试");
            logger.error("注册设备异常:{}",e);
            obj=status;
        }finally{
            return obj;
        }
    }
    /**
     * *
     * 注销登录
     *
     * @param requestDTO
     *
     * @return
     */
    @RequestMapping(value="logout", method={RequestMethod.POST})
    public RestStatus LogOut(@Valid LogOutRequestDTO requestDTO){
        RestStatus obj=mobileRestService.UpdateKnChannelStat(requestDTO.getPlat(),requestDTO.getToken());
        Subject s=SecurityUtils.getSubject();
        s.logout();
        return obj;
    }
    /**
     * ******
     * 检测版本信息
     *
     * @param requestDTO
     *
     * @return
     */
    @RequestMapping(value="check-version", method={RequestMethod.POST})
    public VersionResponseDTO CheckVersion(@Valid VersionRequestDTO requestDTO){
        return mobileRestService.CheckVersion(requestDTO.getKey(),requestDTO.getPlat(),requestDTO.getVtype(),requestDTO.getVer());
    }
    /**
     * **************
     * 检查设备是否在线
     *
     * @param requestDTO
     *
     * @return
     */
    @RequestMapping(value="check-device", method={RequestMethod.POST})
    public DeviceResponseDTO CheckDeviceOnLine(@Valid DeviceRequestDTO requestDTO){
        return mobileRestService.CheckDeviceOnLine(requestDTO.getKey(),requestDTO.getToken());
    }
}
