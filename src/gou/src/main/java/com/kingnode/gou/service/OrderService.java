package com.kingnode.gou.service;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.google.common.collect.Lists;
import com.kingnode.diva.mapper.BeanMapper;
import com.kingnode.diva.persistence.DynamicSpecifications;
import com.kingnode.diva.persistence.SearchFilter;
import com.kingnode.gou.alipay.config.AlipayConfig;
import com.kingnode.gou.alipay.util.AlipaySubmit;
import com.kingnode.gou.dao.OrderDetailDao;
import com.kingnode.gou.dao.OrderHeadDao;
import com.kingnode.gou.dao.OrderPayDao;
import com.kingnode.gou.dao.OrderReturnDetailDao;
import com.kingnode.gou.dao.ShoppCartDao;
import com.kingnode.gou.dao.ShoppCommentDao;
import com.kingnode.gou.dto.OrderProductDTO;
import com.kingnode.gou.dto.OrderSubmitDTO;
import com.kingnode.gou.dto.ShoppCartDTO;
import com.kingnode.gou.dto.ShoppCommentDTO;
import com.kingnode.gou.dto.ShoppCommentImgDTO;
import com.kingnode.gou.entity.OrderDetail;
import com.kingnode.gou.entity.OrderHead;
import com.kingnode.gou.entity.OrderPay;
import com.kingnode.gou.entity.OrderReturnDetail;
import com.kingnode.gou.entity.ShoppCart;
import com.kingnode.gou.entity.ShoppComment;
import com.kingnode.gou.entity.ShoppCommentImg;
import com.kingnode.xsimple.api.common.DataTable;
import com.kingnode.xsimple.util.Users;
import org.joda.time.DateTime;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
/**
 * @author 58120775@qq.com (chenchao)
 */

@Component
@Transactional(readOnly=true)
public class OrderService{
    private static org.slf4j.Logger logger=LoggerFactory.getLogger(OrderService.class);
    private static int marchineNo = 1;
    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private OrderHeadDao orderHeadDao;
    @Autowired
    private ShoppCartDao shoppCartDao;
    @Autowired
    private ShoppCommentDao shoppCommentDao;
    @Autowired
    private OrderPayDao orderPayDao;
    @Autowired
    private OrderReturnDetailDao orderReturnDetailDao;


    /**
     * 获取购物车列表
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<ShoppCart> PageShoppCart(Map<String,Object> searchParams,int pageNumber,int pageSize){
        PageRequest pageRequest=new PageRequest(pageNumber-1,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Map<String,SearchFilter> filters=SearchFilter.parse(searchParams);
        Specification<ShoppCart> spec=DynamicSpecifications.bySearchFilter(filters.values());
        return shoppCartDao.findAll(spec,pageRequest);
    }

    /**
     * 获取一个星期的过期时间
     * @return
     */
    private long getOverdueTime(){
        return 7*24*60*60*1000;
    }

    /**
     * 是否在正常的退货时间内
     * @param orderTime
     * @return
     */
    public boolean isInNormalTime(long orderTime){
        long nowTime = new Date().getTime();
        return (nowTime-orderTime)>getOverdueTime();
    }

    /**
     * 保存购物车
     * @param productId
     * @param count
     * @return
     */
    @Transactional(readOnly = true)
    public int SaveShoppcat(Long productId,int count){
        ShoppCart cart = new ShoppCart();
        cart.setProductId(productId);
        cart.setQuatity(count);
        cart.setUserId(Users.id());
        cart.setStatus(ShoppCart.Status.activy);
        shoppCartDao.save(cart);
        return 1;
    }

    /**
     * 保存评论
     * @param dto
     * @return
     */
    public int SaveShoppComment(ShoppCommentDTO dto){
        ShoppComment comment = new ShoppComment();
        comment.setUserId(Users.id());
        comment.setProductId(dto.getProductId());
        comment.setContent(dto.getContent());
        comment.setLabel(dto.getLabel());
        comment.setScore(dto.getScore());


        List<ShoppCommentImg> commentImgs = Lists.newArrayList();
        if(dto.getCommentImgs() != null && dto.getCommentImgs().size()>0){
            for(ShoppCommentImgDTO imgDTO : dto.getCommentImgs()){
                ShoppCommentImg img = new ShoppCommentImg();
                img.setImgPath(imgDTO.getPath());
                commentImgs.add(img);
            }
        }

        //comment.setCommentImgs(commentImgs);
        shoppCommentDao.save(comment);
        return 1;
    }

