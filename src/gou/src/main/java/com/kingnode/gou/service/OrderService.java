package com.kingnode.gou.service;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.kingnode.gou.dao.OrderDetailDao;
import com.kingnode.gou.dao.OrderHeadDao;
import com.kingnode.gou.dao.OrderPayDao;
import com.kingnode.gou.dao.OrderReturnDetailDao;
import com.kingnode.gou.dao.ShoppCartDao;
import com.kingnode.gou.dto.OrderProductDTO;
import com.kingnode.gou.dto.OrderSubmitDTO;
import com.kingnode.gou.dto.ShoppCartDTO;
import com.kingnode.gou.entity.OrderDetail;
import com.kingnode.gou.entity.OrderHead;
import com.kingnode.gou.entity.OrderPay;
import com.kingnode.gou.entity.OrderReturnDetail;
import com.kingnode.gou.entity.ShoppCart;
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
     * 支付处理方法
     * @param orderNo
     * @param payStatus
     * @return
     */
    @Transactional(readOnly = true)
    public int OrderPay(String orderNo,OrderPay.PayStatus payStatus,OrderPay.SourceType type,BigDecimal money,String remark){
        //修改订单头表状体
        OrderHead head = orderHeadDao.findByOrderHeadNo(orderNo);

        //增加支付记录，如果支付成功，则修改订单状态
        OrderPay pay = new OrderPay();
        pay.setUserId(Users.id());
        pay.setMoney(money);
        pay.setOrderHeadId(head.getId());
        pay.setRemark(remark);
        pay.setStatus(payStatus);
        pay.setSourceType(type);
        orderPayDao.save(pay);

        if(payStatus ==OrderPay.PayStatus.success){
            head.setStatus(OrderHead.OrderStatus.daifahuo);
            orderHeadDao.save(head);
        }
        return 1;
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
                if(searchParams.get("LIKE_userId")!=null && !"".equals(searchParams.get("LIKE_userId")) ){
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
                if(searchParams.get("LIKE_userId")!=null && !"".equals(searchParams.get("LIKE_userId")) ){
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
                    List<OrderDetail>  details = orderDetailDao.findByOrderNo(orderDetailNo);
                    if(details != null && details.size() > 0){
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
}
