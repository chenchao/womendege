package com.kingnode.xsimple.rest;
import com.kingnode.xsimple.dto.FullEmployeeDTO;
import com.kingnode.xsimple.service.system.EmployeeService;
import com.kingnode.xsimple.util.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
/**
 * 员工的rest控制器接口信息
 * @author cici
 */
@RestController @RequestMapping({"/api/v1/emp"}) public class EmployeeRestController{
    @Autowired
    private EmployeeService employeeService;

    /**
     * 更新用户信息
     *
     * @param fullEmployeeDTO 用户对象信息
     *
     * @return
     */
    @RequestMapping(value="update", method={RequestMethod.POST})
    public DetailDTO Update(FullEmployeeDTO fullEmployeeDTO){
        return employeeService.UpdateUserInfo(fullEmployeeDTO,fullEmployeeDTO.getId());
    }
    /**
     * 更新用户的密码信息
     *
     * @param oldPwd 旧密码
     * @param newPwd 新密码
     * @return
     */
    @RequestMapping(value="update-pwd", method={RequestMethod.POST})
    public RestStatus UpdatePwd(@RequestParam(value="old") String oldPwd,@RequestParam(value="new") String newPwd){
        return employeeService.UpdateUserPwd(oldPwd,newPwd,Users.id());
    }
}
