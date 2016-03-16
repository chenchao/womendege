package com.kingnode.gou.service;
import com.kingnode.gou.dao.ProductBrandDao;
import com.kingnode.gou.dao.ProductCatalogAttrDao;
import com.kingnode.gou.dao.ProductCatalogAttrValDao;
import com.kingnode.gou.dao.ProductCatalogDao;
import com.kingnode.gou.dao.ProductClassDao;
import com.kingnode.gou.dao.ProductDao;
import com.kingnode.gou.dao.ProductDetailDao;
import com.kingnode.gou.dao.ProductPictureDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * 商品管理的基础逻辑类
 */
@Service @Transactional(readOnly=true) public class ProductBaseService{
    @Autowired private ProductBrandDao brandDao;
    @Autowired private ProductCatalogAttrDao catalogAttrDao;
    @Autowired private ProductCatalogAttrValDao catalogAttrValDao;
    @Autowired private ProductCatalogDao catalogDao;
    @Autowired private ProductClassDao classDao;
    @Autowired private ProductDao productDao;
    @Autowired private ProductDetailDao detailDao;
    @Autowired private ProductPictureDao pictureDao;
}
