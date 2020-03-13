package com.qianfeng.entity;

import java.util.Date;

public class TZxorder {
    private Integer zxoid;

    private String xmname;

    private Integer uid;

    private String dname;

    private Double xmprice;

    private Date createtime;

    private Integer ostate;

    private Integer cancel;

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
        this.xmname = xmname == null ? null : xmname.trim();
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
        this.dname = dname == null ? null : dname.trim();
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
}