    /**
     *
     * @param orderDetailNo
     * @param reson
     * @param remark
     * @param img1
     * @param img2
     * @param img3
     * @return 1申请退款成功 ， 2已过申请退款时间
     */
    @Transactional(readOnly = true)
    public int OrderReturn(String orderDetailNo,String reson,String remark,String img1,String img2,String img3){
        //先判断no是否在合适的状态
        OrderDetail detail = orderDetailDao.findByOrderNo(orderDetailNo);
        if(detail != null && isInNormalTime(detail.getCreateTime())){
            //往退款表中插入记录
            OrderReturnDetail returnDetail = new OrderReturnDetail();
            returnDetail.setMoney(detail.getPrice().multiply(new BigDecimal(detail.getQuatity()+"")));
            returnDetail.setImg1(img1);
            returnDetail.setImg2(img2);
            returnDetail.setImg3(img3);
            returnDetail.setOrderReturnNo("R"+detail.getOrderNo());
            returnDetail.setOrderDetail(detail);
            returnDetail.setStatus(OrderReturnDetail.ReturnStatus.daishenhe);
            orderReturnDetailDao.save(returnDetail);
        }
        return 2;
    }

//    /**
//     * 支付处理方法
//     * @param orderNo
//     * @param payStatus
//     * @return
//     */
//    @Transactional(readOnly = true)
//    public int OrderPay(String orderNo,OrderPay.PayStatus payStatus,OrderPay.SourceType type,BigDecimal money,String remark){
//        //修改订单头表状体
//        OrderHead head = orderHeadDao.findByOrderHeadNo(orderNo);
//
//        //增加支付记录，如果支付成功，则修改订单状态
//        OrderPay pay = new OrderPay();
//        pay.setUserId(Users.id());
//        pay.setMoney(money);
//        pay.setOrderHeadId(head.getId());
//        pay.setRemark(remark);
//        pay.setStatus(payStatus);
//        pay.setSourceType(type);
//        orderPayDao.save(pay);
//
//        if(payStatus ==OrderPay.PayStatus.success){
//            head.setStatus(OrderHead.OrderStatus.daifahuo);
//            orderHeadDao.save(head);
//        }
//        return 1;
//    }

