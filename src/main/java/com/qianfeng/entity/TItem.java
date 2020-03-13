package com.qianfeng.entity;

public class TItem {
    private Integer xmid;

    private String xmname;

    private Double xmprice;

    private Integer xmstate;

    public Integer getXmid() {
        return xmid;
    }

    public void setXmid(Integer xmid) {
        this.xmid = xmid;
    }

    public String getXmname() {
        return xmname;
    }

    public void setXmname(String xmname) {
        this.xmname = xmname == null ? null : xmname.trim();
    }

    public Double getXmprice() {
        return xmprice;
    }

    public void setXmprice(Double xmprice) {
        this.xmprice = xmprice;
    }

    public Integer getXmstate() {
        return xmstate;
    }

    public void setXmstate(Integer xmstate) {
        this.xmstate = xmstate;
    }

    @Override
    public String toString() {
        return "TItem{" +
                "xmid=" + xmid +
                ", xmname='" + xmname + '\'' +
                ", xmprice=" + xmprice +
                ", xmstate=" + xmstate +
                '}';
    }
}