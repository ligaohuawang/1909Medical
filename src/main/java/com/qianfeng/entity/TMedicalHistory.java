package com.qianfeng.entity;

/**
 * 历史病例
 */
public class TMedicalHistory {

    private Integer hid;

    private Integer uid;

    private String zxname;

    private String hname;

    private String hhospital;

    private String hhow;

    private String hdoctor;

    private Integer hstate;

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getZxname() {
        return zxname;
    }

    public void setZxname(String zxname) {
        this.zxname = zxname == null ? null : zxname.trim();
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname == null ? null : hname.trim();
    }

    public String getHhospital() {
        return hhospital;
    }

    public void setHhospital(String hhospital) {
        this.hhospital = hhospital == null ? null : hhospital.trim();
    }

    public String getHhow() {
        return hhow;
    }

    public void setHhow(String hhow) {
        this.hhow = hhow == null ? null : hhow.trim();
    }

    public String getHdoctor() {
        return hdoctor;
    }

    public void setHdoctor(String hdoctor) {
        this.hdoctor = hdoctor == null ? null : hdoctor.trim();
    }

    public Integer getHstate() {
        return hstate;
    }

    public void setHstate(Integer hstate) {
        this.hstate = hstate;
    }

}