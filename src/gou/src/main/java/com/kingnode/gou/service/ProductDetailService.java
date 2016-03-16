package com.kingnode.gou.service;
import com.kingnode.gou.dao.ProductDao;
import com.kingnode.gou.dao.ProductDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 商品管理的品牌逻辑类
 */
@Service @Transactional(readOnly=true) public class ProductDetailService{
    @Autowired private ProductDao productDao;
    @Autowired private ProductDetailDao productDetailDao;
}
