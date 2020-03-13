package com.qianfeng.entity;

import java.util.Date;

public class TProductOrder {
    private Integer orderNumber;//订单编号 自动生成 y

    private String shouhuorenphone;//收货人电话  y

    private Double orderPrice;//订单总价，也就是实付金额

    private Date createTime;//创建时间，当前时间 y

    private Integer orderStatus;//订单状态未支付 y

    private Integer uid;//用户id 从session取 y

    private Integer addressId;//地址id y

    private String payMethod;//支付方式 y

    private String expressMethod;//邮寄方式 y

    private String shouhuoren;//收货人 y

    private Integer pid;//商品id   y

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getShouhuorenphone() {
        return shouhuorenphone;
    }

    public void setShouhuorenphone(String shouhuorenphone) {
        this.shouhuorenphone = shouhuorenphone == null ? null : shouhuorenphone.trim();
    }

    public Double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod == null ? null : payMethod.trim();
    }

    public String getExpressMethod() {
        return expressMethod;
    }

    public void setExpressMethod(String expressMethod) {
        this.expressMethod = expressMethod == null ? null : expressMethod.trim();
    }

    public String getShouhuoren() {
        return shouhuoren;
    }

    public void setShouhuoren(String shouhuoren) {
        this.shouhuoren = shouhuoren == null ? null : shouhuoren.trim();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}