    /**
     * 获取购物车列表
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<ShoppCart> PageShoppcat(final Map<String,Object> searchParams,int pageNumber,int pageSize){
        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Specification<ShoppCart> spec=new Specification<ShoppCart>(){
            @Override public Predicate toPredicate(Root<ShoppCart> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                if(searchParams.get("LIKE_userId")!=null && !"".equals(searchParams.get("LIKE_userId")) ){
                    predicates.add(cb.equal(root.<Long>get("userId"),Long.valueOf(searchParams.get("LIKE_userId").toString())));
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        return shoppCartDao.findAll(spec,pageRequest);
    }


    /**
     * 获取评论列表
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<ShoppComment> PageComment(final Map<String,Object> searchParams,int pageNumber,int pageSize){
        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Specification<ShoppComment> spec=new Specification<ShoppComment>(){
            @Override public Predicate toPredicate(Root<ShoppComment> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                if(searchParams.get("LIKE_userId")!=null && !"".equals(searchParams.get("LIKE_userId")) &&  Long.valueOf(searchParams.get("LIKE_userId").toString())>0){
                    predicates.add(cb.equal(root.<Long>get("userId"),Long.valueOf(searchParams.get("LIKE_userId").toString())));
                }
                if(searchParams.get("LIKE_productId")!=null && !"".equals(searchParams.get("LIKE_productId")) &&  Long.valueOf(searchParams.get("LIKE_productId").toString())>0){
                    predicates.add(cb.equal(root.<Long>get("productId"),Long.valueOf(searchParams.get("LIKE_productId").toString())));
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        return shoppCommentDao.findAll(spec,pageRequest);
    }

    /**
     * 获取退货列表
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<OrderReturnDetail> PageOrderReturn(final Map<String,Object> searchParams,int pageNumber,int pageSize){
        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Specification<OrderReturnDetail> spec=new Specification<OrderReturnDetail>(){
            @Override public Predicate toPredicate(Root<OrderReturnDetail> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                if(searchParams.get("LIKE_orderHeadId")!=null && !"".equals(searchParams.get("LIKE_orderHeadId")) ){
                    predicates.add(cb.equal(root.<OrderHead>get("orderHead").<Long>get("id"),Long.valueOf(searchParams.get("LIKE_orderHeadId").toString())));
                }
                if(searchParams.get("LIKE_status")!=null && !"".equals(searchParams.get("LIKE_status")) ){
                    predicates.add(cb.equal(root.<OrderHead>get("orderHead").<Long>get("status"),OrderHead.OrderStatus.valueOf(searchParams.get("LIKE_orderHeadId").toString())));
                }
                if(searchParams.get("LIKE_userId")!=null && !"".equals(searchParams.get("LIKE_userId")) &&  Long.valueOf(searchParams.get("LIKE_userId").toString())>0 ){
                    predicates.add(cb.equal(root.<OrderHead>get("orderHead").<Long>get("userId"),Long.valueOf(searchParams.get("LIKE_userId").toString())));
                }
                if(searchParams.get("title")!=null && !"".equals(searchParams.get("title")) ){
                    predicates.add(cb.like(root.<String>get("title"),searchParams.get("title").toString()));
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        return orderReturnDetailDao.findAll(spec,pageRequest);
    }

    /**
     * 获取订单详情列表
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<OrderDetail> PageOrderDetail(final Map<String,Object> searchParams,int pageNumber,int pageSize){
        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Map<String,SearchFilter> filters=SearchFilter.parse(searchParams);

//        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Specification<OrderDetail> spec=new Specification<OrderDetail>(){
            @Override public Predicate toPredicate(Root<OrderDetail> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                if(searchParams.get("LIKE_orderHeadId")!=null && !"".equals(searchParams.get("LIKE_orderHeadId")) ){
                    predicates.add(cb.equal(root.<OrderHead>get("orderHead").<Long>get("id"),Long.valueOf(searchParams.get("LIKE_orderHeadId").toString())));
                }
                if(searchParams.get("LIKE_status")!=null && !"".equals(searchParams.get("LIKE_status")) ){
                    predicates.add(cb.equal(root.<OrderHead>get("orderHead").<Long>get("status"),OrderHead.OrderStatus.valueOf(searchParams.get("LIKE_orderHeadId").toString())));
                }
                if(searchParams.get("LIKE_userId")!=null && !"".equals(searchParams.get("LIKE_userId")) &&  Long.valueOf(searchParams.get("LIKE_userId").toString())>0 ){
                    predicates.add(cb.equal(root.<OrderHead>get("orderHead").<Long>get("userId"),Long.valueOf(searchParams.get("LIKE_userId").toString())));
                }
                if(searchParams.get("title")!=null && !"".equals(searchParams.get("title")) ){
                    predicates.add(cb.like(root.<String>get("title"),searchParams.get("title").toString()));
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
//        Specification<OrderDetail> spec=DynamicSpecifications.bySearchFilter(filters.values());
        return orderDetailDao.findAll(spec,pageRequest);
    }

    /**
     * 获取订单头表列表
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<OrderHead> PageOrderHead(final Map<String,Object> searchParams,int pageNumber,int pageSize){
        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Map<String,SearchFilter> filters=SearchFilter.parse(searchParams);

        //        PageRequest pageRequest=new PageRequest(pageNumber,pageSize,new Sort(Sort.Direction.DESC,"id"));
        Specification<OrderHead> spec=new Specification<OrderHead>(){
            @Override public Predicate toPredicate(Root<OrderHead> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
                List<Predicate> predicates=Lists.newArrayList();
                if(searchParams.get("LIKE_counts")!=null && !"".equals(searchParams.get("LIKE_counts")) ){
                    predicates.add(cb.ge(root.<Integer>get("counts"),Integer.parseInt(searchParams.get("LIKE_counts").toString())));
                }

                if(searchParams.get("title")!=null && !"".equals(searchParams.get("title")) ){
                    predicates.add(cb.like(root.<String>get("title"),searchParams.get("title").toString()));
                }

                if(searchParams.get("LIKE_startTime")!=null && !"".equals(searchParams.get("LIKE_startTime"))){
                    predicates.add(cb.ge(root.<Long>get("createTime"),new DateTime(searchParams.get("LIKE_startTime").toString()).getMillis()));
                }
                if(searchParams.get("LIKE_endTime")!=null && !"".equals(searchParams.get("LIKE_endTime"))){
                    predicates.add(cb.le(root.<Long>get("createTime"),new DateTime(searchParams.get("LIKE_endTime").toString()).getMillis()));
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        //        Specification<OrderDetail> spec=DynamicSpecifications.bySearchFilter(filters.values());
        return orderHeadDao.findAll(spec,pageRequest);
    }

    /**
     * 提交订单
     * @param dto
     * @return
     */
    @Transactional(readOnly = false)
    public int orderSubmit(OrderSubmitDTO dto){
        if(dto != null){
            //生成订单头表
            OrderHead head =BeanMapper.map(dto,OrderHead.class);
            head.setStatus(OrderHead.OrderStatus.daifukuan);
            //根据商品算出商品总价格
            head.setFreight(getFreight(dto));
            String orderHeadNo = getOrderHeadNo(Users.id()+"");
            head.setOrderHeadNo(orderHeadNo);
            orderHeadDao.save(head);

            int count= 0;
            BigDecimal totalMoney = BigDecimal.ZERO;
            //生成订单详细表
            for(OrderProductDTO pid : dto.getProductDTOs()){
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderHead(head);
                String orderDetailNo = getOrderDetailNo(Users.id()+"");
                //TODO:获取商品信息
                BigDecimal orgPrice = BigDecimal.ZERO;
                BigDecimal price = BigDecimal.ZERO;
                for(;;){
                    //查询这个订单号是否已经存在
                    OrderDetail  details = orderDetailDao.findByOrderNo(orderDetailNo);
                    if(details != null){
                        orderDetailNo = getOrderDetailNo(Users.id()+"");
                    }else{
                        break;
                    }
                }
                count+=pid.getCount();
                totalMoney=totalMoney.add(price);
                orderDetail.setOrderNo(orderDetailNo);
                orderDetail.setOrgPrice(orgPrice);
                orderDetail.setPrice(price);
                orderDetail.setProductId(0l);
                orderDetail.setQuatity(pid.getCount());
                orderDetailDao.save(orderDetail);
            }

            //修改商品数量
            head.setMoney(totalMoney);
            head.setCounts(count);
            head.setUserId(Users.id());
            head.setUserName(Users.name());
            orderHeadDao.save(head);
        }
        return 1;
    }

