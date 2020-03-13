package com.qianfeng.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TZxnews {
    private Integer nid;

    private Integer zxoid;

    private String zxname;

    private Integer zxsex;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date zxbirthday;

    private String zxaddress;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date starttime;

    private Double bftime;

    private String zxaim;

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

    public String getZxname() {
        return zxname;
    }

    public void setZxname(String zxname) {
        this.zxname = zxname == null ? null : zxname.trim();
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
        this.zxaddress = zxaddress == null ? null : zxaddress.trim();
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
        this.zxaim = zxaim == null ? null : zxaim.trim();
    }
}