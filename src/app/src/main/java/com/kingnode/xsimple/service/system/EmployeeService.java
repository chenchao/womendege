package com.kingnode.xsimple.service.system;
import java.io.File;

import com.google.common.base.Strings;
import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.dao.system.KnEmployeeDao;
import com.kingnode.xsimple.dao.system.KnUserDao;
import com.kingnode.xsimple.dto.FullEmployeeDTO;
import com.kingnode.xsimple.entity.system.KnEmployee;
import com.kingnode.xsimple.entity.system.KnUser;
import com.kingnode.xsimple.rest.DetailDTO;
import com.kingnode.xsimple.rest.RestStatus;
import com.kingnode.xsimple.util.PathUtil;
import com.kingnode.xsimple.util.file.FileUtil;
import com.kingnode.xsimple.util.key.XsimpleUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
/**
 * 用户操作的service
 * @author cici
 */
@Component @Transactional(readOnly=true)
public class EmployeeService{
    private KnEmployeeDao employeeDao;
    private KnUserDao userDao;
    @Autowired
    public void setEmployeeDao(KnEmployeeDao employeeDao){
        this.employeeDao=employeeDao;
    }
    @Autowired
    public void setUserDao(KnUserDao userDao){
        this.userDao=userDao;
    }
    /**
     * 根据用户的主键id更新用户的信息
     * @param fullEmployeeDTO
     * @param id
     * @return
     */
    @Transactional(readOnly=false)
    public DetailDTO UpdateUserInfo(FullEmployeeDTO fullEmployeeDTO,Long id){
        KnEmployee emp = employeeDao.findOne(id);
        DetailDTO dto = new DetailDTO(false);
        if(emp==null){
            dto.setErrorCode(Setting.FAIURESTAT);
            dto.setErrorMessage("用户不存在");
            return dto;
        }
        String imageAddress = fullEmployeeDTO.getImageAddress();//头像
        String phone = fullEmployeeDTO.getPhone();//手机
        String email = fullEmployeeDTO.getEmail();//邮箱
        String signature = fullEmployeeDTO.getSignature();//签名
        String telephone = fullEmployeeDTO.getTelephone();//座机
        //头像有值,更新
        if(!Strings.isNullOrEmpty(imageAddress)){
            String imagePath=PathUtil.getRootPath()+Setting.USERIMAGE;
            File savedir=new File(imagePath);
            if(!savedir.exists()){
                savedir.mkdirs();
            }
            boolean flag = FileUtil.getInstance().saveFileToDisk(imageAddress,imagePath+"/"+emp.getId()+".jpg");
            if(flag){
                emp.setImageAddress(Setting.USERIMAGE+emp.getId()+".jpg");
            }
        }
        if(!Strings.isNullOrEmpty(phone)){
            emp.setPhone(phone);
        }
        if(!Strings.isNullOrEmpty(email)){
            emp.setEmail(email);
        }
        if(!Strings.isNullOrEmpty(signature)){
            emp.setSignature(signature);
        }
        if(!Strings.isNullOrEmpty(telephone)){
            emp.setTelephone(telephone);
        }
        employeeDao.save(emp);
        dto.setStatus(true);
        dto.setDetail(emp.getImageAddress());
        return dto;
    }
    /**
     * 查询用户的信息,根据旧密码,修改密码信息
     * @param oldPwd 旧密码
     * @param newPwd 新密码
     * @param id 用户主键id
     * @return 修改状态
     */
    @Transactional(readOnly=false)
    public RestStatus UpdateUserPwd(String oldPwd,String newPwd,Long id){
        KnUser user = userDao.findOne(id);
        RestStatus status = new RestStatus(false);
        if(user==null){
            status.setErrorCode(Setting.FAIURESTAT);
            status.setErrorMessage("用户不存在");
        }else{
            String password = XsimpleUserUtil.getInstance().encodeHexPassword(oldPwd,user.getSalt());
            //验证久密码是否正确,修改密码
            if(!user.getPassword().equals(password)){
                status.setErrorCode(Setting.FAIURESTAT);
                status.setErrorMessage("旧密码错误");
            }else{
                user.setPassword( XsimpleUserUtil.getInstance().encodeHexPassword(newPwd,user.getSalt()));
                userDao.save(user);
                status.setStatus(true);
            }
        }
        return status;
    }
}
