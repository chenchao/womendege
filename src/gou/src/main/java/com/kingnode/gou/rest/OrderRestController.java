package com.kingnode.gou.rest;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.google.common.collect.Lists;
import com.kingnode.diva.mapper.BeanMapper;
import com.kingnode.gou.alipay.util.AlipayNotify;
import com.kingnode.gou.dto.OrderReturnListDTO;
import com.kingnode.gou.dto.OrderSubmitDTO;
import com.kingnode.gou.dto.ShoppCommentDTO;
import com.kingnode.gou.entity.OrderDetail;
import com.kingnode.gou.entity.OrderHead;
import com.kingnode.gou.entity.OrderPay;
import com.kingnode.gou.entity.OrderReturnDetail;
import com.kingnode.gou.entity.ShoppCart;
import com.kingnode.gou.entity.ShoppComment;
import com.kingnode.gou.service.OrderService;
import com.kingnode.xsimple.rest.DetailDTO;
import com.kingnode.xsimple.rest.ListDTO;
import com.kingnode.xsimple.util.Users;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
/**
 * @author 58120775@qq.com (chenchao)
 */

@RestController
@RequestMapping({"/api/v1","/api/secure/v1/order"})
public class OrderRestController{
    private static org.slf4j.Logger logger=LoggerFactory.getLogger(OrderRestController.class);
    @Autowired
    private OrderService orderService;

