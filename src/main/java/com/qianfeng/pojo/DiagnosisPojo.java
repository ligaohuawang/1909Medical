package com.qianfeng.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class DiagnosisPojo {

    private Integer nid;

    private String zxname;

    private Integer zxsex;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date zxbirthday;

    private String zxaddress;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date starttime;

    private Double bftime;

    private String zxaim;

    private Integer zxoid;

    private String xmname;

    private Integer uid;

    private String dname;

    private Double xmprice;

    private Date createtime;

    private Integer ostate;

    private Integer cancel;

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public Integer getZxoid() {
        return zxoid;
    }

    public void setZxoid(Integer zxoid) {
        this.zxoid = zxoid;
    }

    public String getXmname() {
        return xmname;
    }

    public void setXmname(String xmname) {
        this.xmname = xmname;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Double getXmprice() {
        return xmprice;
    }

    public void setXmprice(Double xmprice) {
        this.xmprice = xmprice;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getOstate() {
        return ostate;
    }

    public void setOstate(Integer ostate) {
        this.ostate = ostate;
    }

    public Integer getCancel() {
        return cancel;
    }

    public void setCancel(Integer cancel) {
        this.cancel = cancel;
    }

    public String getZxname() {
        return zxname;
    }

    public void setZxname(String zxname) {
        this.zxname = zxname;
    }

    public Integer getZxsex() {
        return zxsex;
    }

    public void setZxsex(Integer zxsex) {
        this.zxsex = zxsex;
    }

    public Date getZxbirthday() {
        return zxbirthday;
    }

    public void setZxbirthday(Date zxbirthday) {
        this.zxbirthday = zxbirthday;
    }

    public String getZxaddress() {
        return zxaddress;
    }

    public void setZxaddress(String zxaddress) {
        this.zxaddress = zxaddress;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Double getBftime() {
        return bftime;
    }

    public void setBftime(Double bftime) {
        this.bftime = bftime;
    }

    public String getZxaim() {
        return zxaim;
    }

    public void setZxaim(String zxaim) {
        this.zxaim = zxaim;
    }
}
