package com.qianfeng.entity;

public class TAddress {
    private Integer addressId;

    private String shouhuoren;

    private String phone;

    private String addressname;

    private Integer uid;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getShouhuoren() {
        return shouhuoren;
    }

    public void setShouhuoren(String shouhuoren) {
        this.shouhuoren = shouhuoren == null ? null : shouhuoren.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddressname() {
        return addressname;
    }

    public void setAddressname(String addressname) {
        this.addressname = addressname == null ? null : addressname.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "TAddress{" +
                "addressId=" + addressId +
                ", shouhuoren='" + shouhuoren + '\'' +
                ", phone='" + phone + '\'' +
                ", addressname='" + addressname + '\'' +
                ", uid=" + uid +
                '}';
    }
}