    /**
     * 增加购物车
     * @param dto
     * @return
     */
    public int createShoppCart(ShoppCartDTO dto){
        //首先根据商品id，来查询用户是否已经购物车里有此产品，如有的话就是产品加1，如果没有就新增
        List<ShoppCart> shoppCarts = shoppCartDao.findByUserIdAndProductIdAndStatus(dto.getUserId(),dto.getProductId(),ShoppCart.Status.activy);
        if(shoppCarts != null && shoppCarts.size()>0){
            ShoppCart cart = shoppCarts.get(0);
            cart.setQuatity(cart.getQuatity()+1);
            shoppCartDao.save(cart);

        }else{
            ShoppCart cart =  BeanMapper.map(dto,ShoppCart.class);
            shoppCartDao.save(cart);
        }
        return 1;
    }

    /**
     * 获取商品总价钱
     * @param dto
     * @return
     */
    public BigDecimal getProductMoney(OrderSubmitDTO dto){
        return new BigDecimal("0");
    }

    public BigDecimal getFreight(OrderSubmitDTO dto){
        return new BigDecimal("0");
    }


    /**
     * 查询订单详情列表
     *
     * @param params
     * @param dt
     *
     * @return
     */
    public DataTable<OrderHead> PageOrderHead(final Map<String,Object> params,DataTable<OrderHead> dt){
        Page<OrderHead> page=PageOrderHead(params,dt.pageNo(),dt.getiDisplayLength());
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }

    /**
     * 查询退货详情列表
     *
     * @param params
     * @param dt
     *
     * @return
     */
    public DataTable<OrderReturnDetail> PageOrderReturn(final Map<String,Object> params,DataTable<OrderReturnDetail> dt){
        Page<OrderReturnDetail> page=PageOrderReturn(params,dt.pageNo(),dt.getiDisplayLength());
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }

    /**
     * 查询订单头表信息
     * @param id
     * @return
     */
    public OrderHead ReadOrderHead(long id){
        return orderHeadDao.findOne(id);
    }

    /**
     * 审核
     * @param id
     * @param status
     */
    @Transactional(readOnly = false)
    public void approveOrderReturn(Long id,String status){
        OrderReturnDetail detail = orderReturnDetailDao.findOne(id);
        detail.setStatus(OrderReturnDetail.ReturnStatus.valueOf(status));
        detail.setApproveTime(new Date().getTime());
        orderReturnDetailDao.save(detail);
    }

    /**
     * 保存或者修改
     * @param head
     */
    @Transactional(readOnly = false)
    public void SaveOrderHead(OrderHead head){
        orderHeadDao.save(head);
    }


