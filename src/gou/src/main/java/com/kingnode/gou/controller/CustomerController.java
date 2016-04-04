package com.kingnode.gou.controller;

import java.math.BigDecimal;
import java.util.Map;
import javax.servlet.ServletRequest;

import com.kingnode.diva.web.Servlets;
import com.kingnode.gou.entity.Activity;
import com.kingnode.gou.entity.Customer;
import com.kingnode.gou.entity.OrderDetail;
import com.kingnode.gou.entity.OrderHead;
import com.kingnode.gou.entity.OrderReturnDetail;
import com.kingnode.gou.service.CustomerService;
import com.kingnode.gou.service.OrderService;
import com.kingnode.xsimple.api.common.DataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 * 新闻内容管理
 *
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@Controller
@RequestMapping(value="/customer")
public class CustomerController{
    @Autowired
    private CustomerService customerService;

    /**
     * 新闻分类管理首页
     *
     * @return jsp文件
     */
    @RequestMapping(method=RequestMethod.GET)
    public String home(Model model){
        return "/customer/customerList";
    }
    @RequestMapping(value="list", method=RequestMethod.POST) @ResponseBody public DataTable<Customer> list(DataTable<Customer> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        return customerService.PageCustomers(searchParams,dt);
    }
    @RequestMapping(value="detail/{id}", method=RequestMethod.GET) public String detail(@PathVariable("id") Long id,Model model){
        model.addAttribute("customer",customerService.readCustomer(id));
        model.addAttribute("addresses",customerService.getAddresses(id));
        return "customer/customerView";
    }
}
