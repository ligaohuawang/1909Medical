package com.qianfeng.entity;

public class TProduct {
    private Integer pid;

    private String pname;

    private String ptype;

    private Double price;

    private String pintroduction;

    private String pspecification;

    private String pfunction;

    private String ppicture;

    private Integer pstate;

    @Override
    public String toString() {
        return "TProduct{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", ptype='" + ptype + '\'' +
                ", price=" + price +
                ", pintroduction='" + pintroduction + '\'' +
                ", pspecification='" + pspecification + '\'' +
                ", pfunction='" + pfunction + '\'' +
                ", ppicture='" + ppicture + '\'' +
                ", pstate=" + pstate +
                ", pbrand='" + pbrand + '\'' +
                ", pptype=" + pptype +
                '}';
    }

    private String pbrand;

    private Integer pptype = 0;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPintroduction() {
        return pintroduction;
    }

    public void setPintroduction(String pintroduction) {
        this.pintroduction = pintroduction == null ? null : pintroduction.trim();
    }

    public String getPspecification() {
        return pspecification;
    }

    public void setPspecification(String pspecification) {
        this.pspecification = pspecification == null ? null : pspecification.trim();
    }

    public String getPfunction() {
        return pfunction;
    }

    public void setPfunction(String pfunction) {
        this.pfunction = pfunction == null ? null : pfunction.trim();
    }

    public String getPpicture() {
        return ppicture;
    }

    public void setPpicture(String ppicture) {
        this.ppicture = ppicture == null ? null : ppicture.trim();
    }

    public Integer getPstate() {
        return pstate;
    }

    public void setPstate(Integer pstate) {
        this.pstate = pstate;
    }

    public String getPbrand() {
        return pbrand;
    }

    public void setPbrand(String pbrand) {
        this.pbrand = pbrand == null ? null : pbrand.trim();
    }

    public Integer getPptype() {
        return pptype;
    }

    public void setPptype(Integer pptype) {
        this.pptype = pptype;
    }
}