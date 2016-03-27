package com.kingnode.gou.controller;

import java.math.BigDecimal;
import java.util.Map;
import javax.servlet.ServletRequest;

import com.kingnode.diva.web.Servlets;
import com.kingnode.gou.entity.OrderDetail;
import com.kingnode.gou.entity.OrderHead;
import com.kingnode.gou.entity.OrderReturnDetail;
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
@RequestMapping(value="/order")
public class OrderController{
    @Autowired
    private OrderService orderService;

    /**
     * 新闻分类管理首页
     *
     * @return jsp文件
     */
    @RequestMapping(method=RequestMethod.GET)
    public String home(Model model){
        return "order/orderHeadList";
    }

    @RequestMapping(value = "return/list",method=RequestMethod.GET)
    public String returnInit(Model model){
        return "order/orderReturnList";
    }

    /**
     * 新闻分类管理首页
     *
     * @return jsp文件
     */
    @RequestMapping(value = "detail/list",method=RequestMethod.POST)
    @ResponseBody
    public DataTable<OrderDetail> detailList(DataTable<OrderDetail> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        return orderService.PageOrderDetail(searchParams,dt);
    }

    /**
     * 新闻分类管理首页
     *
     * @return jsp文件
     */
    @RequestMapping(value = "head/list",method=RequestMethod.POST)
    @ResponseBody
    public DataTable<OrderHead> headList(DataTable<OrderHead> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        return orderService.PageOrderHead(searchParams,dt);
    }

    /**
     * 返回退款列表
     *
     * @return jsp文件
     */
    @RequestMapping(value = "return/list",method=RequestMethod.POST)
    @ResponseBody
    public DataTable<OrderReturnDetail> returnList(DataTable<OrderReturnDetail> dt,ServletRequest request){
        Map<String,Object> searchParams=Servlets.getParametersStartingWith(request,"search_");
        return orderService.PageOrderReturn(searchParams,dt);
    }

    /**
     * 新闻详情
     */
    @RequestMapping(value="head/detail/{id}", method=RequestMethod.GET)
    public String detail( @PathVariable("id") Long id,Model model){
        model.addAttribute("orderHead",orderService.ReadOrderHead(id));
        return "order/orderHeadForm";
    }

    /**
     * 退货申请
     * @param id
     * @param status
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="return/approve", method=RequestMethod.POST)
    @ResponseBody
    public String approveOrderReturn( @RequestParam("id") Long id,@RequestParam("status") String status,RedirectAttributes redirectAttributes){
        orderService.approveOrderReturn(id,status);
        redirectAttributes.addFlashAttribute("message","更新订单成功");
        return "redirect:/order";
    }

    /**
     * 修改订单状态
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="update", method=RequestMethod.POST)
    public String update(Long id,String status,String logisticsComp,String freight,String logisticsNo,RedirectAttributes redirectAttributes){
        OrderHead orderHead = orderService.ReadOrderHead(id);
        //orderHead.setStatus(status);
        orderHead.setLogisticsComp(logisticsComp);
        orderHead.setFreight(new BigDecimal(freight));
        orderHead.setLogisticsNo(logisticsNo);
        orderService.SaveOrderHead(orderHead);
        redirectAttributes.addFlashAttribute("message","更新订单成功");
        return "redirect:/order";
    }

    @ModelAttribute
    public void ReadOrderHead(@RequestParam(value="id", defaultValue="-1") Long id,Model model){
        if(id!=-1){
            model.addAttribute("orderHead",orderService.ReadOrderHead(id));
        }
    }
}