    /**
     * 查询订单详情列表
     *
     * @param params
     * @param dt
     *
     * @return
     */
    public DataTable<OrderDetail> PageOrderDetail(final Map<String,Object> params,DataTable<OrderDetail> dt){
//        Sort.Direction d=Sort.Direction.DESC;
//        if("asc".equals(dt.getsSortDir_0())){
//            d=Sort.Direction.ASC;
//        }
//        String[] column=new String[]{"id","id","id","id","id","id"};
////        List<Sort.Order> orders=Lists.newArrayList();
////        Sort.Order order1=new Sort.Order(Sort.Direction.DESC,"pubDate");
////        Sort.Order order4=new Sort.Order(Sort.Direction.DESC,"createTime");
////        Sort.Order order2=new Sort.Order(Sort.Direction.DESC,"isTop");
////        Sort.Order order3=new Sort.Order(d,column[Integer.parseInt(dt.getiSortCol_0())]);
////        orders.add(order1);
////        orders.add(order2);
////        orders.add(order4);
////        orders.add(order3);
//        //orders.add(new Order(Sort.Direction.ASC,"createtime"));
//        Sort sort=new Sort(d,column[Integer.parseInt(dt.getiSortCol_0())]);
//        final String startTime=params.get("LIKE_startTime")!=null&&!"".equals(params.get("LIKE_startTime").toString())?params.get("LIKE_startTime").toString():"";
//        final String endTime=params.get("LIKE_endTime")!=null&&!"".equals(params.get("LIKE_endTime").toString())?params.get("LIKE_endTime").toString():"";
//        final String title=params.get("LIKE_title")!=null&&!"".equals(params.get("LIKE_title").toString())?"%"+params.get("LIKE_title").toString()+"%":"";
//        final String isTop=params.get("LIKE_isTop")!=null&&!"".equals(params.get("LIKE_isTop").toString())?params.get("LIKE_isTop").toString():"";
//        PageRequest pageRequest=new PageRequest(dt.pageNo(),dt.getiDisplayLength(),sort);
//        Specification<OrderDetail> spec=new Specification<OrderDetail>(){
//            @Override public Predicate toPredicate(Root<OrderDetail> root,CriteriaQuery<?> cq,CriteriaBuilder cb){
//                List<Predicate> predicates=Lists.newArrayList();
//                if(!Strings.isNullOrEmpty(startTime)){
//                    predicates.add(cb.ge(root.<Long>get("pubDate"),new DateTime(startTime).getMillis()));
//                }
//                if(!Strings.isNullOrEmpty(endTime)){
//                    predicates.add(cb.le(root.<Long>get("pubDate"),new DateTime(endTime).getMillis()));
//                }
//                if(!Strings.isNullOrEmpty(title)){
//                    predicates.add(cb.like(root.<String>get("title"),title));
//                }
//                if(!Strings.isNullOrEmpty(isTop)){
//                    predicates.add(cb.equal(root.<Boolean>get("isTop"),"true".equals(isTop)));
//                }
//                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
//            }
//        };
//
        Page<OrderDetail> page=PageOrderDetail(params,dt.pageNo(),dt.getiDisplayLength());
        dt.setiTotalDisplayRecords(page.getTotalElements());
        dt.setAaData(page.getContent());
        return dt;
    }

    /**
     * 获取详情订单号
     * 生成规则=年月日时分秒毫秒+机器码+3位数随机码+userId
     * @return
     */
    public  String getOrderDetailNo(String userId){
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
        String timeStr = sdf.format(new Date());
        String randStr = this.getRandom(100,999)+"";
        return timeStr+marchineNo+randStr+userId;
    }

    /**
     * 获取订单头表编号
     * 生成规则=年月日时分秒毫秒+机器码+userId
     * @return
     */
    public  String getOrderHeadNo(String userId){
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
        String timeStr = sdf.format(new Date());
        return timeStr+marchineNo+userId;
    }

    /**
     * 得到一个随机数
     * @param start
     * @param last
     * @return
     */
    public int getRandom(int start,int last){
        //i为种子的变量
        int rd;
        do{
            Random r =  new Random();
            rd = r.nextInt(last);
        }while(rd<start);
        return rd;
    }