    /**
     * 提交订单
     * @param dto
     * @return
     */
    @RequestMapping(value="/order/submit", method={RequestMethod.POST})
    public DetailDTO orderSumbit(@RequestBody OrderSubmitDTO dto){
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/detail/list，请先登录");
            return null;
        }
        int i = 0;
        if(dto != null){
            try{
                i = orderService.orderSubmit(dto);
            }catch(Exception e){
                logger.info("e:{}",e);
            }
        }
        if(i == 1){
            return new DetailDTO<String>(true);
        }else{
            return new DetailDTO<String>(true,i+"");
        }
    }

    /**
     * 获取订单列表
     * @param pageNo
     * @param pageSize
     * @param status
     * @return
     */
    @RequestMapping(value="/order/detail/list",method={RequestMethod.GET})
    public ListDTO<OrderReturnListDTO> queryOrders(@RequestParam(value="p",defaultValue = "0") Integer pageNo,@RequestParam(value="s",defaultValue = "10") Integer pageSize,
            @RequestParam(value="status") String  status){
        Map params = new HashMap();
        params.put("LIKE_status",StringUtils.isNotEmpty(status)?OrderHead.OrderStatus.valueOf(status):"");
        params.put("LIKE_userId",Users.id());
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/detail/list，请先登录");
            return null;
        }
        Page<OrderDetail> page=orderService.PageOrderDetail(params,pageNo,pageSize);
        List<OrderReturnListDTO> dtos=Lists.newArrayList();
        List<OrderDetail> orderDetails=page.getContent();

        if(orderDetails!=null&&orderDetails.size()>0){
            int count=0;
            for(OrderDetail detail : orderDetails){
                OrderReturnListDTO dto=BeanMapper.map(detail,OrderReturnListDTO.class);
                dto.setOrderNo(detail.getOrderNo());
                dto.setStatus(detail.getOrderHead().getStatus());
                dto.setImgPath("");
                dto.setProductName("");
                dto.setGuige(detail.getGuige());
                dtos.add(dto);
            }
        }
        return new ListDTO<>(true,dtos);
    }

    /**
     * 获取退货单列表
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value="/order/return/list",method={RequestMethod.GET})
    public ListDTO<OrderReturnListDTO> queryOrdersReturns(@RequestParam(value="p",defaultValue = "0") Integer pageNo,@RequestParam(value="s",defaultValue = "10") Integer pageSize
            ){
        Map params = new HashMap();
        params.put("LIKE_userId",Users.id());
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/detail/list，请先登录");
            return null;
        }
        Page<OrderReturnDetail> page=orderService.PageOrderReturn(params,pageNo,pageSize);
        List<OrderReturnListDTO> dtos=Lists.newArrayList();
        List<OrderReturnDetail> orderDetails=page.getContent();

        if(orderDetails!=null&&orderDetails.size()>0){
            int count=0;
            for(OrderReturnDetail detail : orderDetails){
                OrderReturnListDTO dto=BeanMapper.map(detail,OrderReturnListDTO.class);
                dto.setOrderNo(detail.getOrderDetail().getOrderNo());
                dto.setStatus(detail.getOrderDetail().getOrderHead().getStatus());
                dto.setImgPath("");
                dto.setProductName("");
                dto.setGuige(detail.getOrderDetail().getGuige());
                dtos.add(dto);
            }
        }
        return new ListDTO<>(true,dtos);
    }

    /**
     * 获取购物车商品列表
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value="/order/shoppcat/list",method={RequestMethod.GET})
    public ListDTO<OrderReturnListDTO> queryShoppcats(@RequestParam(value="p",defaultValue = "0") Integer pageNo,@RequestParam(value="s",defaultValue = "10") Integer pageSize
    ){
        Map params = new HashMap();
        params.put("LIKE_userId",Users.id());
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/detail/list，请先登录");
            return null;
        }
        Page<ShoppCart> page=orderService.PageShoppcat(params,pageNo,pageSize);
        List<OrderReturnListDTO> dtos=Lists.newArrayList();
        List<ShoppCart> orderDetails=page.getContent();

        if(orderDetails!=null&&orderDetails.size()>0){
            int count=0;
            for(ShoppCart detail : orderDetails){
                OrderReturnListDTO dto=BeanMapper.map(detail,OrderReturnListDTO.class);
                dto.setImgPath("");
                dto.setProductId(detail.getProductId());
                dto.setProductName("");
                dto.setPrice(BigDecimal.ZERO);
                dtos.add(dto);
            }
        }
        return new ListDTO<>(true,dtos);
    }

//    //提交完订单，付款成功后，调用接口，改变订单状态，同时增加支付记录
//    @RequestMapping(value="/order/pay", method={RequestMethod.POST})
//    public DetailDTO orderPay(@RequestParam(value="orderNo") String orderNo,@RequestParam(value="payStatus") OrderPay.PayStatus payStatus,@RequestParam(value="sourceType") OrderPay
//            .SourceType type,@RequestParam(value="remark") String remark,@RequestParam(value="money") BigDecimal
//             money){
//        if(Users.id() == null || Users.id()==0l){
//            logger.error("接口：/order/submit，请先登录");
//            return null;
//        }
//
//        int i = 0;
//        try{
//            i = orderService.OrderPay(orderNo,payStatus,type,money,remark);
//        }catch(Exception e){
//            logger.info("e:{}",e);
//        }
//
//        if(i == 1){
//            return new DetailDTO<String>(true);
//        }else{
//            return new DetailDTO<String>(true,i+"");
//        }
//    }


    //申请退货
    @RequestMapping(value="/order/return", method={RequestMethod.POST})
    public DetailDTO returnOrder(@RequestParam(value="orderNo") String orderDetailNo,@RequestParam(value="reason") String reason,@RequestParam
            (value="remark")String remark,@RequestParam(value="img1") String img1,@RequestParam(value="img2") String img2,@RequestParam(value="img3") String img3){
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/submit，请先登录");
            return null;
        }

        int i = 0;
        try{
            i = orderService.OrderReturn(orderDetailNo,reason,remark,img1,img2,img3);
        }catch(Exception e){
            logger.info("e:{}",e);
        }

        if(i == 1){
            return new DetailDTO<String>(true);
        }else{
            return new DetailDTO<String>(true,i+"");
        }
    }

    //增加购物车
    @RequestMapping(value="/order/add/shoppcat", method={RequestMethod.POST})
    public DetailDTO addShoppcat(@RequestParam(value="productId") Long productId,@RequestParam(value="count") int count){
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/submit，请先登录");
            return null;
        }

        int i = 0;
        try{
            i = orderService.SaveShoppcat(productId,count);
        }catch(Exception e){
            logger.info("e:{}",e);
        }

        if(i == 1){
            return new DetailDTO<String>(true);
        }else{
            return new DetailDTO<String>(true,i+"");
        }
    }

    /**
     * 获取商品评论呢
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value="/order/shoppcomment/list",method={RequestMethod.GET})
    public ListDTO<OrderReturnListDTO> queryShoppcomment(@RequestParam(value="p",defaultValue = "0") Integer pageNo,@RequestParam(value="s",defaultValue = "10") Integer pageSize
    ,@RequestParam(value="productId",defaultValue = "0") Long productId,@RequestParam(value="userId",defaultValue = "0") Long userId){
        Map params = new HashMap();
        params.put("LIKE_userId",Users.id());
        params.put("LIKE_productId",productId);
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/detail/list，请先登录");
            return null;
        }
        Page<ShoppComment> page=orderService.PageComment(params,pageNo,pageSize);
        List<OrderReturnListDTO> dtos=Lists.newArrayList();
        List<ShoppComment> orderDetails=page.getContent();

        if(orderDetails!=null&&orderDetails.size()>0){
            int count=0;
            for(ShoppComment detail : orderDetails){
                OrderReturnListDTO dto=BeanMapper.map(detail,OrderReturnListDTO.class);
                dto.setImgPath("");
                dto.setProductId(detail.getProductId());
                dto.setProductName("");
                dto.setPrice(BigDecimal.ZERO);
                dtos.add(dto);
            }
        }
        return new ListDTO<>(true,dtos);
    }

    //增加商品评论
    @RequestMapping(value="/order/add/shoppcomment", method={RequestMethod.POST})
    public DetailDTO addShoppcomment(@RequestBody ShoppCommentDTO dto){
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/submit，请先登录");
            return null;
        }

        int i = 0;
        try{
            i = orderService.SaveShoppComment(dto);
        }catch(Exception e){
            logger.info("e:{}",e);
        }

        if(i == 1){
            return new DetailDTO<String>(true);
        }else{
            return new DetailDTO<String>(true,i+"");
        }
    }

    //支付宝使调用接口
    @RequestMapping(value="/order/send_zhifubao", method={RequestMethod.POST})
    public DetailDTO sendZhifubao( @RequestParam(value="orderHeadNo") String orderHeadNo,@RequestParam(value="sourceType") OrderPay.SourceType sourceType){
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/submit，请先登录");
            return null;
        }

        String re= "";
        try{
            re = orderService.sendZhifubao(orderHeadNo,sourceType);
        }catch(Exception e){
            logger.info("e:{}",e);
        }
        return new DetailDTO<String>(true,re);
    }

    //支付宝使调用接口,同步返回接口
    @RequestMapping(value="/order/return_zhifubao", method={RequestMethod.POST})
    public DetailDTO returnSynZhifubao( @RequestParam(value="orderHeadNo") String orderHeadNo,@RequestParam(value="sourceType") OrderPay.SourceType sourceType,HttpServletRequest
            request){
        if(Users.id() == null || Users.id()==0l){
            logger.error("接口：/order/submit，请先登录");
            return null;
        }

        String re= "";
        try{
            Map<String,String> params = new HashMap<String,String>();
            Map requestParams = request.getParameterMap();
            for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
                }
                //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
                params.put(name, valueStr);
            }

            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
            //商户订单号

            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号

            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

            //计算得出通知验证结果
            boolean verify_result = AlipayNotify.verify(params);

            if(verify_result){//验证成功
                //////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码

                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
                    //判断该笔订单是否在商户网站中已经做过处理
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    //如果有做过处理，不执行商户的业务程序
                    re = orderService.returnSynZhifubao(out_trade_no,trade_no,trade_status,"0",params);
                }

                //该页面可做页面美工编辑
            }else{
                //该页面可做页面美工编辑
            }

        }catch(Exception e){
            logger.info("e:{}",e);
        }
        return new DetailDTO<String>(true,re);
    }




}
