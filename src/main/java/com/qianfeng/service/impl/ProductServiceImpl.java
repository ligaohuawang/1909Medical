package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TProduct;
import com.qianfeng.entity.TUser;
import com.qianfeng.mapper.TProductMapper;
import com.qianfeng.mapper.TShopcarMapper;
import com.qianfeng.model.ShopcarModel;
import com.qianfeng.pojo.ConfirmOrder;
import com.qianfeng.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ProductServiceImpl extends BaseServiceImpl<TProduct> implements IProductService {
    @Autowired
    private TProductMapper tProductMapper;
    @Autowired
    private TShopcarMapper shopcarMapper;

    @Override
    public IBaseDao<TProduct> getDao() {
        return tProductMapper;
    }

    @Override
    public List<String> queryType(TProduct product) {
        return tProductMapper.queryType(product);
    }

    @Override
    public List<String> queryFunction(TProduct product) {
        return tProductMapper.queryFunction(product);
    }

    @Override
    public List<String> queryBrand(TProduct product) {
        return tProductMapper.queryBrand(product);
    }

    @Override
    public List<TProduct> queryProductList(TProduct product) {
        //System.out.println(product);
        return tProductMapper.queryProductList(product);

    }

    @Override
    public List<ShopcarModel> queryShopcar(Integer uid) {
        return shopcarMapper.queryShopcar(uid);
    }

    @Override
    public TProduct queryProductById(int pid) {
        return tProductMapper.queryProductById(pid);
    }

    @Override
    public SysResult addShopcar(int pid, int number, HttpSession session) {
        SysResult sysResult = new SysResult();
        TUser user = (TUser) session.getAttribute("user");
        if (user == null) {
            sysResult.setResult(false);
            sysResult.setData("请先登录");
            return sysResult;
        }
        int a = shopcarMapper.addShopcar(pid, user.getUid(), number);

        //  System.out.println(user+"-----------------"+pid+"-----------"+number);
        if (a > 0) {
            sysResult.setResult(true);
        } else {
            sysResult.setResult(false);
            sysResult.setData("加入购物车失败");
        }
        return sysResult;
    }

    @Override
    public SysResult addNumber(int sid) {
        return shopcarMapper.addNumber(sid);
    }

    @Override
    public SysResult cutNumber(int sid) {
        return shopcarMapper.cutNumber(sid);
    }

    @Override
    public List<ConfirmOrder> selectProductFromByUidAndPid(List<Integer> idArray, Integer uid) {
        List<ConfirmOrder> confirmOrderList = tProductMapper.selectProductFromByUidAndPid(idArray, uid);
        return confirmOrderList;
    }


}