    /**
     *
     * @param orderHeadNo
     * @return
     * @throws Exception
     */
    @Transactional(readOnly = false)
    public String sendZhifubao(String orderHeadNo,OrderPay.SourceType sourceType) throws Exception{
        OrderHead head = orderHeadDao.findByOrderHeadNo(orderHeadNo);
        if(head == null) throw new Exception("E001");
        String orderName = orderHeadNo;
        String money = head.getMoney().floatValue()+"";

        //把请求参数打包成数组
        Map<String, String> sParaTemp = new HashMap<String, String>();
        sParaTemp.put("service", AlipayConfig.service);
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("seller_id", AlipayConfig.seller_id);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
        sParaTemp.put("payment_type", AlipayConfig.payment_type);
        sParaTemp.put("notify_url", AlipayConfig.notify_url);
        sParaTemp.put("return_url", AlipayConfig.return_url);
        sParaTemp.put("anti_phishing_key", AlipaySubmit.query_timestamp());
//        sParaTemp.put("anti_phishing_key", AlipayConfig.anti_phishing_key);
        sParaTemp.put("exter_invoke_ip", AlipayConfig.exter_invoke_ip);
        sParaTemp.put("out_trade_no", orderHeadNo);
        sParaTemp.put("subject", orderName);
        sParaTemp.put("total_fee", money);
        sParaTemp.put("body", "");

        //这个时候开始存库
        OrderPay orderPay = new OrderPay();
        orderPay.setUserId(Users.id());

        orderPay.setMoney(head.getMoney());
        orderPay.setOrderNo(orderHeadNo);
        orderPay.setSourceType(sourceType);
        orderPay.setSubject(orderName);
        orderPay.setStatus("start");

        String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");

        orderPay.setPayBeforeStr(sHtmlText);
        orderPayDao.save(orderPay);

        return sHtmlText;
    }

    @Transactional(readOnly = false)
    public String returnSynZhifubao(String orderNo,String trandNo,String trandStatus,String money,Map<String,String> params){
        OrderPay orderPay = orderPayDao.findByOrderNoAndTradeNo(orderNo,trandNo);
        if("start".equals(orderPay.getStatus())){
            //说明没有处理过
            orderPay.setStatus("return");
            orderPay.setBeforeMoney(new BigDecimal(money));
            String str = "";//TODO:这里吧返回参数map转换成字符串
            orderPay.setPayAfterStr(str);
            orderPay.setBeforeMoney(new BigDecimal(money));
            orderPay.setPayStatus(trandStatus);
            orderPayDao.save(orderPay);
            return "1";
        }
        return null;
    }

    @Transactional(readOnly = false)
    public String returnDynZhifubao(String orderNo,String trandNo,String trandStatus,String money,Map<String,String> params){
        OrderPay orderPay = orderPayDao.findByOrderNoAndTradeNo(orderNo,trandNo);
        if("return".equals(orderPay.getStatus())){
            //说明没有处理过
            orderPay.setStatus("return");
            orderPay.setBeforeMoney(new BigDecimal(money));
            String str = "";//TODO:这里吧返回参数map转换成字符串
            orderPay.setPayAfterStr(str);
            orderPay.setAfterDaynMoney(new BigDecimal(money));
            orderPay.setPayStatus(trandStatus);
            orderPayDao.save(orderPay);
            return "1";
        }
        return null;
    }


    public void setOrderDetailDao(OrderDetailDao orderDetailDao){
        this.orderDetailDao=orderDetailDao;
    }

    public OrderDetailDao getOrderDetailDao(){
        return orderDetailDao;
    }
    public OrderHeadDao getOrderHeadDao(){
        return orderHeadDao;
    }
    public void setOrderHeadDao(OrderHeadDao orderHeadDao){
        this.orderHeadDao=orderHeadDao;
    }
    public ShoppCartDao getShoppCartDao(){
        return shoppCartDao;
    }
    public void setShoppCartDao(ShoppCartDao shoppCartDao){
        this.shoppCartDao=shoppCartDao;
    }
    public OrderPayDao getOrderPayDao(){
        return orderPayDao;
    }
    public void setOrderPayDao(OrderPayDao orderPayDao){
        this.orderPayDao=orderPayDao;
    }
    public OrderReturnDetailDao getOrderReturnDetailDao(){
        return orderReturnDetailDao;
    }
    public void setOrderReturnDetailDao(OrderReturnDetailDao orderReturnDetailDao){
        this.orderReturnDetailDao=orderReturnDetailDao;
    }
    public ShoppCommentDao getShoppCommentDao(){
        return shoppCommentDao;
    }
    public void setShoppCommentDao(ShoppCommentDao shoppCommentDao){
        this.shoppCommentDao=shoppCommentDao;
    }
}
